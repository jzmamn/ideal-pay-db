-- ============================================
-- Add missing `rate` column to emp_ot
-- ============================================
-- Same defect as V2 (emp_np), in the overtime table: com.payroll.entity.
-- EmployeeOvertime maps a `rate` field (rate per hour) to emp_ot, but no
-- migration ever created the column — confirmed absent from V1 baseline
-- and from every pre_flyway migration (V1-V26; emp_ot only appears in
-- V1__Initial_Schema.sql and V2__Fix_Charset_And_Duplicate_Indexes.sql,
-- neither of which adds it).
--
-- Hibernate's generated SELECT for emp_ot includes `rate`, which MySQL
-- rejects with Error 1054 / SQLState 42S22 ("Unknown column 'eo1_0.rate'
-- in 'field list'"), 500-ing GET /payroll/emp-profile/{empId} the same
-- way the emp_np gap did.

ALTER TABLE `emp_ot`
  ADD COLUMN `rate` DECIMAL(15,6) NOT NULL DEFAULT 0.000000 AFTER `payroll_month`;
