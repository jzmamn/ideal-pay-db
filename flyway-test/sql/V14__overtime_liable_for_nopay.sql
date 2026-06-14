-- V23: Add liable_for_nopay column to overtime table
-- Overtime types can now participate in no-pay deduction calculations.
ALTER TABLE `overtime`
    ADD COLUMN `liable_for_nopay` CHAR(1) NOT NULL DEFAULT 'N'
        COMMENT 'Y = OT amount is reduced proportionally when employee has no-pay days'
        AFTER `liable_for_paye`;
