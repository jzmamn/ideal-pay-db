-- ============================================
-- Payroll System Setup
-- ============================================

CREATE TABLE system_setup (
    id BIGINT NOT NULL AUTO_INCREMENT,

    code VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    value VARCHAR(255) NOT NULL,
    description VARCHAR(500),

    is_active CHAR(1) NOT NULL DEFAULT 'Y',

    effective_from DATE NOT NULL,
    effective_to DATE DEFAULT NULL,

    created_by BIGINT NOT NULL,
    created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    modified_by BIGINT NOT NULL,
    modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    UNIQUE KEY uk_system_setup_code (code),

    CONSTRAINT chk_system_setup_active
        CHECK (is_active IN ('Y','N')),

    CONSTRAINT fk_system_setup_created_by
        FOREIGN KEY (created_by) REFERENCES usr(id),

    CONSTRAINT fk_system_setup_modified_by
        FOREIGN KEY (modified_by) REFERENCES usr(id)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


-- ============================================
-- Default Settings
-- ============================================

INSERT INTO system_setup
(code, name, value, description, is_active, effective_from, created_by, modified_by)
VALUES
('EMPLOYEE_EPF_PERCENT', 'Employee EPF Percentage', '8.00',
 'Employee EPF contribution percentage', 'Y', '2020-01-01', -1, -1),

('EMPLOYER_EPF_PERCENT', 'Employer EPF Percentage', '12.00',
 'Employer EPF contribution percentage', 'Y', '2020-01-01', -1, -1),

('EMPLOYER_ETF_PERCENT', 'Employer ETF Percentage', '3.00',
 'Employer ETF contribution percentage', 'Y', '2020-01-01', -1, -1),

('EPF_ENABLED', 'EPF Enabled', 'Y',
 'Enable EPF calculations', 'Y', '2020-01-01', -1, -1),

('ETF_ENABLED', 'ETF Enabled', 'Y',
 'Enable ETF calculations', 'Y', '2020-01-01', -1, -1),

('PAYE_ENABLED', 'PAYE Enabled', 'Y',
 'Enable PAYE calculations', 'Y', '2020-01-01', -1, -1),

('OT_DIVISOR', 'Overtime Divisor', '240',
 'Monthly hours divisor used for OT rate calculation', 'Y', '2020-01-01', -1, -1),

('NOPAY_DIVISOR', 'No Pay Divisor', '30',
 'Working days divisor used for No Pay calculation', 'Y', '2020-01-01', -1, -1),

('GRATUITY_DIVISOR', 'Gratuity Divisor', '2',
 'Gratuity calculation divisor', 'Y', '2020-01-01', -1, -1),

('PAYROLL_LOCK_ENABLED', 'Payroll Lock Enabled', 'Y',
 'Prevent modifications to finalized payroll periods', 'Y', '2020-01-01', -1, -1),

('DEFAULT_CURRENCY', 'Default Currency', 'LKR',
 'Default currency used for payroll processing', 'Y', '2020-01-01', -1, -1),

('PAYSLIP_FOOTER', 'Payslip Footer',
 'This is a computer-generated document and does not require a signature.',
 'Footer text displayed on employee payslips', 'Y', '2020-01-01', -1, -1),

('MAX_OT_HOURS_PER_MONTH', 'Maximum OT Hours Per Month', '100',
 'Maximum overtime hours allowed per employee per month', 'Y', '2020-01-01', -1, -1),

('PAYROLL_APPROVAL_REQUIRED', 'Payroll Approval Required', 'Y',
 'Indicates whether payroll approval is required before finalization', 'Y', '2020-01-01', -1, -1),
 
 ('PAYROLL_CUTOFF_DAY', 'Payroll Cutoff Day', '25',
 'Monthly payroll cutoff day', 'Y', '2020-01-01', -1, -1),

('DEFAULT_PAYROLL_STATUS', 'Default Payroll Status', 'DRAFT',
 'Default status when a payroll period is created', 'Y', '2020-01-01', -1, -1),

('ENABLE_NEGATIVE_NET_PAY', 'Enable Negative Net Pay', 'N',
 'Allow payroll processing when net pay becomes negative', 'Y', '2020-01-01', -1, -1),

('DECIMAL_PRECISION', 'Decimal Precision', '2',
 'Number of decimal places used in payroll calculations', 'Y', '2020-01-01', -1, -1);