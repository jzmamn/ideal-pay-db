ALTER TABLE `overtime` 
CHANGE COLUMN `liable_for_epf` `liable_for_epf` CHAR(1) NOT NULL DEFAULT 'Y' AFTER `formula_enabled`,
CHANGE COLUMN `liable_for_etf` `liable_for_etf` CHAR(1) NOT NULL DEFAULT 'Y' AFTER `liable_for_epf`,
CHANGE COLUMN `liable_for_paye` `liable_for_paye` CHAR(1) NOT NULL DEFAULT 'Y' AFTER `liable_for_etf`;
