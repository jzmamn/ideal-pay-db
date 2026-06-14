-- Add bonus calculation method and employee department support.
-- Every DDL operation is guarded so this script can recover from a partial run.

SET @column_exists = (
    SELECT COUNT(*) FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'bonus'
      AND COLUMN_NAME = 'calculation_method'
);
SET @sql = IF(@column_exists = 0,
    'ALTER TABLE bonus ADD COLUMN calculation_method VARCHAR(20) NOT NULL DEFAULT ''FIXED_AMOUNT'' AFTER description',
    'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @previous_sql_safe_updates = @@SQL_SAFE_UPDATES;
SET SQL_SAFE_UPDATES = 0;

UPDATE bonus
SET calculation_method = CASE
    WHEN formula_enabled = 'Y' THEN 'FORMULA_BASED'
    ELSE 'FIXED_AMOUNT'
END;

SET SQL_SAFE_UPDATES = @previous_sql_safe_updates;

SET @column_exists = (
    SELECT COUNT(*) FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'employee'
      AND COLUMN_NAME = 'department_id'
);
SET @sql = IF(@column_exists = 0,
    'ALTER TABLE employee ADD COLUMN department_id BIGINT NULL AFTER designation_id',
    'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @fk_exists = (
    SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS
    WHERE CONSTRAINT_SCHEMA = DATABASE()
      AND TABLE_NAME = 'employee'
      AND CONSTRAINT_NAME = 'fk_employee_department'
      AND CONSTRAINT_TYPE = 'FOREIGN KEY'
);
SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE employee ADD CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES department (id)',
    'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @index_exists = (
    SELECT COUNT(*) FROM information_schema.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'employee'
      AND INDEX_NAME = 'idx_employee_department'
);
SET @sql = IF(@index_exists = 0,
    'ALTER TABLE employee ADD INDEX idx_employee_department (department_id)',
    'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @fk_exists = (
    SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS
    WHERE CONSTRAINT_SCHEMA = DATABASE()
      AND TABLE_NAME = 'bonus_processing_batch'
      AND CONSTRAINT_NAME = 'fk_bpb_processed_by'
      AND CONSTRAINT_TYPE = 'FOREIGN KEY'
);
SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE bonus_processing_batch ADD CONSTRAINT fk_bpb_processed_by FOREIGN KEY (processed_by) REFERENCES usr (id)',
    'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;