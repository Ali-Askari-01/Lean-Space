-- =============================================================================
-- Server-side Pro gates: habit slots + safe user insert
-- =============================================================================

-- Free tier: habit slots 0–2 only (3 slots). Pro: slots 0–4 (5 slots).
DROP POLICY IF EXISTS habits_owner_all ON public.habits;
CREATE POLICY habits_select_self ON public.habits
  FOR SELECT USING (user_id = auth.uid());

CREATE POLICY habits_insert_self ON public.habits
  FOR INSERT WITH CHECK (
    user_id = auth.uid()
    AND (
      slot_index <= 2
      OR EXISTS (
        SELECT 1 FROM public.users u
        WHERE u.id = auth.uid() AND u.tier = 'pro'
      )
    )
  );

CREATE POLICY habits_update_self ON public.habits
  FOR UPDATE
  USING (user_id = auth.uid())
  WITH CHECK (
    user_id = auth.uid()
    AND (
      slot_index <= 2
      OR EXISTS (
        SELECT 1 FROM public.users u
        WHERE u.id = auth.uid() AND u.tier = 'pro'
      )
    )
  );

CREATE POLICY habits_delete_self ON public.habits
  FOR DELETE USING (user_id = auth.uid());

-- Prevent client INSERT with tier = 'pro'
DROP POLICY IF EXISTS users_insert_self ON public.users;
CREATE POLICY users_insert_self ON public.users
  FOR INSERT
  WITH CHECK (id = auth.uid() AND tier = 'free');
