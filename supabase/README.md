# Supabase — LeanSpace

## Apply schema (required before Phase 1 features work)

**Important:** Paste **SQL code only** into the SQL Editor — not English instructions.

1. Open [Supabase Dashboard](https://supabase.com/dashboard) → your project → **SQL Editor** → **New query**
2. On your PC, open this file in a text editor:
   `supabase/migrations/20250622000000_initial_schema.sql`
3. Select **all** the file contents (starts with `-- LeanSpace initial schema`) and paste into the SQL Editor
4. Click **Run** — you should see **Success. No rows returned**

   That message is **normal**. `CREATE TABLE` does not return rows — it only creates tables. Check **Table Editor** to confirm tables exist.

You should see 8 tables under **Table Editor**: `users`, `habits`, `todos`, `projects`, `project_members`, `daily_logs`, `consumed_invites`, `app_opens`.

## Verify

Sign up in the app → a row appears in `public.users` (via `handle_new_user` trigger).

## Structure

```
supabase/
├── migrations/
│   └── 20250622000000_initial_schema.sql
└── functions/          # Phase 3+ (invites, scheduled rollover)
```

## CLI (optional later)

```bash
supabase link --project-ref YOUR_PROJECT_REF
supabase db push
```
