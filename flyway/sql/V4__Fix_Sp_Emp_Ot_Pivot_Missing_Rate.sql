-- ============================================
-- Fix: sp_emp_ot_pivot never returns the OT rate
-- ============================================
-- V3 added the `rate` column to `emp_ot` (fixing the GET /payroll/emp-profile
-- 500 error), but never updated `sp_emp_ot_pivot` to expose it. The Load
-- phase (PayrollComponentLoadServiceImpl.loadOt) correctly computes and
-- stores eot.rate, but the Batch screen pulls its data from this SP, whose
-- dynamic pivot only ever produced `{code}_hours`, `{code}_amount`, and
-- `{code}_label` columns — so the rate the Batch UI displays is always 0,
-- regardless of what was loaded.
--
-- This mirrors the column already present in sp_emp_late_pivot (el.rate AS
-- lateRate) — same per-unit-rate pattern, just missing here for OT.

DROP PROCEDURE IF EXISTS `sp_emp_ot_pivot`;

DELIMITER ;;
CREATE PROCEDURE `sp_emp_ot_pivot`(IN p_payroll_month VARCHAR(20))
BEGIN
    DECLARE v_columns LONGTEXT DEFAULT '';
    DECLARE v_sql     LONGTEXT DEFAULT '';
    SET SESSION group_concat_max_len = 1000000;
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT(
            'SUM(CASE WHEN ot.id = ', ot.id, ' THEN IFNULL(eot.rate,   0) ELSE 0 END) AS `', ot.code, '_rate`, ',
            'SUM(CASE WHEN ot.id = ', ot.id, ' THEN IFNULL(eot.hours,  0) ELSE 0 END) AS `', ot.code, '_hours`, ',
            'SUM(CASE WHEN ot.id = ', ot.id, ' THEN IFNULL(eot.amount, 0) ELSE 0 END) AS `', ot.code, '_amount`, ',
            '''', REPLACE(REPLACE(ot.name, '''', ''''''), '`', ''), ''' AS `', ot.code, '_label`'
        ) ORDER BY ot.id SEPARATOR ', '
    ) INTO v_columns FROM overtime ot WHERE ot.is_active = 'Y' AND ot.id > 0;
    IF v_columns IS NULL OR v_columns = '' THEN
        SET v_columns = '0 AS no_active_components, 0 AS no_active_components_amount, NULL AS no_active_components_label';
    END IF;
    SET v_sql = CONCAT(
        'SELECT e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary, ',
        v_columns,
        ' FROM employee e
        LEFT JOIN emp_ot eot ON e.id = eot.emp_id AND eot.payroll_month = ''', p_payroll_month, '''
        LEFT JOIN overtime ot ON eot.overtime_id = ot.id
        WHERE e.is_active = ''Y'' AND e.id > 0
        GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
        ORDER BY e.id'
    );
    SET @stmt = v_sql; PREPARE stmt FROM @stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
END;;
DELIMITER ;
