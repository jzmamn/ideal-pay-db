-- description is optional for departments
ALTER TABLE `department`
    MODIFY COLUMN `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;
