-- Fix sp_emp_late_pivot referencing the removed employee.status column.
DROP PROCEDURE IF EXISTS sp_emp_late_pivot;

DELIMITER $$

CREATE PROCEDURE sp_emp_late_pivot(
    IN p_payroll_month VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
)
BEGIN
    SELECT
        e.id                       AS employeeId,
        e.employee_no              AS employeeCode,
        e.payroll_name             AS employeeName,
        COALESCE(el.hours, 0)      AS lateHours,
        COALESCE(el.amount, 0)     AS lateAmount,
        el.is_processed            AS isProcessed
    FROM employee e
    LEFT JOIN emp_late el
           ON el.emp_id = e.id
          AND el.payroll_month = p_payroll_month
    WHERE e.is_active = 'Y'
      AND e.id > 0
    ORDER BY e.employee_no;
END$$

DELIMITER ;
