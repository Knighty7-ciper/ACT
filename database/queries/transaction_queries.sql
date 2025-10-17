-- Transactions: common queries
-- 1) Create transaction
-- Params: $1 user_id, $2 wallet_id, $3 type, $4 from_currency, $5 to_currency, $6 from_amount, $7 to_amount, $8 fee, $9 description, $10 reference_number, $11 stellar_tx_hash, $12 metadata
INSERT INTO transactions (
  user_id, wallet_id, type, from_currency, to_currency, from_amount, to_amount, fee, description, reference_number, stellar_transaction_hash, metadata, status
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, 'pending'
)
RETURNING *;

-- 2) Update status + history
-- Params: $1 tx_id, $2 status, $3 reason
WITH updated AS (
  UPDATE transactions SET status = $2, updated_at = now(), completed_at = CASE WHEN $2='completed' THEN now() ELSE completed_at END
  WHERE id = $1 RETURNING id
)
INSERT INTO transaction_status_history (transaction_id, status, reason)
SELECT id, $2, $3 FROM updated
RETURNING *;

-- 3) Get by user (paged)
-- Params: $1 user_id, $2 limit, $3 offset
SELECT * FROM transactions WHERE user_id = $1 ORDER BY created_at DESC LIMIT $2 OFFSET $3;

-- 4) Get by reference
-- Params: $1 reference_number
SELECT * FROM transactions WHERE reference_number = $1;
