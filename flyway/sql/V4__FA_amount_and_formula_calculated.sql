-- V4: Fixed Allowance — static amount field + formula_calculated flag on emp_fa
--
-- fixed_allowance.amount:
--   Holds the company-wide fixed amount when formula is not used.
--   NULL means "not configured as a fixed amount" (formula or manual per-employee entry).
--
-- emp_fa.formula_calculated:
--   'Y' when the amount in this row was produced by evaluating the formula at load time.
--   'N' when the amount was entered manually via the batch / individual payroll screen.
--   Used by the UI to render formula-derived amounts as read-only.
--
-- Note: ADD COLUMN IF NOT EXISTS requires MySQL 8.0.3+. We use a procedure guard
-- for compatibility with earlier 8.0.x patch levels.

DROP PROCEDURE IF EXISTS v4_migrate;

DELIMITER $$
CREATE PROCEDURE v4_migrate()
BEGIN
    -- fixed_allowance.amount
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND TABLE_NAME   = 'fixed_allowance'
          AND COLUMN_NAME  = 'amount'
    ) THEN
        ALTER TABLE `fixed_allowance`
            ADD COLUMN `amount` DECIMAL(15,2) DEFAULT NULL
                COMMENT 'Static fixed amount used when formula_enabled = N. NULL = not configured.'
                AFTER `formula_enabled`;
    END IF;

    -- emp_fa.formula_calculated
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND TABLE_NAME   = 'emp_fa'
          AND COLUMN_NAME  = 'formula_calculated'
    ) THEN
        ALTER TABLE `emp_fa`
            ADD COLUMN `formula_calculated` CHAR(1) NOT NULL DEFAULT 'N'
                COMMENT 'Y = amount was formula-derived at load time (read-only); N = manually entered.'
                AFTER `is_processed`;
    END IF;

    -- chk_emp_fa_formula_calculated (MySQL 8.0.16+ supports CHECK; skip guard on older)
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.TABLE_CONSTRAINTS
        WHERE TABLE_SCHEMA     = DATABASE()
          AND TABLE_NAME       = 'emp_fa'
          AND CONSTRAINT_NAME  = 'chk_emp_fa_formula_calculated'
          AND CONSTRAINT_TYPE  = 'CHECK'
    ) THEN
        ALTER TABLE `emp_fa`
            ADD CONSTRAINT `chk_emp_fa_formula_calculated`
                CHECK (`formula_calculated` IN ('Y', 'N'));
    END IF;
END$$
DELIMITER ;

CALL v4_migrate();
DROP PROCEDURE IF EXISTS v4_migrate;
