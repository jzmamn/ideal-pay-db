-- =============================================================================
-- Patch: Fix sp_emp_late_pivot to aggregate duplicate rows
--
-- Problem: old multi-config load path could create multiple emp_late rows per
-- (employee, month). The previous SP had no GROUP BY, so the SP returned one
-- row per emp_late row, duplicating employees in the batch grid.
--
-- Fix: add GROUP BY + aggregate functions so each employee always appears once.
--      SUM(hours) + SUM(amount) correctly merges any existing duplicates.
--      MAX(rate) returns the rate that was loaded (all rows have the same rate
--      since there is now only one singleton late deduction config).
-- =============================================================================

DROP PROCEDURE IF EXISTS sp_emp_late_pivot;

DELIMITER $$

CREATE PROCEDURE sp_emp_late_pivot(IN p_payroll_month VARCHAR(20))
BEGIN
    SELECT
        e.id                              AS id,
        e.employee_no                     AS employee_no,
        e.first_name                      AS first_name,
        e.last_name                       AS last_name,
        e.payroll_name                    AS payroll_name,
        e.basic_salary                    AS basic_salary,
        COALESCE(MAX(el.rate),   0)       AS late_rate,
        COALESCE(SUM(el.hours),  0)       AS late_hours,
        COALESCE(SUM(el.amount), 0)       AS late_amount,
        MAX(el.is_processed)              AS late_is_processed
    FROM employee e
    LEFT JOIN emp_late el
           ON el.emp_id        = e.id
          AND el.payroll_month  = p_payroll_month
    WHERE e.is_active = 'Y'
      AND e.id > 0
    GROUP BY e.id, e.employee_no, e.first_name, e.last_name, e.payroll_name, e.basic_salary
    ORDER BY e.id;
END$$

DELIMITER ;
