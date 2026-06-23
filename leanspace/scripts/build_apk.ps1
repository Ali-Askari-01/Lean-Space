# Build LeanSpace debug APK with Supabase config compiled in.
# Copy env.json.example to env.json and fill in your keys first.

$ErrorActionPreference = "Stop"
$env:JAVA_HOME = "C:\Program Files\Microsoft\jdk-17.0.19.10-hotspot"
$env:ANDROID_HOME = "$env:LOCALAPPDATA\Android\Sdk"
# Avoid Cursor sandbox redirecting Gradle into Temp\cursor-sandbox-cache.
$env:GRADLE_USER_HOME = Join-Path $env:USERPROFILE ".gradle"
$env:GRADLE_OPTS = "-Dorg.gradle.daemon=false"

Set-Location $PSScriptRoot\..

if ($args -contains "-Clean") {
    & (Join-Path $PSScriptRoot "clean_build_env.ps1")
}

if (-not (Test-Path env.json)) {
  Write-Error "Missing env.json - copy env.json.example to env.json and add your Supabase keys."
}

flutter pub get
flutter build apk --debug --dart-define-from-file=env.json

Write-Host ""
Write-Host "APK ready: build\app\outputs\flutter-apk\app-debug.apk"
Write-Host "Install: adb install -r build\app\outputs\flutter-apk\app-debug.apk"
