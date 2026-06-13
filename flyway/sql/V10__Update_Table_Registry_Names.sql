-- Align table_registry names with the renamed physical tables.
UPDATE table_registry
SET table_name = 'gratuity',
    modified_date = CURRENT_TIMESTAMP
WHERE table_name = 'gratuity_config'
  AND NOT EXISTS (
      SELECT 1
      FROM (
          SELECT table_name
          FROM table_registry
      ) existing
      WHERE existing.table_name = 'gratuity'
  );

UPDATE table_registry
SET table_name = 'late_deduction',
    modified_date = CURRENT_TIMESTAMP
WHERE table_name = 'late_deduction_config'
  AND NOT EXISTS (
      SELECT 1
      FROM (
          SELECT table_name
          FROM table_registry
      ) existing
      WHERE existing.table_name = 'late_deduction'
  );
