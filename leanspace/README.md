# LeanSpace — Flutter App

Android-first Flutter app for LeanSpace. Run from this directory.

## Prerequisites

1. Flutter SDK (stable) — `flutter doctor`
2. Android SDK (command-line, no Android Studio required)
3. Physical Android phone with **USB debugging** enabled
4. Supabase project — copy keys into `.env`

See `../execution/11-DEV-SETUP.md` and `../execution/00-IMPLEMENTATION-READINESS.md`.

## First-time setup

```powershell
# 1. Configure Supabase
copy .env.example .env
# Edit .env with your SUPABASE_URL and SUPABASE_ANON_KEY

# 2. Install dependencies
flutter pub get

# 3. Connect phone via USB, verify device
adb devices

# 4. Run on device
flutter run
```

## Project layout

```
lib/
├── main.dart                 # Bootstrap, Supabase init
├── app.dart                  # MaterialApp + theme
├── core/env.dart             # Environment variables
├── router/app_router.dart    # go_router routes
└── features/
    ├── auth/                 # Sign in / sign up
    ├── my_day/               # Personal tab
    ├── our_space/            # Team tab
    ├── settings/
    └── shell/                # Bottom navigation
```

## Routes (Batch 1.1)

| Path | Screen |
|---|---|
| `/auth` | Sign in / sign up |
| `/my-day` | My Day (placeholder) |
| `/our-space` | Our Space (placeholder) |
| `/settings` | Settings |

## Daily dev loop

```powershell
flutter run          # hot reload on save
flutter analyze      # static checks
flutter test         # unit/widget tests
```

## Build release APK (later)

```powershell
flutter build apk --release
```

Package ID: `com.leanspace` · Min SDK: 26
