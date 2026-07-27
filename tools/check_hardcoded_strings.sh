#!/usr/bin/env bash
# Fail CI if obvious hardcoded English Text literals remain in feature UI code.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PATTERN='Text\(['\''"][A-Za-z]'
if rg -n "$PATTERN" "$ROOT/leanspace/lib/features" --glob '*.dart' \
  --glob '!**/*_test.dart' 2>/dev/null; then
  echo "Hardcoded English Text() literals found in features/. Wire to AppLocalizations."
  exit 1
fi
echo "No hardcoded English Text() literals in features/."
