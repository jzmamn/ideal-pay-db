-- Returns table_registry mismatches for the selected schema.
DROP PROCEDURE IF EXISTS sp_verify_table_registry;

DELIMITER $$

CREATE PROCEDURE sp_verify_table_registry(IN p_schema_name VARCHAR(64))
BEGIN
    DECLARE v_schema_name VARCHAR(64);

    SET v_schema_name = COALESCE(NULLIF(TRIM(p_schema_name), ''), DATABASE());

    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = v_schema_name
          AND table_name = 'table_registry'
          AND table_type = 'BASE TABLE'
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'table_registry does not exist in the selected schema';
    END IF;

    SET @verify_registry_sql = CONCAT(
        'SELECT missing_from, table_name, registered_type ',
        'FROM (',
        'SELECT ''PHYSICAL_TABLE'' AS missing_from, ',
        '       tr.table_name AS table_name, ',
        '       tr.table_type AS registered_type ',
        'FROM `', REPLACE(v_schema_name, '`', '``'), '`.table_registry tr ',
        'LEFT JOIN information_schema.tables t ',
        '       ON t.table_schema = ', QUOTE(v_schema_name), ' ',
        '      AND t.table_name = tr.table_name ',
        '      AND t.table_type = ''BASE TABLE'' ',
        'WHERE t.table_name IS NULL ',
        'UNION ALL ',
        'SELECT ''TABLE_REGISTRY'' AS missing_from, ',
        '       t.table_name AS table_name, ',
        '       NULL AS registered_type ',
        'FROM information_schema.tables t ',
        'LEFT JOIN `', REPLACE(v_schema_name, '`', '``'), '`.table_registry tr ',
        '       ON tr.table_name = t.table_name ',
        'WHERE t.table_schema = ', QUOTE(v_schema_name), ' ',
        '  AND t.table_type = ''BASE TABLE'' ',
        '  AND tr.table_name IS NULL ',
        '  AND t.table_name NOT IN (''flyway_schema_history'', ''table_registry'')',
        ') mismatches ',
        'ORDER BY missing_from, table_name'
    );

    PREPARE verify_registry_stmt FROM @verify_registry_sql;
    EXECUTE verify_registry_stmt;
    DEALLOCATE PREPARE verify_registry_stmt;
END$$

DELIMITER ;
