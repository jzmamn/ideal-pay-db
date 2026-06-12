-- MySQL 8.x
-- Destructive operation: take a backup before calling this procedure.
--
-- Reads table_registry and truncates every registered table except type CON.
-- Existing default records identified by numeric id = -1 are preserved/restored.
-- Tables with UUID/string IDs are truncated without attempting numeric comparison.
-- Execution requires an exact confirmation token to prevent accidental use.

USE `ideal_pay_flyway`;

DROP PROCEDURE IF EXISTS `sp_truncate_non_con_tables`;

DELIMITER $$

CREATE PROCEDURE `sp_truncate_non_con_tables`(
  IN p_confirmation VARCHAR(100)
)
BEGIN
  DECLARE v_done INT DEFAULT 0;
  DECLARE v_table_name VARCHAR(64);
  DECLARE v_safe_table_name VARCHAR(128);
  DECLARE v_temp_table_name VARCHAR(64);
  DECLARE v_has_numeric_id INT DEFAULT 0;
  DECLARE v_has_created_by INT DEFAULT 0;
  DECLARE v_has_modified_by INT DEFAULT 0;
  DECLARE v_default_count INT DEFAULT 0;
  DECLARE v_fk_checks INT DEFAULT 1;

  DECLARE cur_tables CURSOR FOR
    SELECT `table_name`
    FROM `table_registry`
    WHERE `table_type` <> 'CON'
      AND `table_name` <> 'table_registry'
    ORDER BY `table_name`;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SET FOREIGN_KEY_CHECKS = v_fk_checks;
    RESIGNAL;
  END;

  IF COALESCE(p_confirmation, '') <> 'TRUNCATE_NON_CON_TABLES_I_UNDERSTAND' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT =
        'Execution blocked. Review the preview and provide the exact confirmation token.';
  END IF;

  DROP TEMPORARY TABLE IF EXISTS `tmp_truncate_result`;
  CREATE TEMPORARY TABLE `tmp_truncate_result` (
    `table_name` VARCHAR(64) NOT NULL,
    `default_rows_restored` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`table_name`)
  );

  SET v_fk_checks = @@FOREIGN_KEY_CHECKS;
  SET FOREIGN_KEY_CHECKS = 0;

  OPEN cur_tables;

  truncate_loop: LOOP
    FETCH cur_tables INTO v_table_name;

    IF v_done = 1 THEN
      LEAVE truncate_loop;
    END IF;

    SET v_safe_table_name = REPLACE(v_table_name, '`', '``');
    SET v_temp_table_name = CONCAT('tmp_def_', LEFT(MD5(v_table_name), 24));

    SELECT COUNT(*)
    INTO v_has_numeric_id
    FROM `information_schema`.`COLUMNS`
    WHERE `TABLE_SCHEMA` = DATABASE()
      AND `TABLE_NAME` = v_table_name
      AND `COLUMN_NAME` = 'id'
      AND `DATA_TYPE` IN (
        'tinyint',
        'smallint',
        'mediumint',
        'int',
        'integer',
        'bigint',
        'decimal',
        'numeric'
      );

    SELECT
      COUNT(CASE WHEN `COLUMN_NAME` = 'created_by' THEN 1 END),
      COUNT(CASE WHEN `COLUMN_NAME` = 'modified_by' THEN 1 END)
    INTO v_has_created_by, v_has_modified_by
    FROM `information_schema`.`COLUMNS`
    WHERE `TABLE_SCHEMA` = DATABASE()
      AND `TABLE_NAME` = v_table_name
      AND `COLUMN_NAME` IN ('created_by', 'modified_by');

    SET v_default_count = 0;

    IF v_has_numeric_id > 0 THEN
      SET @sql = CONCAT(
        'DROP TEMPORARY TABLE IF EXISTS `', v_temp_table_name, '`'
      );
      PREPARE stmt FROM @sql;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SET @sql = CONCAT(
        'CREATE TEMPORARY TABLE `', v_temp_table_name,
        '` LIKE `', v_safe_table_name, '`'
      );
      PREPARE stmt FROM @sql;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SET @sql = CONCAT(
        'INSERT INTO `', v_temp_table_name,
        '` SELECT * FROM `', v_safe_table_name, '` WHERE `id` = -1'
      );
      PREPARE stmt FROM @sql;
      EXECUTE stmt;
      SET v_default_count = ROW_COUNT();
      DEALLOCATE PREPARE stmt;
    END IF;

    SET @sql = CONCAT('TRUNCATE TABLE `', v_safe_table_name, '`');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    IF v_has_numeric_id > 0 AND v_default_count > 0 THEN
      SET @sql = CONCAT(
        'INSERT INTO `', v_safe_table_name,
        '` SELECT * FROM `', v_temp_table_name, '`'
      );
      PREPARE stmt FROM @sql;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      -- Enforce the default audit-user convention where these columns exist.
      IF v_has_created_by > 0 OR v_has_modified_by > 0 THEN
        SET @audit_assignments = CONCAT_WS(
          ', ',
          IF(v_has_created_by > 0, '`created_by` = -1', NULL),
          IF(v_has_modified_by > 0, '`modified_by` = -1', NULL)
        );

        SET @sql = CONCAT(
          'UPDATE `', v_safe_table_name, '` SET ',
          @audit_assignments,
          ' WHERE `id` = -1'
        );
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
      END IF;
    END IF;

    -- Create a schema-valid fallback default for selected tables that did not
    -- already contain a default record.
    IF v_default_count = 0 THEN
      CASE v_table_name
        WHEN 'email_config' THEN
          INSERT INTO `email_config` (
            `id`, `name`, `host`, `port`, `username`, `password`,
            `from_name`, `from_address`, `use_tls`, `is_active`,
            `created_by`, `modified_by`
          ) VALUES (
            -1, 'DEFAULT', 'localhost', 0, 'DEFAULT', 'DEFAULT',
            'System Default', 'default@localhost', 'N', 'N', -1, -1
          );

        WHEN 'email_template' THEN
          INSERT INTO `email_template` (
            `id`, `name`, `template_type`, `email_config_id`,
            `subject`, `body`, `is_active`, `created_by`, `modified_by`
          ) VALUES (
            -1, 'DEFAULT', 'GENERAL', NULL,
            'System Default', 'System Default', 'N', -1, -1
          );

        WHEN 'emp_bonus' THEN
          INSERT INTO `emp_bonus` (
            `id`, `emp_id`, `bonus_id`, `payroll_month`, `amount`,
            `is_processed`, `processed_date`, `created_by`, `modified_by`,
            `import_log_id`
          ) VALUES (
            -1, -1, NULL, 'DEFAULT', 0.00,
            'N', NULL, -1, -1, NULL
          );

        WHEN 'emp_gratuity' THEN
          INSERT INTO `emp_gratuity` (
            `id`, `code`, `emp_id`, `termination_date`, `joined_date`,
            `years_of_service`, `basic_salary`, `gratuity_amount`, `status`,
            `remarks`, `created_by`, `modified_by`, `import_log_id`
          ) VALUES (
            -1, 'DEFAULT', -1, '1970-01-01', '1970-01-01',
            0.00, 0.00, 0.00, 'DRAFT',
            'System default', -1, -1, NULL
          );

        WHEN 'emp_payroll_run' THEN
          INSERT INTO `emp_payroll_run` (
            `id`, `emp_id`, `payroll_month`, `basic_salary`,
            `total_allowances`, `total_deductions`, `gross_pay`, `net_pay`,
            `status`, `processed_date`, `processed_by`, `created_by`,
            `modified_by`, `run_type`, `parent_run_id`, `epf_liable_base`,
            `employee_epf`, `employer_epf`, `etf`, `paye_tax`, `working_days`
          ) VALUES (
            -1, -1, 'DEFAULT', 0.00,
            0.00, 0.00, 0.00, 0.00,
            'DRAFT', NULL, NULL, -1,
            -1, 'NORMAL', NULL, 0.00,
            0.00, 0.00, 0.00, 0.00, 26
          );

        WHEN 'emp_payroll_run_detail' THEN
          INSERT INTO `emp_payroll_run_detail` (
            `id`, `run_id`, `component_type`, `component_id`,
            `component_code`, `component_name`, `amount`, `hours`, `days`,
            `created_by`, `modified_by`
          ) VALUES (
            -1, -1, 'FA', NULL,
            'DEFAULT', 'System Default', 0.00, NULL, NULL,
            -1, -1
          );

        WHEN 'emp_transfer_log' THEN
          INSERT INTO `emp_transfer_log` (
            `id`, `payroll_run_id`, `transfer_type`, `bank_id`, `bank_code`,
            `transferred_amount`, `transferred_by`
          ) VALUES (
            -1, -1, 'SALARY', NULL, NULL, 0.00, -1
          );

        WHEN 'grp' THEN
          INSERT INTO `grp` (
            `id`, `code`, `is_active`, `name`, `created_by`, `modified_by`
          ) VALUES (
            -1, 'DEFAULT', 'Y', 'System Default', -1, -1
          );

        WHEN 'import_log' THEN
          INSERT INTO `import_log` (
            `id`, `entity`, `payroll_month`, `file_name`, `total_rows`,
            `valid_rows`, `error_rows`, `error_detail`, `status`, `created_by`
          ) VALUES (
            -1, 'DEFAULT', '0000-00', 'DEFAULT', 0,
            0, 0, JSON_ARRAY(), 'COMMITTED', -1
          );

        WHEN 'import_session' THEN
          INSERT INTO `import_session` (
            `id`, `entity`, `payroll_month`, `file_name`, `rows_json`,
            `mapping_json`, `created_by`, `expires_at`
          ) VALUES (
            '00000000-0000-0000-0000-000000000000',
            'DEFAULT', '0000-00', 'DEFAULT', JSON_ARRAY(),
            JSON_OBJECT(), -1, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 30 MINUTE)
          );

        WHEN 'license_audit_log' THEN
          INSERT INTO `license_audit_log` (
            `id`, `license_id`, `action`, `status`, `message`, `performed_by`
          ) VALUES (
            -1, NULL, 'DEFAULT', 'DEFAULT', 'System default', -1
          );

        ELSE
          SET v_default_count = v_default_count;
      END CASE;

      IF v_table_name IN (
        'email_config',
        'email_template',
        'emp_bonus',
        'emp_gratuity',
        'emp_payroll_run',
        'emp_payroll_run_detail',
        'emp_transfer_log',
        'grp',
        'import_log',
        'import_session',
        'license_audit_log'
      ) THEN
        SET v_default_count = 1;
      END IF;
    END IF;

    IF v_has_numeric_id > 0 THEN
      SET @sql = CONCAT(
        'DROP TEMPORARY TABLE `', v_temp_table_name, '`'
      );
      PREPARE stmt FROM @sql;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;
    END IF;

    INSERT INTO `tmp_truncate_result`
      (`table_name`, `default_rows_restored`)
    VALUES
      (v_table_name, v_default_count);
  END LOOP;

  CLOSE cur_tables;
  SET FOREIGN_KEY_CHECKS = v_fk_checks;

  SELECT
    `table_name`,
    `default_rows_restored`,
    CASE
      WHEN `default_rows_restored` > 0 THEN 'DEFAULT RESTORED'
      ELSE 'NO DEFAULT RECORD FOUND'
    END AS `result`
  FROM `tmp_truncate_result`
  ORDER BY `table_name`;
END$$

DELIMITER ;

-- Review affected tables before executing:
SELECT `table_name`, `table_type`
FROM `table_registry`
WHERE `table_type` <> 'CON'
  AND `table_name` <> 'table_registry'
ORDER BY `table_type`, `table_name`;

-- Execution is blocked unless the exact confirmation token is supplied.
-- Uncomment only after reviewing the list above and taking a backup:
--
-- CALL `sp_truncate_non_con_tables`(
--   'TRUNCATE_NON_CON_TABLES_I_UNDERSTAND'
-- );
