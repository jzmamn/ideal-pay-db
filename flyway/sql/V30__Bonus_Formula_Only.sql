-- Bonus calculation is now formula-based only; FIXED_AMOUNT is removed as a
-- supported calculation_method. Existing FIXED_AMOUNT rows already store the
-- flat amount as a literal numeric string in the `formula` column (e.g. '50000'),
-- so they are converted in place to FORMULA_BASED with formula_enabled = 'Y'.
-- The DEFAULT sentinel row (id = -1) has no formula and is never evaluated at
-- runtime, so it is converted to FORMULA_BASED without a formula value.
-- Every DDL/DML operation is guarded so this script can recover from a partial run.

SET @previous_sql_safe_updates = @@SQL_SAFE_UPDATES;
SET SQL_SAFE_UPDATES = 0;

UPDATE bonus
SET calculation_method = 'FORMULA_BASED',
    formula_enabled = 'Y'
WHERE calculation_method = 'FIXED_AMOUNT'
  AND formula IS NOT NULL
  AND formula <> '';

UPDATE bonus
SET calculation_method = 'FORMULA_BASED'
WHERE calculation_method = 'FIXED_AMOUNT';

SET SQL_SAFE_UPDATES = @previous_sql_safe_updates;

ALTER TABLE bonus
    MODIFY COLUMN calculation_method VARCHAR(20) NOT NULL DEFAULT 'FORMULA_BASED';
