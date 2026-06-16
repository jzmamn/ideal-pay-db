ALTER TABLE `employee`
    ADD COLUMN `grade_is_active` CHAR(1) NOT NULL DEFAULT 'N' AFTER `grade_id`;
