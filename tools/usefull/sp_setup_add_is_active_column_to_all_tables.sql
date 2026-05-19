DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setup_add_is_active_column_to_all_tables`(IN db_name VARCHAR(64))
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE tbl VARCHAR(255);

    DECLARE cur CURSOR FOR 
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = db_name
          AND table_type = 'BASE TABLE';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO tbl;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if column 'name' exists in table
        SET @has_name := (
            SELECT COUNT(*)
            FROM information_schema.columns
            WHERE table_schema = db_name
              AND table_name = tbl
              AND column_name = 'name'
        );

        -- Check if column 'is_active' already exists
        SET @has_active := (
            SELECT COUNT(*)
            FROM information_schema.columns
            WHERE table_schema = db_name
              AND table_name = tbl
              AND column_name = 'is_active'
        );

        -- Add column only if:
        -- 1. table has 'name'
        -- 2. does NOT already have 'is_active'
        IF @has_name > 0 AND @has_active = 0 THEN

            SET @sql = CONCAT(
                'ALTER TABLE `', db_name, '`.`', tbl, '` ',
                'ADD COLUMN `is_active` CHAR(1) NOT NULL DEFAULT ''Y'' ',
                'AFTER `name`'
            );

            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

        END IF;

    END LOOP;

    CLOSE cur;

END$$
DELIMITER ;
