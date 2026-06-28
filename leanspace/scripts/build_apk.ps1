# Build LeanSpace debug APK with Supabase config compiled in.
# Copy env.json.example to env.json and fill in your keys first.

$ErrorActionPreference = "Stop"

# Use JAVA_HOME if already set to a JDK 17 install, otherwise look for one in
# common locations. The Android Gradle Plugin pinned in this project (8.9.1)
# does not support JDK 21+ or 25.
if (-not $env:JAVA_HOME -or -not (Test-Path (Join-Path $env:JAVA_HOME "bin\javac.exe"))) {
    $candidates = @(
        "C:\Program Files\Microsoft\jdk-17.0.19.10-hotspot",
        "C:\Program Files\Eclipse Adoptium\jdk-17.0.19.10-hotspot",
        "C:\Program Files\Eclipse Adoptium\temurin-17.0.19.10",
        "$env:USERPROFILE\scoop\apps\temurin17-jdk\current"
    )
    $env:JAVA_HOME = $candidates | Where-Object { Test-Path (Join-Path $_ "bin\javac.exe") } | Select-Object -First 1
    if (-not $env:JAVA_HOME) {
        Write-Error "No JDK 17 found. Set JAVA_HOME or install Temurin 17 (scoop install temurin17-jdk)."
    }
}

if (-not $env:ANDROID_HOME -or -not (Test-Path (Join-Path $env:ANDROID_HOME "platform-tools\adb.exe"))) {
    $candidates = @(
        "$env:LOCALAPPDATA\Android\Sdk",
        "C:\Android\Sdk"
    )
    $env:ANDROID_HOME = $candidates | Where-Object { Test-Path (Join-Path $_ "platform-tools\adb.exe") } | Select-Object -First 1
    if (-not $env:ANDROID_HOME) {
        Write-Error "No Android SDK found. Set ANDROID_HOME or install via sdkmanager."
    }
}

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
