-- ============================================
-- Create No Pay Master Table
-- ============================================

CREATE TABLE `nopay` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,

  `is_active` char(1) NOT NULL DEFAULT 'N',

  `liable_for_epf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_etf` char(1) NOT NULL DEFAULT 'N',
  `liable_for_paye` char(1) NOT NULL DEFAULT 'N',

  `formula` varchar(500) DEFAULT NULL,
  `formula_enabled` char(1) NOT NULL DEFAULT 'N',

  `created_by` bigint NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

  `modified_by` bigint NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),

  UNIQUE KEY `uk_nopay_code` (`code`),

  KEY `idx_nopay_created_by` (`created_by`),
  KEY `idx_nopay_modified_by` (`modified_by`),

  CONSTRAINT `fk_nopay_created_by`
    FOREIGN KEY (`created_by`) REFERENCES `usr` (`id`),

  CONSTRAINT `fk_nopay_modified_by`
    FOREIGN KEY (`modified_by`) REFERENCES `usr` (`id`),

  CONSTRAINT `chk_nopay_active`
    CHECK (`is_active` IN ('Y','N')),

  CONSTRAINT `chk_nopay_epf`
    CHECK (`liable_for_epf` IN ('Y','N')),

  CONSTRAINT `chk_nopay_etf`
    CHECK (`liable_for_etf` IN ('Y','N')),

  CONSTRAINT `chk_nopay_paye`
    CHECK (`liable_for_paye` IN ('Y','N'))

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


-- ============================================
-- Seed Default Record
-- ============================================

INSERT INTO nopay
(
    id,
    code,
    name,
    description,
    is_active,
    liable_for_epf,
    liable_for_etf,
    liable_for_paye,
    formula,
    formula_enabled,
    created_by,
    modified_by
)
VALUES
(
    -1,
    'DEFAULT',
    'Default No Pay',
    'System Default No Pay',
    'Y',
    'N',
    'N',
    'N',
    NULL,
    'N',
    -1,
    -1
);