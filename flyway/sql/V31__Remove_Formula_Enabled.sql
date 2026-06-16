-- Removes the formula_enabled flag from the remaining tables that had it.
-- FixedAllowance (V29) and FixedDeduction (V20) were already migrated to the
-- formula-presence pattern: a non-blank `formula` column is itself the signal
-- that the formula should be used, so the separate enable flag is redundant.
-- This migration brings the same convention to the rest: bonus, overtime,
-- nopay, nopay_days, late_deduction, gratuity.
--
-- Note: late_deduction_config and gratuity_config were renamed to
-- late_deduction and gratuity respectively in V6 — use the current names.
--
-- "DROP COLUMN IF EXISTS" isn't reliable across all MySQL/MariaDB versions
-- (MySQL only added it in 8.0.29), so a guarded dynamic-SQL helper is used
-- instead — also makes this safe to re-run after a partial failure.

DELIMITER ;;
CREATE PROCEDURE _drop_formula_enabled_if_exists(IN tbl VARCHAR(64))
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = DATABASE()
          AND table_name = tbl
          AND column_name = 'formula_enabled'
    ) THEN
        SET @sql = CONCAT('ALTER TABLE `', tbl, '` DROP COLUMN formula_enabled');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END ;;
DELIMITER ;

CALL _drop_formula_enabled_if_exists('bonus');
CALL _drop_formula_enabled_if_exists('overtime');
CALL _drop_formula_enabled_if_exists('nopay');
CALL _drop_formula_enabled_if_exists('nopay_days');
CALL _drop_formula_enabled_if_exists('late_deduction');
CALL _drop_formula_enabled_if_exists('gratuity');

DROP PROCEDURE _drop_formula_enabled_if_exists;

-- ─────────────────────────────────────────────────────────────────────────
-- Recreate sp_get_payroll_run_review: its has_formula CASE expression read
-- fa.formula_enabled / ot.formula_enabled / nd.formula_enabled directly.
-- fa.formula_enabled was already dropped in V29 with no compensating fix,
-- so this procedure has been broken since then; ot/nd would break here too.
-- Replace all three with the formula-presence pattern already used for FD.
-- ─────────────────────────────────────────────────────────────────────────

DROP PROCEDURE IF EXISTS `sp_get_payroll_run_review`;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_payroll_run_review`(
    IN p_payroll_month VARCHAR(20)
)
BEGIN
    /*
     * Returns one row per employee × component for the given payroll month.
     *
     * Columns:
     *   emp_id           employee_no (display code)
     *   emp_name         first + last name
     *   component_type   FA | FD | VA | VD | OT | NOPAY | SA
     *   component_code   short code from master table
     *   component_name   human-readable label
     *   has_formula      Y / N  — whether a formula was configured on the master
     *   formula_expr     the formula string (NULL if none)
     *   before_value     amount entered in batch (source entry table)
     *   after_value      amount computed by the payroll engine (run detail)
     *   difference       after_value - before_value
     *   run_status       DRAFT | LOCKED | CORRECTION_DRAFT | CORRECTION_LOCKED
     *
     * "before" = the value recorded in emp_fa / emp_fd / emp_va / emp_vd /
     *            emp_ot / emp_np / emp_sal_adv at the time of batch entry.
     * "after"  = the value written to emp_payroll_run_detail by the engine.
     *
     * Statutory deductions (EPF_EE, EPF_ER, ETF, PAYE) are excluded because
     * they have no "entered" amount — they are always computed.
     */

    SELECT
        e.employee_no                                       AS emp_id,
        CONCAT(e.first_name, ' ', e.last_name)             AS emp_name,
        rd.component_type,
        rd.component_code,
        rd.component_name,

        -- formula flag, derived from formula presence on the component master
        CASE rd.component_type
            WHEN 'FA'    THEN CASE WHEN NULLIF(TRIM(fa.formula), '') IS NOT NULL THEN 'Y' ELSE 'N' END
            WHEN 'FD'    THEN CASE WHEN NULLIF(TRIM(fd.formula), '') IS NOT NULL THEN 'Y' ELSE 'N' END
            WHEN 'OT'    THEN CASE WHEN NULLIF(TRIM(ot.formula), '') IS NOT NULL THEN 'Y' ELSE 'N' END
            WHEN 'NOPAY' THEN CASE WHEN NULLIF(TRIM(nd.formula), '') IS NOT NULL THEN 'Y' ELSE 'N' END
            ELSE 'N'
        END                                                 AS has_formula,

        -- formula expression (informational only)
        CASE rd.component_type
            WHEN 'FA'    THEN fa.formula
            WHEN 'FD'    THEN fd.formula
            WHEN 'OT'    THEN ot.formula
            WHEN 'NOPAY' THEN nd.formula
            ELSE NULL
        END                                                 AS formula_expr,

        -- before value: what was entered in the batch source tables
        CASE rd.component_type
            WHEN 'FA'    THEN COALESCE(efa.amount,     0)
            WHEN 'FD'    THEN COALESCE(efd.amount,     0)
            WHEN 'VA'    THEN COALESCE(eva.amount,     0)
            WHEN 'VD'    THEN COALESCE(evd.amount,     0)
            WHEN 'OT'    THEN COALESCE(eot.amount,     0)
            WHEN 'NOPAY' THEN COALESCE(enp.amount,     0)
            WHEN 'SA'    THEN COALESCE(esa.amount,     0)
            ELSE rd.amount
        END                                                 AS before_value,

        -- after value: what the engine computed
        rd.amount                                           AS after_value,

        -- difference (positive = engine added value, negative = engine reduced)
        (rd.amount - CASE rd.component_type
            WHEN 'FA'    THEN COALESCE(efa.amount,     0)
            WHEN 'FD'    THEN COALESCE(efd.amount,     0)
            WHEN 'VA'    THEN COALESCE(eva.amount,     0)
            WHEN 'VD'    THEN COALESCE(evd.amount,     0)
            WHEN 'OT'    THEN COALESCE(eot.amount,     0)
            WHEN 'NOPAY' THEN COALESCE(enp.amount,     0)
            WHEN 'SA'    THEN COALESCE(esa.amount,     0)
            ELSE 0
        END)                                                AS difference,

        r.status                                            AS run_status

    FROM emp_payroll_run r

    JOIN employee e
        ON e.id = r.emp_id

    JOIN emp_payroll_run_detail rd
        ON rd.run_id = r.id

    -- ── Fixed Allowance ──────────────────────────────────────────────────
    LEFT JOIN fixed_allowance fa
        ON rd.component_type = 'FA'
       AND fa.code = rd.component_code

    LEFT JOIN emp_fa efa
        ON rd.component_type = 'FA'
       AND efa.emp_id   = r.emp_id
       AND efa.fa_id    = fa.id
       AND efa.payroll_month = p_payroll_month

    -- ── Fixed Deduction ──────────────────────────────────────────────────
    LEFT JOIN fixed_deduction fd
        ON rd.component_type = 'FD'
       AND fd.code = rd.component_code

    LEFT JOIN emp_fd efd
        ON rd.component_type = 'FD'
       AND efd.emp_id   = r.emp_id
       AND efd.fd_id    = fd.id
       AND efd.payroll_month = p_payroll_month

    -- ── Variable Allowance ───────────────────────────────────────────────
    LEFT JOIN variable_allowance va
        ON rd.component_type = 'VA'
       AND va.code = rd.component_code

    LEFT JOIN emp_va eva
        ON rd.component_type = 'VA'
       AND eva.emp_id   = r.emp_id
       AND eva.va_id    = va.id
       AND eva.payroll_month = p_payroll_month

    -- ── Variable Deduction ───────────────────────────────────────────────
    LEFT JOIN variable_deduction vd
        ON rd.component_type = 'VD'
       AND vd.code = rd.component_code

    LEFT JOIN emp_vd evd
        ON rd.component_type = 'VD'
       AND evd.emp_id   = r.emp_id
       AND evd.vd_id    = vd.id
       AND evd.payroll_month = p_payroll_month

    -- ── Overtime ─────────────────────────────────────────────────────────
    LEFT JOIN overtime ot
        ON rd.component_type = 'OT'
       AND ot.code = rd.component_code

    LEFT JOIN emp_ot eot
        ON rd.component_type = 'OT'
       AND eot.emp_id      = r.emp_id
       AND eot.overtime_id = ot.id
       AND eot.payroll_month = p_payroll_month

    -- ── NoPay ────────────────────────────────────────────────────────────
    LEFT JOIN nopay_days nd
        ON rd.component_type = 'NOPAY'
       AND nd.code = rd.component_code

    LEFT JOIN emp_np enp
        ON rd.component_type = 'NOPAY'
       AND enp.emp_id    = r.emp_id
       AND enp.nopay_id  = nd.id
       AND enp.payroll_month = p_payroll_month

    -- ── Salary Advance ────────────────────────────────────────────────────
    LEFT JOIN emp_sal_adv esa
        ON rd.component_type = 'SA'
       AND esa.emp_id        = r.emp_id
       AND esa.payroll_month = p_payroll_month

    WHERE r.payroll_month = p_payroll_month
      AND rd.component_type NOT IN ('EPF_EE', 'EPF_ER', 'ETF', 'PAYE')

    ORDER BY e.employee_no, rd.component_type, rd.component_name;

END ;;
DELIMITER ;
