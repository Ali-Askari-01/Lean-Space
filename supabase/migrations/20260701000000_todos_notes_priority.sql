-- =============================================================================
-- Add preparation notes + priority to todos
-- =============================================================================
-- This migration is REQUIRED for the "Add Task" sheet's notes and priority
-- fields to persist in Supabase. If you see the error
--   "Could not find the 'notes' column of 'todos' in the schema cache"
-- it means this migration has not been applied to your Supabase project yet.
--
-- How to run it:
--   1. Open your Supabase dashboard -> SQL Editor -> New query
--   2. Paste the contents of this file
--   3. Click "Run" (or press Cmd/Ctrl + Enter)
--   4. Reload the app — notes & priority will start saving
-- =============================================================================

ALTER TABLE public.todos
  ADD COLUMN IF NOT EXISTS notes   TEXT,
  ADD COLUMN IF NOT EXISTS priority TEXT
    CHECK (priority IS NULL OR priority IN ('standard', 'vital', 'spark'));

CREATE INDEX IF NOT EXISTS idx_todos_user_priority
  ON public.todos(user_id, priority)
  WHERE priority IS NOT NULL;
