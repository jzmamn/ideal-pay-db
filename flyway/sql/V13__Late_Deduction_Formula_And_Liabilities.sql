-- ============================================================
-- V13 — Late Deduction: formula-based rate + liability flags
-- ============================================================
-- 1. Add EPF / ETF / PAYE / No-Pay liability flags to late_deduction
-- 2. Ensure emp_late has the rate and late_config_id columns
--    (they may already exist if ddl-auto=update was used in dev)
-- 3. Add a compound index to support one row per (emp, config, month)
-- 4. Rebuild sp_emp_late_pivot to show one row per (employee, config)
-- ============================================================

-- ── 1. Liability flags on late_deduction ──────────────────────────
-- Each column guarded individually: a prior failed run may have added some.

SET @c = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'late_deduction' AND COLUMN_NAME = 'liable_for_epf');
SET @sql = IF(@c = 0, 'ALTER TABLE late_deduction ADD COLUMN `liable_for_epf` CHAR(1) NOT NULL DEFAULT ''Y'' COMMENT ''Y = late deduction amount counts toward EPF-liable earnings''', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @c = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'late_deduction' AND COLUMN_NAME = 'liable_for_etf');
SET @sql = IF(@c = 0, 'ALTER TABLE late_deduction ADD COLUMN `liable_for_etf` CHAR(1) NOT NULL DEFAULT ''Y'' COMMENT ''Y = late deduction amount counts toward ETF-liable earnings''', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @c = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'late_deduction' AND COLUMN_NAME = 'liable_for_paye');
SET @sql = IF(@c = 0, 'ALTER TABLE late_deduction ADD COLUMN `liable_for_paye` CHAR(1) NOT NULL DEFAULT ''Y'' COMMENT ''Y = late deduction amount is considered for PAYE calculation''', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @c = (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'late_deduction' AND COLUMN_NAME = 'liable_for_nopay');
SET @sql = IF(@c = 0, 'ALTER TABLE late_deduction ADD COLUMN `liable_for_nopay` CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''Y = late deduction interacts with no-pay proportional reduction''', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ── 2. Rate and config FK on emp_late ────────────────────────────────────
-- Guard each column: V21 (Spring Boot migrations) may have already added them.

SET @has_rate = (
    SELECT COUNT(*) FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'emp_late' AND COLUMN_NAME = 'rate'
);
SET @sql = IF(@has_rate = 0,
    'ALTER TABLE emp_late ADD COLUMN `rate` DECIMAL(15,6) NOT NULL DEFAULT 0.000000 COMMENT ''Rate per hour computed by the load phase'' AFTER `id`',
    'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @has_cfg = (
    SELECT COUNT(*) FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'emp_late' AND COLUMN_NAME = 'late_config_id'
);
SET @sql = IF(@has_cfg = 0,
    'ALTER TABLE emp_late ADD COLUMN `late_config_id` BIGINT DEFAULT NULL COMMENT ''FK to late_deduction.id'' AFTER `emp_id`',
    'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Add FK constraint only if it doesn't already exist
SET @fk_exists = (
    SELECT COUNT(*)
    FROM information_schema.TABLE_CONSTRAINTS
    WHERE CONSTRAINT_SCHEMA = DATABASE()
      AND TABLE_NAME        = 'emp_late'
      AND CONSTRAINT_NAME   = 'fk_emp_late_config'
      AND CONSTRAINT_TYPE   = 'FOREIGN KEY'
);

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE emp_late ADD CONSTRAINT fk_emp_late_config
     FOREIGN KEY (late_config_id) REFERENCES late_deduction(id)',
    'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ── 3. Compound index: one row per (emp, config, month) ──────────────────
-- IMPORTANT: create the new index BEFORE dropping the old one.
-- idx_emp_late_emp_month may back a FK on emp_id; MySQL refuses to drop an
-- index that a FK depends on unless another usable index already exists.
-- The new compound index starts with emp_id, so MySQL will adopt it for the FK.

-- Step 3a: create new compound index if it does not already exist
SET @new_idx = (
    SELECT COUNT(*) FROM information_schema.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME   = 'emp_late'
      AND INDEX_NAME   = 'idx_emp_late_emp_config_month'
);
SET @sql = IF(@new_idx = 0,
    'CREATE INDEX idx_emp_late_emp_config_month ON emp_late (emp_id, late_config_id, payroll_month)',
    'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Step 3b: now safe to drop the old (emp_id, payroll_month) index
SET @drop_old_idx = (
    SELECT COUNT(*) FROM information_schema.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME   = 'emp_late'
      AND INDEX_NAME   = 'idx_emp_late_emp_month'
);
SET @sql = IF(@drop_old_idx > 0,
    'ALTER TABLE emp_late DROP INDEX idx_emp_late_emp_month',
    'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ── 4. Rebuild sp_emp_late_pivot ─────────────────────────────────────────

DROP PROCEDURE IF EXISTS sp_emp_late_pivot;

DELIMITER $$

CREATE PROCEDURE sp_emp_late_pivot(
    IN p_payroll_month VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
)
BEGIN
    -- Returns one row per (employee, late-deduction-type) for the given month.
    -- Employees with no emp_late record for a given config still appear with
    -- zero hours / amount so the batch-entry UI can always show all active types.
    SELECT
        e.id                            AS employeeId,
        e.employee_no                   AS employeeCode,
        e.payroll_name                  AS employeeName,
        ldc.id                          AS lateConfigId,
        ldc.code                        AS lateConfigCode,
        ldc.name                        AS lateConfigName,
        COALESCE(el.rate,   0)          AS lateRate,
        COALESCE(el.hours,  0)          AS lateHours,
        COALESCE(el.amount, 0)          AS lateAmount,
        el.is_processed                 AS isProcessed
    FROM employee e
    CROSS JOIN late_deduction ldc
    LEFT JOIN emp_late el
           ON el.emp_id          = e.id
          AND el.late_config_id  = ldc.id
          AND el.payroll_month   = p_payroll_month
    WHERE e.is_active   = 'Y'
      AND e.id          > 0
      AND ldc.is_active = 'Y'
      AND ldc.id        > 0
    ORDER BY e.employee_no, ldc.id;
END$$

DELIMITER ;
