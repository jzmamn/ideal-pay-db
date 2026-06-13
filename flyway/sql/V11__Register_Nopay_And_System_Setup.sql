-- Register newly introduced payroll tables.
INSERT INTO table_registry (table_name, table_type, created_date, modified_date)
SELECT 'nopay', 'MAS', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (
    SELECT 1
    FROM table_registry
    WHERE table_name = 'nopay'
);

INSERT INTO table_registry (table_name, table_type, created_date, modified_date)
SELECT 'system_setup', 'CON', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (
    SELECT 1
    FROM table_registry
    WHERE table_name = 'system_setup'
);
