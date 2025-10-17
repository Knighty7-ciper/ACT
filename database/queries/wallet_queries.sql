-- Wallets: common queries
-- 1) Get wallets by user
-- Params: $1 = user_id
SELECT * FROM wallets WHERE user_id = $1 ORDER BY created_at DESC;

-- 2) Upsert wallet by (user_id, currency_code)
-- Params: $1 user_id, $2 address, $3 currency_code, $4 balance, $5 wallet_type, $6 is_verified
INSERT INTO wallets (user_id, address, currency_code, balance, is_active, wallet_type, is_verified)
VALUES ($1, $2, $3, COALESCE($4,0), true, $5, COALESCE($6,false))
ON CONFLICT (user_id, currency_code) DO UPDATE SET
  address = EXCLUDED.address,
  balance = EXCLUDED.balance,
  is_active = EXCLUDED.is_active,
  wallet_type = EXCLUDED.wallet_type,
  is_verified = EXCLUDED.is_verified,
  updated_at = now()
RETURNING *;

-- 3) Adjust balance atomically (+/- amount)
-- Params: $1 wallet_id, $2 amount (numeric)
UPDATE wallets
SET balance = balance + $2, updated_at = now()
WHERE id = $1
RETURNING *;

-- 4) Get balance
-- Params: $1 wallet_id
SELECT balance FROM wallets WHERE id = $1;
