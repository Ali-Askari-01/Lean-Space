-- =============================================================================
-- Add notes column to habits (tending notes for a sprout)
-- =============================================================================
-- This migration is REQUIRED for the "Tending Notes" field on a habit to
-- persist in Supabase. If you see the error
--   "Could not find the 'notes' column of 'habits' in the schema cache"
-- it means this migration has not been applied to your Supabase project yet.
--
-- How to run it:
--   1. Open your Supabase dashboard -> SQL Editor -> New query
--   2. Paste the contents of this file
--   3. Click "Run" (or press Cmd/Ctrl + Enter)
--   4. Reload the app — habit notes will start saving
-- =============================================================================

ALTER TABLE public.habits
  ADD COLUMN IF NOT EXISTS notes TEXT;
