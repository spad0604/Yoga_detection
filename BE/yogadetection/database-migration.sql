-- Migration script to fix database schema issues
-- Run this on your PostgreSQL database before starting the application

-- ==================================================
-- FIX 1: User table - role and provider columns
-- ==================================================

-- Update existing NULL role values to 'USER'
UPDATE "user" SET role = 'USER' WHERE role IS NULL;

-- Update existing NULL provider values to 'ACCOUNT_CREATION'
UPDATE "user" SET provider = 'ACCOUNT_CREATION' WHERE provider IS NULL;

-- Now make columns NOT NULL (if not already)
ALTER TABLE "user" ALTER COLUMN role SET NOT NULL;
ALTER TABLE "user" ALTER COLUMN provider SET NOT NULL;

-- Set default values for future inserts
ALTER TABLE "user" ALTER COLUMN role SET DEFAULT 'USER';
ALTER TABLE "user" ALTER COLUMN provider SET DEFAULT 'ACCOUNT_CREATION';

-- ==================================================
-- FIX 2: Notifications table - is_read column
-- ==================================================

-- Update existing NULL is_read values to FALSE (unread by default)
UPDATE notifications SET is_read = FALSE WHERE is_read IS NULL;

-- Now make column NOT NULL (if not already)
ALTER TABLE notifications ALTER COLUMN is_read SET NOT NULL;

-- Set default value for future inserts
ALTER TABLE notifications ALTER COLUMN is_read SET DEFAULT FALSE;

-- ==================================================
-- FIX 3: User table - add phone column
-- ==================================================

ALTER TABLE "user" ADD COLUMN IF NOT EXISTS phone VARCHAR(32);
