-- V20: JWT security tables + company_id on usr

-- Add company_id to usr (nullable so existing rows don't break)
ALTER TABLE usr ADD COLUMN company_id BIGINT NULL AFTER role_id;

-- Refresh tokens — one active token per user; rotated on each refresh
CREATE TABLE IF NOT EXISTS refresh_tokens (
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    token       VARCHAR(512) NOT NULL,
    user_id     BIGINT       NOT NULL,
    expires_at  DATETIME     NOT NULL,
    created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_refresh_token (token),
    KEY fk_rt_user (user_id),
    CONSTRAINT fk_rt_user FOREIGN KEY (user_id) REFERENCES usr (id) ON DELETE CASCADE
);

-- Revoked access tokens — stored until their natural expiry so they can be rejected
CREATE TABLE IF NOT EXISTS revoked_tokens (
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    token_jti   VARCHAR(100) NOT NULL COMMENT 'JWT jti claim',
    expires_at  DATETIME     NOT NULL COMMENT 'Prune rows after this timestamp',
    revoked_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_revoked_jti (token_jti)
);
