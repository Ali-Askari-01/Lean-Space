# LeanSpace security-audit implementation plan

## Purpose and required outcome

This plan instructs an auditor (human or coding agent) to perform the security audit described in the attached brief. It is deliberately procedural: complete the steps in order, keep evidence for every conclusion, and **do not change production code, migrations, secrets, deployments, or cloud configuration** during the audit. The deliverable is one evidence-backed report, not a collection of informal notes.

The audit is complete only when:

1. Every checklist ID 1.1 through 8.3 in the brief has exactly one verdict: PASS, FAIL, PARTIAL, or N/A.
2. Every PASS/PARTIAL/FAIL cites exact file-and-line evidence or a reproducible command result.
3. Every FAIL uses the required finding box and contains a safe, copy/paste-ready remediation.
4. Dynamic tests use only local/emulator/staging resources and disposable test accounts.
5. The final report includes all six sections required by the brief.

## 1. Scope and architecture to use during the audit

Treat these as three separate scopes. Do not infer that a control in one scope protects another.

| Scope | Status | What to inspect |
|---|---|---|
| Flutter Android client | Runtime | `leanspace/lib/`, `leanspace/android/`, `leanspace/pubspec.*`, build scripts and client configuration. |
| Cloudflare Worker + D1 | Runtime | `cloudflare-workers/src/`, `wrangler.toml`, `schema.sql`, `migrations/`, `package*.json`, deployment configuration. This is the live server authorization boundary; D1 has no Supabase RLS. |
| Supabase material | Legacy/migration scope | `supabase/`, `cloudflare-workers/migrate-data.ts`, `import-data.ts`, and legacy documentation. Review it for leaked secrets and unsafe migration tooling, but do not report a Supabase RLS issue as an active runtime finding unless deployment evidence proves Supabase is still live. |

Known runtime entry points to enumerate and verify:

- Worker: `cloudflare-workers/src/index.ts`, all files in `cloudflare-workers/src/routes/`, Worker cron handler, Google Play RTDN webhook, and any routes added after this plan.
- Client: Flutter startup/configuration, authentication screens/services, HTTP client, deep links, notifications, Android manifests and network security XML.
- Data: D1 schema plus every ordered D1 migration. Treat migrations as authoritative for deployed schema only after comparing them with the configured deployment environment.
- Non-runtime tooling: migration/import scripts, CI (`.github/`), PowerShell scripts, documentation examples, committed config, Git history.

## 2. Guardrails and prerequisites

1. Work from a clean, trusted clone. Record commit SHA, branch, audit date, OS, Node/npm version, Flutter/Dart version, Wrangler version, and whether dependencies were installed from the committed lockfiles.
2. Never paste real secrets, bearer tokens, passwords, session IDs, service-account JSON, or private URLs into the report. Redact as `[REDACTED]`; retain only the secret type, file path, line number, and a fingerprint if approved.
3. Never test against production with destructive requests. Use a local D1 database or explicitly approved staging resources and accounts `audit-user-a` and `audit-user-b`.
4. Do not run commands that automatically fix vulnerabilities (`npm audit fix`, dependency upgrades, migration deploys, secret rotation, or `wrangler deploy`). This is an audit, not remediation.
5. Preserve existing uncommitted work. Start with `git status --short`; do not discard, stage, or modify unrelated files.
6. Ask the repository owner before accessing Cloudflare dashboards, production logs, production D1, Google Cloud, Play Console, secret stores, or Git remote history that is unavailable locally. Record unavailable evidence as PARTIAL, not PASS.

## 3. Evidence folder and report files

Create these audit artifacts locally (do not commit them unless the owner asks):

```text
audit-artifacts/
  00-context.md
  01-inventory.md
  02-secret-scan.txt
  03-git-history.txt
  04-route-matrix.md
  05-data-access-matrix.md
  06-dependency-audit.json
  07-dynamic-tests.md
  LeanSpace-security-audit-YYYY-MM-DD.md
```

`00-context.md` must name the exact commit and environment. Save raw output before interpreting it. The final report must link each claim to one of these artifacts or a repository line number.

## 4. Phase A — discovery (finish before issuing findings)

### A1. Capture repository and deployment context

Run these from the repository root and save the output in the evidence folder:

```powershell
git rev-parse HEAD
git status --short
git log -1 --format=fuller
git ls-files
rg --files -g '!node_modules' -g '!build' -g '!dist'
Get-Content .gitignore
Get-Content cloudflare-workers/wrangler.toml
Get-Content cloudflare-workers/package.json
Get-Content leanspace/pubspec.yaml
```

Determine and state: deployed Worker names/environments, D1 binding names, allowed origins, scheduled triggers, required Worker secrets, client configuration keys, auth methods, session-token format/storage, and whether staging exists. Do not mark a runtime configuration PASS merely because an example file says it should be configured.

### A2. Read the complete implementation

Read every non-generated source file before writing any verdict. At a minimum include all TypeScript in `cloudflare-workers/src/`, every SQL schema/migration in both `cloudflare-workers/migrations/` and `supabase/migrations/`, all Flutter files under `leanspace/lib/`, Android manifest/security XML and Gradle configuration, package manifests/lockfiles, GitHub workflow files, and setup/build/migration scripts.

Exclude only generated Flutter localization files and binary assets after confirming their generator/source files were read. If a generated file contains hardcoded endpoint or key-like text, include it in the secret scan anyway.

### A3. Build the route matrix

Create `04-route-matrix.md`, one row per route/handler. Include every registration in `index.ts`, every method/path, webhook, cron, and client-initiated endpoint discovered from `api_client.dart`.

| Method/path | Handler/file:line | Public/protected | Identity mechanism | Inputs | D1 tables/external services | Write side effect | Rate limit | Validation | Tests needed |
|---|---|---|---|---|---|---|---|---|---|

For protected Worker routes, trace the actual middleware path from route registration to session lookup. Flag routes that rely only on client controls. For each D1 operation, note the ownership predicate (`WHERE user_id = ?`, equivalent transaction check, or missing). For public routes, document why public access is required and what abuse control exists.

### A4. Build the data-access matrix

From D1 schema/migrations, list every table, primary key, ownership column, foreign keys, unique constraints, sensitive fields, creation migration, and every Worker read/write call site. Use this table in `05-data-access-matrix.md`:

| Table | Sensitive data | Owner/authorization rule | Read call sites | Write call sites | DB constraint / transaction | Cross-user test |
|---|---|---|---|---|---|---|

For the legacy Supabase schema, separately list all public tables, RLS enablement/policies, storage buckets, RPC/functions, and `SECURITY DEFINER` functions. Its results are migration-tooling/legacy findings unless it remains deployed.

### A5. Map data flows and trust boundaries

Document these flows with source and sink lines: signup/signin, Google sign-in, session issuance/expiry/signout, Flutter token persistence and `Authorization` header creation, every user-owned CRUD flow, account deletion, referrals, buddy invitations, Google Play purchase verification, RTDN webhook, scheduled cron, external Google calls, and data migration/export tooling. For each, identify attacker-controlled input, validation point, authorization point, database write, logging/error behavior, and external call.

## 5. Phase B — repeatable tests and scans

### B1. Secrets, configuration, and history

Search tracked files, ignored-but-present local files (without printing secret values), build/config files, and history. Use a combination of targeted patterns and manual review; a match is a lead, not automatically a finding.

```powershell
rg -n --hidden -g '!node_modules/**' -g '!build/**' -g '!dist/**' -g '!.git/**' 'sk_(live|test)_[A-Za-z0-9_]+|sk-[A-Za-z0-9_-]+|pk_live_|Bearer\s+[A-Za-z0-9._-]+|eyJ[A-Za-z0-9._-]+|gh[pous]_|github_pat_|xox[baprs]-|AKIA[0-9A-Z]{16}' .
rg -n --hidden -g '!node_modules/**' -g '!build/**' -g '!.git/**' '(SUPABASE_SERVICE_ROLE|GOOGLE_SERVICE_ACCOUNT|CRON_SECRET|PLAY_PUBSUB_TOKEN|PRIVATE_KEY|PASSWORD|TOKEN|SECRET|API_KEY)' .
git log --all --name-only --format='' | Select-String -Pattern '(^|/)\.env(\..*)?$' | Select-Object -Unique
git log --all -S 'SUPABASE_SERVICE_ROLE_KEY' --oneline
git ls-files | Select-String -Pattern '(^|/)\.env(\..*)?$'
```

Review `.gitignore` against `.env`, `.env.local`, `.env.production`, `.env*.local`, Flutter `env.json`, Android signing files, Cloudflare `.dev.vars`, service-account files, and all example files. Inspect key names and use sites to classify public client configuration versus privileged server secrets. Verify worker secret declarations with `wrangler secret list --env production` only with owner approval; record names only.

### B2. Static review of authorization and validation

For every row in the route matrix, inspect handler code line by line. Confirm the HTTP method, auth middleware/explicit check, server-derived identity, ownership predicate, bounded and typed input validation, error handling, and external-call behavior. Search for JSON parsing and SQL construction:

```powershell
rg -n 'req\.json|JSON\.parse|c\.req\.param|c\.req\.query|prepare\(`|prepare\([^)]*\+|\.bind\(' cloudflare-workers/src
rg -n 'Authorization|Bearer|SharedPreferences|flutter_secure_storage|dotenv|env\.' leanspace/lib leanspace/android
rg -n 'console\.(log|error|warn)|print\(|debugPrint\(|throw new Error|stack' cloudflare-workers leanspace/lib
```

For each dynamic SQL occurrence, prove the SQL text is static and untrusted values are bound parameters. If SQL column names are built dynamically, prove they come only from a fixed allowlist.

### B3. Dependency analysis

Use the package manager matching each manifest and preserve raw JSON/text output:

```powershell
Push-Location cloudflare-workers; npm ci; npm audit --json; npm outdated; npm ls --all; Pop-Location
Push-Location leanspace; flutter pub get; flutter pub outdated; flutter analyze; Pop-Location
```

If network/package installation is unavailable, record the command failure and perform lockfile/manual review; do not claim a clean audit. For each direct dependency, locate imports with `rg`; classify it as runtime, dev-only, transitive, or apparently unused. For suspicious packages, verify the registry publisher, package age, repository, and download history using the official registry/package page with owner-approved network access. Do not treat legitimate low-download Flutter or Worker tooling as malicious without evidence.

### B4. Dynamic authorization and abuse tests

Only after a local/staging environment is available, create two disposable accounts. Use an HTTP client to replay all protected endpoints with: no token, malformed token, expired/revoked token (where safely possible), User A token targeting User B IDs, User A body fields claiming User B, oversized text, malformed JSON, unexpected fields, wrong method, and concurrent boundary requests.

Minimum endpoint-specific cases:

- Signup/signin/Google sign-in: malformed email/password, enumeration-resistant errors, repeated attempts, and session rotation/expiry/signout.
- Habits/todos: User A cannot list/read/update/delete/toggle User B resources; limits cannot be bypassed by direct API calls or concurrent creates.
- Buddy/referral: forged IDs/codes, self-referral, replay/duplicate acceptance, concurrent invite acceptance, unauthorized pair operations.
- Subscription verification: User A cannot reuse User B purchase token; malformed purchase payloads cannot create entitlement; repeated valid event is idempotent.
- RTDN webhook: missing/wrong credential is rejected before parsing or changing data; valid test event is idempotent.
- Cron: unauthenticated request is rejected; no sensitive result/error is returned.
- Account deletion: only the owner can invoke it; tokens/sessions and associated user data are invalidated as designed.
- CORS: preflight and actual requests from allowed origin, unknown origin, `null` origin, and requests with credentials. Record exact response headers.

Never brute-force passwords, referral codes, or webhook tokens. For rate limiting, use a small approved threshold and observe block behavior; do not generate abusive traffic.

## 6. Checklist execution procedure

Create a numbered heading for each ID below in the report. Do not merge entries. For every entry include `Verdict`, `Evidence`, `Reasoning`, `Runtime scope`, and `Follow-up/verification needed`. Use N/A only when the feature truly does not exist; explain how that was determined.

### 1. Environment variables and secrets

- **1.1 Hardcoded secrets:** review B1 results, source/config/docs/scripts, and Git history. Separate placeholders/public IDs from credential-bearing values.
- **1.2 `.gitignore` and history:** prove ignore patterns and tracked/history status; include Cloudflare `.dev.vars`, Flutter env JSON, and Android signing materials.
- **1.3 Public-prefix leaks:** adapt the check to Flutter: anything packaged into `leanspace/.env`, `env.json`, Dart constants, Android resources, or the APK is public. Worker secrets must be accessed only through `c.env` server code.
- **1.4 Console/error leaks:** trace logs and user-visible errors; include Worker logs and Flutter release behavior.
- **1.5 Build artifacts:** inspect Flutter release build settings, ProGuard/R8, source/repository mappings, web assets if enabled, and Worker source-map/deployment settings. The Next/Vite wording is N/A, but equivalent exposure is in scope.
- **1.6 Startup validation:** test missing required Worker bindings/secrets and missing client config. Verify failure is clear and fails closed without exposing values.

### 2. Database security

- **2.1 RLS enabled:** N/A for the D1 runtime; verify the Worker enforces authorization for every D1 access instead. Audit active Supabase schemas separately only if still deployed.
- **2.2 RLS policies:** N/A for D1; for legacy/active Supabase, inspect each table/policy exactly as requested.
- **2.3 `WITH CHECK`:** N/A for D1; inspect active/legacy Supabase policies and DB constraints. For D1, verify ownership cannot be altered through Worker writes.
- **2.4 Policy identity source:** N/A for D1; for Supabase verify `auth.uid()` and classify any metadata identity use.
- **2.5 Service-role isolation:** inspect legacy migration tooling and Flutter bundle for Supabase service key; prove no privileged credentials ship to the client.
- **2.6 Storage bucket policies:** N/A only after confirming no Supabase Storage/file storage exists. If present, inspect policies and public status.
- **2.7 SQL injection:** inspect all D1 `prepare`/`batch` use, migrations, RPC/raw clients, and dynamic SQL. Validate with safe malformed input in local/staging.
- **2.8 `SECURITY DEFINER`:** inspect every Supabase function/migration; N/A for D1-only runtime only after checking the legacy SQL.

### 3. Authentication and sessions

- **3.1 Auth middleware:** enumerate all Worker route registration and verify the actual protected-route mechanism.
- **3.2 Default deny:** determine whether new `/api/*` routes require opt-in public access or can accidentally become public.
- **3.3 `getUser` vs `getSession`:** N/A for the non-Supabase Worker runtime; instead verify each security-sensitive action validates the bearer session against D1 and expiry.
- **3.4 Callback:** assess the Google sign-in/token exchange equivalent, including token verification, audience, issuer, expiry, and log/response leakage.
- **3.5 Session storage:** for Flutter, verify encrypted platform storage and Android backup/extraction rules; `localStorage` wording is N/A unless Flutter web is built.
- **3.6 Protected API routes:** compare all route registrations to auth exclusions and dynamically test them.
- **3.7 OAuth:** inspect Google token validation, client IDs, redirect/deep-link handling, and state/nonce where an authorization-code flow exists.
- **3.8 Password reset:** determine whether implemented. N/A only if no reset endpoint/provider flow exists; otherwise test expiry, one-use, and transport.

### 4. Server-side validation

- **4.1 Schema validation:** make a per-route inventory of body/query/path fields, types, lengths, formats, enums, and unknown-field behavior. Manual validation is acceptable only when complete and test-covered.
- **4.2 Session identity:** prove all write identity comes from validated session, never a body/query user ID.
- **4.3 XSS:** Flutter native rendering normally renders strings as text, but inspect any HTML/WebView, URL launches, markdown, share cards, and web target code.
- **4.4 Methods:** compare registration and side effects; test unsupported methods and CORS preflight behavior.
- **4.5 Error leaks:** force safe invalid input and inspect API payloads, Worker logs, Flutter error states, and release-mode behavior.
- **4.6 Webhooks:** inspect RTDN verification in code and deployed configuration. A shared token alone may be insufficient depending on the configured Pub/Sub delivery model; document the exact trust chain.

### 5. Dependencies

- **5.1 Audit results:** report raw package-manager audit results by severity and date.
- **5.2 Hallucinated packages:** review every direct dependency and suspicious transitive package as described in B3.
- **5.3 Lockfile:** confirm `package-lock.json` and `pubspec.lock` are tracked and match manifests.
- **5.4 Outdated:** distinguish merely newer versions from versions with applicable, known security advisories.
- **5.5 Unused:** provide a direct-dependency import/reference map before recommending removal; account for build/tooling-only usage.

### 6. Rate limiting

- **6.1 Expensive operations:** map Google OAuth/tokeninfo, Play APIs, email/SMS (if any), and other paid/external operations; prove server-side limits and durable storage, or report gaps.
- **6.2 Auth endpoints:** inspect signup/signin/Google endpoints and provider-level protections. Client-side debounce is not a pass.
- **6.3 Implementation:** inspect key derivation, scope, TTL, bypass behavior, response, and persistence across Worker isolates/deployments.

### 7. CORS

- **7.1 API CORS:** test and inspect the Hono CORS configuration and `ALLOWED_ORIGINS` values. Native mobile requests do not enforce browser CORS, so CORS is not an authorization control.
- **7.2 Credentials:** assess only if credentialed cross-origin browser requests are supported; verify no wildcard origin is paired with credentials.

### 8. File uploads

- **8.1 Server validation:** N/A only after confirming no Worker route, Flutter picker, WebView flow, or storage integration accepts uploads.
- **8.2 Storage permissions:** N/A only after confirming no uploaded-object storage exists; otherwise test public/private access separately.
- **8.3 Execution prevention:** N/A only after confirming no uploads. If any exist, prove served content cannot execute and is outside executable application paths.

## 7. Severity, evidence, and remediation rules

Use exploitability and impact, not code style, to set severity:

| Severity | Use when |
|---|---|
| CRITICAL | Unauthenticated/low-friction compromise of many users, production secret exposure, remote code execution, or complete auth bypass. |
| HIGH | Practical cross-account data access/modification, privilege escalation, payment/entitlement abuse, or easily abused costly endpoint. |
| MEDIUM | Requires a valid account, unusual condition, limited data/action, or materially weak defense without demonstrated broad impact. |
| LOW | Limited information disclosure, hardening gap, or low-impact abuse. |

Do not invent exploit steps for a PASS. For a FAIL, preserve the brief's exact box structure, add a short reproduction using only the test environment, quote the minimal necessary vulnerable code, and supply a fix that fits this architecture (Worker/D1 or Flutter, not generic Next.js/Supabase code). Include test cases that prove the fix and an estimated effort.

## 8. Final report assembly and quality gate

Name the final report `audit-artifacts/LeanSpace-security-audit-YYYY-MM-DD.md`. Its required order is:

1. Security Posture Rating and executive summary.
2. Critical and High Findings.
3. Quick Wins (under 10 minutes).
4. Prioritized Remediation Plan, sorted severity then effort, with owner, affected scope, dependency, verification test, and estimate.
5. What's Already Done Right.
6. Checklist Summary with all 38 IDs and verdicts.
7. Appendix A: architecture/route/data-access inventories.
8. Appendix B: commands run, test environment, limitations, and redactions.

Before delivering, perform this mechanical review:

- Count checklist entries: 6 + 8 + 8 + 6 + 5 + 3 + 2 + 3 = **41** entries. Each must appear once (1.1–1.6, 2.1–2.8, 3.1–3.8, 4.1–4.6, 5.1–5.5, 6.1–6.3, 7.1–7.2, 8.1–8.3).
- Every FAIL has severity, category, location with line number, CWE, impact, minimal code excerpt, architecture-correct fix, effort, and verification test.
- Every PASS cites code/config/test evidence; no claim rests solely on documentation.
- Every N/A says what was searched and why the capability is absent.
- Ensure report text contains no usable secret, customer data, test credential, or production URL not already public.
- Clearly separate observed facts, dynamic-test results, and items blocked by unavailable deployment access.

## 9. Handoff sequence after the audit

1. Review CRITICAL/HIGH findings with the owner before any public release.
2. Convert each accepted finding into one remediation ticket with acceptance tests from the report.
3. Apply fixes in small changes, beginning with secret rotation/containment where exposure is confirmed.
4. Re-run only the affected checklist items and relevant dynamic tests after each change; record the new commit SHA and verdict.
5. Run a short full regression before release: dependency audit, auth boundary tests, cross-user D1 tests, webhook/cron authorization tests, CORS tests, and release Flutter analysis/tests.

