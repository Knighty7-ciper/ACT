-- Users: common queries
-- 1) Get user by email
-- Params: $1 = email
SELECT * FROM users WHERE email = $1;

-- 2) Create user (returns row)
-- Params: $1..$9 match columns
INSERT INTO users (
  email, password, first_name, last_name, phone_number, role, is_email_verified, is_active, country_code
) VALUES (
  $1, crypt($2, gen_salt('bf')), $3, $4, $5, COALESCE($6,'user'), COALESCE($7,false), COALESCE($8,true), $9
)
RETURNING *;

-- 3) Upsert user by email
-- Params: same as create
INSERT INTO users (
  email, password, first_name, last_name, phone_number, role, is_email_verified, is_active, country_code
) VALUES (
  $1, crypt($2, gen_salt('bf')), $3, $4, $5, COALESCE($6,'user'), COALESCE($7,false), COALESCE($8,true), $9
)
ON CONFLICT (email) DO UPDATE SET
  password = crypt($2, gen_salt('bf')),
  first_name = EXCLUDED.first_name,
  last_name = EXCLUDED.last_name,
  phone_number = EXCLUDED.phone_number,
  role = EXCLUDED.role,
  is_email_verified = EXCLUDED.is_email_verified,
  is_active = EXCLUDED.is_active,
  country_code = EXCLUDED.country_code,
  updated_at = now()
RETURNING *;

-- 4) List users (paged)
-- Params: $1 = limit, $2 = offset
SELECT * FROM users ORDER BY created_at DESC LIMIT $1 OFFSET $2;

-- 5) Delete user by id
-- Params: $1 = id
DELETE FROM users WHERE id = $1 RETURNING id;
