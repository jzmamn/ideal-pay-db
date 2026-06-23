-- ============================================
-- Add WORKING_DAYS as a global system_setup value
-- ============================================
-- Working days currently only exist per payroll_period (payroll_period.
-- working_days, default 26), with PayrollPeriodServiceImpl.createPeriod()
-- hardcoding 26 as the fallback when a new period omits the value, and
-- PayrollContextBuilder.build() hardcoding the same 26 as a last-resort
-- default for formula evaluation.
--
-- This adds a WORKING_DAYS row to system_setup (same key/value pattern as
-- NOPAY_DIVISOR / OT_DIVISOR) so the fallback is a company-configurable
-- global default instead of a hardcoded literal. Per-period overrides via
-- PayrollPeriodRequestDTO.workingDays continue to take precedence.

INSERT INTO `system_setup`
  (`code`, `name`, `value`, `description`, `is_active`, `effective_from`,
   `effective_to`, `created_by`, `created_date`, `modified_by`, `modified_date`)
VALUES
  ('WORKING_DAYS', 'Working Days', '26',
   'Default number of working/payable days per payroll period, used when a period does not specify its own value.',
   'Y', '2020-01-01', NULL, -1, CURRENT_TIMESTAMP, -1, CURRENT_TIMESTAMP);
