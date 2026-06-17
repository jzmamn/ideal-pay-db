-- ============================================
-- Add missing `rate` column to emp_np
-- ============================================
-- com.payroll.entity.EmployeeNopay maps a `rate` field to this table
-- (rate per day, used by the no-pay calculation), but no migration ever
-- created the column — confirmed absent from V1 baseline and from every
-- pre_flyway migration (V1-V26).
--
-- Hibernate's generated SELECT for emp_np includes `rate`, which MySQL
-- rejects with Error 1054 / SQLState 42S22 ("Unknown column 'en1_0.rate'
-- in 'field list'"). EmployeeProfileServiceImpl.getEmployeeProfile()
-- aborts on this exception, so GET /payroll/emp-profile/{empId} returns
-- HTTP 500 for every employee — which is why the Salary tab's Fixed
-- Allowance and Fixed Deduction lists (and Nopay/Overtime data) silently
-- fail to load: both FE components hit this same combined endpoint and
-- swallow the error.

ALTER TABLE `emp_np`
  ADD COLUMN `rate` DECIMAL(15,6) NOT NULL DEFAULT 0.000000 AFTER `payroll_month`;
