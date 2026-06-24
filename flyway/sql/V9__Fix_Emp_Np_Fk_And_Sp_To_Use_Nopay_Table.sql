-- V9: Fix emp_np.nopay_id FK to reference nopay (types) instead of nopay_days (config).
--     Update sp_emp_np_pivot and sp_rpt_nopay to join on nopay instead of nopay_days.
--
-- Background:
--   - nopay       = NoPay TYPES  (e.g. Unauthorised Absence, Maternity NoPay)
--   - nopay_days  = NoPay DAYS CONFIG assigned per employee (e.g. 26 Working Days rule)
--
--   The original schema had emp_np.nopay_id pointing to nopay_days(id), which was wrong.
--   The batch pivot SPs also joined on nopay_days, so batch columns were driven by the
--   config table instead of the type table.
--
-- Why we delete real rows instead of remapping:
--   nopay_days codes (e.g. '26DAYS') and nopay codes (e.g. 'UAB') serve different
--   domains and do not overlap. Code-based remapping would COALESCE every real row to -1,
--   causing unique key violations. The existing emp_np rows that pointed to nopay_days
--   are semantically wrong data; the load phase will recreate them correctly after this fix.

-- ─── 1. Remove real emp_np rows (they pointed at the wrong table) ────────────
-- Keep only the sentinel row (id = -1 / emp_id = -1).
-- Re-run the Load phase for each payroll month after applying this migration
-- to regenerate emp_np rows with the correct nopay FK.
DELETE FROM emp_np WHERE id > 0;

-- ─── 2. Reset the sentinel row's nopay_id to the nopay sentinel ─────────────
-- The sentinel row (id=-1) had nopay_id=-1 pointing to nopay_days.id=-1.
-- After the FK change it must point to nopay.id=-1 (same value, different table).
-- No UPDATE is needed since the id value is the same; the FK target changes below.

-- ─── 3. Drop old FK pointing to nopay_days ──────────────────────────────────
ALTER TABLE emp_np
    DROP FOREIGN KEY fk_emp_np_nopay;

-- ─── 4. Add new FK pointing to nopay ────────────────────────────────────────
ALTER TABLE emp_np
    ADD CONSTRAINT fk_emp_np_nopay
        FOREIGN KEY (nopay_id) REFERENCES nopay (id);

-- ─── 5. Fix sp_emp_np_pivot ─────────────────────────────────────────────────
DROP PROCEDURE IF EXISTS `sp_emp_np_pivot`;

DELIMITER ;;
CREATE PROCEDURE `sp_emp_np_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';
    SET SESSION group_concat_max_len = 1000000;

    -- Build one set of columns per active nopay type (rate / days / amount / label)
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN n.id = ', n.id, ' THEN IFNULL(enp.rate,   0) ELSE 0 END) AS `', LOWER(n.code), '_rate`, ',
            'SUM(CASE WHEN n.id = ', n.id, ' THEN IFNULL(enp.days,   0) ELSE 0 END) AS `', LOWER(n.code), '_days`, ',
            'SUM(CASE WHEN n.id = ', n.id, ' THEN IFNULL(enp.amount, 0) ELSE 0 END) AS `', LOWER(n.code), '_amount`, ',
            '''', REPLACE(REPLACE(n.name, '''', ''''''), '`', ''), ''' AS `', LOWER(n.code), '_label`'
        ) ORDER BY n.id SEPARATOR ', '
    ) INTO v_columns
    FROM nopay n
    WHERE n.is_active = 'Y'
      AND n.id > 0;

    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_np, 0 AS no_active_np_days, 0 AS no_active_np_amount, NULL AS no_active_np_label';
    END IF;

    SET v_sql = CONCAT(
        'SELECT e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary, ',
        v_columns,
        ' FROM employee e ',
        ' LEFT JOIN emp_np enp ON e.id = enp.emp_id AND enp.payroll_month = ''', p_payroll_month, ''' ',
        ' LEFT JOIN nopay n ON n.id = enp.nopay_id ',
        ' WHERE e.is_active = ''Y'' AND e.id > 0 ',
        ' GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary ',
        ' ORDER BY e.id'
    );

    SET @stmt = v_sql;
    PREPARE stmt FROM @stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;;
DELIMITER ;

-- ─── 6. Fix sp_rpt_nopay ────────────────────────────────────────────────────
DROP PROCEDURE IF EXISTS `sp_rpt_nopay`;

DELIMITER ;;
CREATE PROCEDURE `sp_rpt_nopay`(IN p_payroll_month VARCHAR(20))
BEGIN
    SELECT
        e.employee_no,
        e.payroll_name,
        n.code        AS nopay_code,
        n.name        AS nopay_name,
        enp.rate,
        enp.days,
        enp.amount,
        enp.payroll_month
    FROM emp_np  enp
    JOIN employee e ON e.id = enp.emp_id
    JOIN nopay    n ON n.id = enp.nopay_id
    WHERE enp.payroll_month = p_payroll_month
      AND (enp.days > 0 OR enp.amount > 0)
    ORDER BY e.employee_no, n.code;
END;;
DELIMITER ;
