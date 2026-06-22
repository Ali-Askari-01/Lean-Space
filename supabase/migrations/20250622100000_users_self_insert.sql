-- Allow authenticated user to ensure their profile row exists (bootstrap upsert).
-- Safe if you already ran the initial migration.

DROP POLICY IF EXISTS users_insert_self ON public.users;
CREATE POLICY users_insert_self ON public.users
  FOR INSERT
  WITH CHECK (id = auth.uid());
