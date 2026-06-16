-- Add optional description column to the grade table.
-- All existing rows (including the DEFAULT sentinel) will get NULL initially,
-- which is intentional since the column is nullable.
ALTER TABLE `grade`
    ADD COLUMN `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL
        AFTER `amount`;
