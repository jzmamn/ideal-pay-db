-- description is optional for job categories
ALTER TABLE `job_category`
    MODIFY COLUMN `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;
