-- =============================================================================
-- Fix: "Illegal mix of collations" error in sp_emp_late_pivot
--
-- Root cause: `emp_late` (and two other tables) were created with table-level
-- DEFAULT CHARSET/COLLATE = utf8mb4_unicode_ci, while every other table in the
-- schema uses the database default utf8mb4_0900_ai_ci. V6's patch to
-- sp_emp_late_pivot dropped the explicit `COLLATE utf8mb4_unicode_ci` that V8
-- (pre-Flyway) had put on the `p_payroll_month` IN parameter, so the parameter
-- now resolves to the session default (utf8mb4_0900_ai_ci) and no longer
-- matches `emp_late.payroll_month` (utf8mb4_unicode_ci) in the join predicate:
--   el.payroll_month = p_payroll_month
-- -> Illegal mix of collations (utf8mb4_unicode_ci,IMPLICIT) and
--    (utf8mb4_0900_ai_ci,IMPLICIT)
--
-- Fix: standardize the outlier tables to the schema-wide utf8mb4_0900_ai_ci
-- collation instead of special-casing the SP parameter, so the same class of
-- bug can't resurface the next time one of these columns is compared against
-- a literal/parameter elsewhere.
-- =============================================================================

ALTER TABLE emp_late
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE bonus_processing_batch
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE payroll_run_review_log
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
