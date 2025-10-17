-- Seed: demo transaction for demo@pesa-afrik.io
-- Idempotent and safe: only inserts if the demo user exists; upserts by reference_number

-- 1) Ensure a unique index exists for ON CONFLICT to work
CREATE UNIQUE INDEX IF NOT EXISTS ux_transactions_reference_number
  ON public.transactions (reference_number)
  WHERE reference_number IS NOT NULL;

-- 2) Insert or update the demo transaction
WITH u AS (
  SELECT id AS user_id
  FROM public.users
  WHERE email = 'demo@pesa-afrik.io'
),
w AS (
  SELECT id AS wallet_id
  FROM public.wallets
  WHERE user_id = (SELECT user_id FROM u)
    AND currency_code = 'ACT'
  LIMIT 1
)
INSERT INTO public.transactions (
  id,
  user_id,
  wallet_id,
  type,
  from_currency,
  to_currency,
  from_amount,
  to_amount,
  fee,
  status,
  description,
  reference_number,
  stellar_transaction_hash,
  metadata,
  completed_at
)
SELECT
  gen_random_uuid(),
  u.user_id,
  w.wallet_id,
  'transfer',
  'ACT',
  'NGN',
  10.00000000,
  12000.00000000,
  0.01000000,
  'completed',
  'Demo seed transfer',
  'REF-DEMO-0001',
  'TXHASHDEMO0001',
  '{"channel":"seed"}'::jsonb,
  now()
FROM u
LEFT JOIN w ON true
-- If the demo user doesn't exist, this SELECT yields no rows and nothing is inserted
ON CONFLICT (reference_number) DO UPDATE SET
  status = EXCLUDED.status,
  description = EXCLUDED.description,
  stellar_transaction_hash = EXCLUDED.stellar_transaction_hash,
  metadata = EXCLUDED.metadata,
  completed_at = EXCLUDED.completed_at,
  updated_at = now();
