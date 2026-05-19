DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setup_missing_default_row`(IN db_name VARCHAR(64))
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE tbl VARCHAR(255);

    DECLARE cur CURSOR FOR 
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = db_name
          AND table_type = 'BASE TABLE';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    DROP TEMPORARY TABLE IF EXISTS temp_missing;

    CREATE TEMPORARY TABLE temp_missing (
        table_name VARCHAR(255)
    );

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO tbl;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if table has 'id' column
        SET @has_id := (
            SELECT COUNT(*)
            FROM information_schema.columns
            WHERE table_schema = db_name
              AND table_name = tbl
              AND column_name = 'id'
        );

        IF @has_id > 0 THEN

            -- Check if id = -1 exists
            SET @sql := CONCAT(
                'SELECT COUNT(*) INTO @cnt ',
                'FROM `', db_name, '`.`', tbl, '` ',
                'WHERE id = -1'
            );

            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

            -- If no -1 record exists, mark table
            IF @cnt = 0 THEN
                INSERT INTO temp_missing VALUES (tbl);
            END IF;

        END IF;

    END LOOP;

    CLOSE cur;

    -- Final result
SELECT 
    *
FROM
    temp_missing;

END$$
DELIMITER ;
