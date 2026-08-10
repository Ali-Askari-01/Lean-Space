# Daily Stitch API - Cloudflare Workers

This is the backend API server for Daily Stitch, built on Cloudflare Workers.

## Prerequisites

1. Cloudflare account
2. Node.js installed
3. Wrangler CLI installed (`npm install -g wrangler`)

## Setup

1. Login to Cloudflare:
   ```bash
   wrangler login
   ```

2. Create D1 database:
   ```bash
   wrangler d1 create daily-stitch-db
   ```

3. Update `wrangler.toml` with your database ID

4. Install dependencies:
   ```bash
   npm install
   ```

5. Initialize database schema:
   ```bash
   npm run d1:init
   ```

## Development

Start local development server:
```bash
npm run dev
```

## Deployment

Deploy to Cloudflare:
```bash
npm run deploy
```

## Data Migration

### Export from Supabase

1. Update `migrate-data.ts` with your Supabase credentials
2. Run export:
   ```bash
   npx ts-node migrate-data.ts
   ```

### Import to D1

1. Generate D1 import SQL:
   ```bash
   npx ts-node import-data.ts
   ```

2. Import to D1:
   ```bash
   npm run d1:migrate
   ```

## API Endpoints

### Authentication
- `POST /api/auth/google` - Google Sign-In
- `POST /api/auth/signup` - Email/Password Sign-Up
- `POST /api/auth/signin` - Email/Password Sign-In
- `GET /api/auth/me` - Get current user
- `POST /api/auth/signout` - Sign out

### Habits
- `GET /api/habits` - List habits
- `POST /api/habits` - Create habit
- `PUT /api/habits/:id` - Update habit
- `DELETE /api/habits/:id` - Delete habit
- `POST /api/habits/:id/toggle` - Toggle habit streak

### Todos
- `GET /api/todos/today` - Get today's tasks
- `GET /api/todos/streak` - Get all todos for streak calculation
- `GET /api/todos/left-behind` - Get missed tasks
- `POST /api/todos` - Create todo
- `POST /api/todos/:id/complete` - Mark todo as done
- `DELETE /api/todos/:id` - Delete todo

### Bootstrap
- `POST /api/bootstrap` - Sync profile, perform rollover, log app open

### Streak Freezes
- `GET /api/streak-freezes` - List frozen dates
- `POST /api/streak-freezes/use` - Use a streak freeze

### Referrals
- `GET /api/referrals/stats` - Get referral statistics
- `POST /api/referrals/apply` - Apply referral code

### Subscriptions
- `POST /api/subscription/verify-play-purchase` - Verify Google Play purchase
- `POST /webhook/play-rtdn` - Google Play RTDN webhook

### Entitlements
- `GET /api/entitlements` - Get user tier and Pro status

### Buddy System
- `GET /api/buddy/state` - Get buddy pair status
- `POST /api/buddy/invite` - Create buddy invite
- `POST /api/buddy/accept` - Accept buddy invite
- `POST /api/buddy/nudge` - Send buddy nudge
- `POST /api/buddy/unpair` - Unpair buddy

### Account
- `DELETE /api/account` - Delete user account

## Environment Variables

Set in `wrangler.toml` or via Wrangler secrets:

- `GOOGLE_CLIENT_ID` - Google OAuth Web Client ID
- `PLAY_PUBSUB_TOKEN` - Google Play Pub/Sub verification token

## Database

This project uses Cloudflare D1 (SQLite) instead of PostgreSQL.

Key differences from PostgreSQL:
- No UUID type - use TEXT (generated via `crypto.randomUUID()`)
- No TIMESTAMPTZ - use TEXT (ISO 8601 format)
- No RLS - enforced in Workers middleware
- BOOLEAN - stored as INTEGER (0/1)

## Session Management

Sessions are stored in D1 with 30-day expiry. The session token is a UUID stored in the `sessions` table.

## Security Notes

- Passwords are hashed using SHA-256 via Web Crypto API
- Google ID tokens are verified using Google's tokeninfo endpoint
- CORS is restricted to allowed origins
- All API endpoints require authentication except auth endpoints
