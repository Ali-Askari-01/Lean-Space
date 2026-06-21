# Supabase — LeanSpace

Migrations and Edge Functions live here once Batch 1.2 starts.

## Quick start (when ready)

```bash
# From repo root — requires Supabase CLI + Docker for local stack
supabase init   # already done if this folder exists
supabase link --project-ref YOUR_PROJECT_REF
supabase db push
```

## Structure (created as you build)

```
supabase/
├── config.toml
├── migrations/          # DDL from engineering/02-TRD.md
└── functions/
    ├── rollover-cron/
    ├── generate-invite/
    ├── invite-redeem/
    └── play-billing-webhook/
```

For now, develop against your **cloud** Supabase project. Local Docker stack is optional until Batch 1.6 (rollover testing).
