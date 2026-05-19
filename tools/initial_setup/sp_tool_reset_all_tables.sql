DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tool_reset_all_tables`(IN db_name VARCHAR(64))
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE tbl VARCHAR(255);

    DECLARE cur CURSOR FOR 
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = db_name
          AND table_type = 'BASE TABLE';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Disable FK checks
    SET FOREIGN_KEY_CHECKS = 0;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO tbl;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Skip system tables (optional filter)
        IF tbl NOT IN ('usr') THEN

            SET @sql = CONCAT('TRUNCATE TABLE `', db_name, '`.`', tbl, '`');
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

        END IF;

    END LOOP;

    CLOSE cur;

    -- Re-enable FK checks
    SET FOREIGN_KEY_CHECKS = 1;

END$$
DELIMITER ;
