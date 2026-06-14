-- ────────────────────────────────────────────────────────────────────────────
-- V12 — Fixed Deduction: add amount, effective_date, liable_for_taxable_salary
--        emp_fd:         add formula_calculated
-- ────────────────────────────────────────────────────────────────────────────

-- fixed_deduction: optional fixed amount (used when formula is not enabled)
ALTER TABLE fixed_deduction
    ADD COLUMN amount DECIMAL(15, 2) NULL COMMENT 'Fixed monetary amount; used when formula_enabled = N',
    ADD COLUMN effective_date DATE NULL COMMENT 'Date from which this deduction is effective',
    ADD COLUMN liable_for_taxable_salary CHAR(1) NOT NULL DEFAULT 'N'
        COMMENT 'Y = this deduction reduces taxable salary; N = it does not';

-- emp_fd: track whether the stored amount was produced by a formula evaluation
ALTER TABLE emp_fd
    ADD COLUMN formula_calculated CHAR(1) NOT NULL DEFAULT 'N'
        COMMENT 'Y = amount was set by formula evaluation at load time; N = fixed amount or manual entry';
