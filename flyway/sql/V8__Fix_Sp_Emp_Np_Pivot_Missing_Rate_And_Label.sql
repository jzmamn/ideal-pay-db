-- ============================================
-- Fix: sp_emp_np_pivot missing rate, label, and pivot structure
-- ============================================
-- V2 added the `rate` column to `emp_np`, but sp_emp_np_pivot was never
-- updated to expose it. Worse, the SP was using a flat format (one static
-- row per employee with plain `days` and `amount` columns), instead of the
-- dynamic pivot format that the Batch screen expects.
--
-- The Batch screen's buildCodePivotFlatRows() discovers active NoPay types
-- by scanning for columns ending in `_label`. The flat SP produced no such
-- columns, so the function found zero codes and returned an empty array —
-- NoPay always showed "No NoPay entries" even after clicking Load.
--
-- This mirrors the fix in V4 (sp_emp_ot_pivot) — same per-unit-rate pivot
-- pattern, just using `_days` instead of `_hours`.
--
-- After applying this migration, re-run the Load phase for the affected
-- payroll month so emp_np.rate is populated; the Batch screen will then
-- correctly display Rate / Day, Days, and Amount for each NoPay type.

DROP PROCEDURE IF EXISTS `sp_emp_np_pivot`;

DELIMITER ;;
CREATE PROCEDURE `sp_emp_np_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';
    SET SESSION group_concat_max_len = 1000000;
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN nd.id = ', nd.id, ' THEN IFNULL(enp.rate,   0) ELSE 0 END) AS `', nd.code, '_rate`, ',
            'SUM(CASE WHEN nd.id = ', nd.id, ' THEN IFNULL(enp.days,   0) ELSE 0 END) AS `', nd.code, '_days`, ',
            'SUM(CASE WHEN nd.id = ', nd.id, ' THEN IFNULL(enp.amount, 0) ELSE 0 END) AS `', nd.code, '_amount`, ',
            '''', REPLACE(REPLACE(nd.name, '''', ''''''), '`', ''), ''' AS `', nd.code, '_label`'
        ) ORDER BY nd.id SEPARATOR ', '
    ) INTO v_columns FROM nopay_days nd WHERE nd.is_active = 'Y' AND nd.id > 0;
    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_np, 0 AS no_active_np_days, 0 AS no_active_np_amount, NULL AS no_active_np_label';
    END IF;
    SET v_sql = CONCAT(
        'SELECT e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary, ',
        v_columns,
        ' FROM employee e
        LEFT JOIN emp_np enp ON e.id = enp.emp_id AND enp.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN nopay_days nd ON enp.nopay_id = nd.id
        WHERE e.is_active = ''Y'' AND e.id > 0
        GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
        ORDER BY e.id'
    );
    SET @stmt = v_sql; PREPARE stmt FROM @stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
END;;
DELIMITER ;
