-- Currencies and exchange rates
-- 1) List active currencies
SELECT * FROM currencies WHERE is_active = true ORDER BY code;

-- 2) Upsert currency
-- Params: $1 code, $2 name, $3 symbol, $4 country_code, $5 decimal_places, $6 is_active, $7 description
INSERT INTO currencies (code, name, symbol, country_code, decimal_places, is_active, description)
VALUES ($1,$2,$3,$4,COALESCE($5,2),COALESCE($6,true),$7)
ON CONFLICT (code) DO UPDATE SET
  name = EXCLUDED.name,
  symbol = EXCLUDED.symbol,
  country_code = EXCLUDED.country_code,
  decimal_places = EXCLUDED.decimal_places,
  is_active = EXCLUDED.is_active,
  description = EXCLUDED.description,
  updated_at = now()
RETURNING *;

-- 3) Get rate for pair
-- Params: $1 from, $2 to
SELECT * FROM exchange_rates WHERE from_currency = $1 AND to_currency = $2;

-- 4) Upsert exchange rate
-- Params: $1 from, $2 to, $3 rate, $4 bid, $5 ask, $6 source, $7 is_active
INSERT INTO exchange_rates (from_currency, to_currency, rate, bid, ask, source, is_active)
VALUES ($1,$2,$3,$4,$5,$6,COALESCE($7,true))
ON CONFLICT (from_currency, to_currency) DO UPDATE SET
  rate = EXCLUDED.rate,
  bid = EXCLUDED.bid,
  ask = EXCLUDED.ask,
  source = EXCLUDED.source,
  is_active = EXCLUDED.is_active,
  updated_at = now()
RETURNING *;
