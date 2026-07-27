#!/usr/bin/env python3
"""Sync ARB locale files with app_en.arb and optionally fill missing translations."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
L10N_DIR = ROOT / "leanspace" / "lib" / "l10n"
TEMPLATE = L10N_DIR / "app_en.arb"
LOCALES = [
    "ar", "bn", "de", "es", "fr", "hi", "id", "it", "pa", "ps", "pt", "sd", "tr", "ur"
]

_PLACEHOLDER_RE = re.compile(r"\{([^}]+)\}")


def _placeholder_names(text: str) -> list[str]:
    return _PLACEHOLDER_RE.findall(text)


def fix_placeholders() -> int:
    """Restore ICU placeholder names from English template."""
    en = load_arb(TEMPLATE)
    fixed = 0
    for loc in LOCALES:
        path = L10N_DIR / f"app_{loc}.arb"
        if not path.exists():
            continue
        data = load_arb(path)
        for key, en_val in en.items():
            if key.startswith("@") or key == "@@locale":
                continue
            if key not in data or not isinstance(en_val, str):
                continue
            en_names = _placeholder_names(en_val)
            if not en_names:
                continue
            loc_val = data.get(key)
            if not isinstance(loc_val, str):
                continue
            loc_names = _placeholder_names(loc_val)
            if loc_names == en_names:
                continue
            # Rebuild: keep translated text but fix brace tokens to English names.
            rebuilt = loc_val
            for wrong, right in zip(loc_names, en_names):
                rebuilt = rebuilt.replace(f"{{{wrong}}}", f"{{{right}}}")
            if rebuilt != loc_val:
                data[key] = rebuilt
                fixed += 1
        save_arb(path, data)
    return fixed


def load_arb(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    while text.startswith("\ufeff"):
        text = text[1:]
    return json.loads(text)


def save_arb(path: Path, data: dict) -> None:
  # Preserve @@locale first, then sorted keys (metadata after keys)
    locale = data.get("@@locale", path.stem.replace("app_", ""))
    ordered: dict = {"@@locale": locale}
    meta: dict = {}
    for key, value in data.items():
        if key == "@@locale":
            continue
        if key.startswith("@"):
            meta[key] = value
        else:
            ordered[key] = value
    for key in sorted(meta):
        ordered[key] = meta[key]
    path.write_text(json.dumps(ordered, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def sync_keys(translate: bool = False) -> int:
    en = load_arb(TEMPLATE)
    en_keys = {k: v for k, v in en.items() if not k.startswith("@") and k != "@@locale"}
    missing_total = 0

    translator = None
    if translate:
        try:
            from deep_translator import GoogleTranslator  # type: ignore
        except ImportError:
            print("Install deep-translator for --translate: pip install deep-translator")
            translate = False

    for loc in LOCALES:
        path = L10N_DIR / f"app_{loc}.arb"
        if not path.exists():
            print(f"skip missing {path.name}")
            continue
        data = load_arb(path)
        added = 0
        for key, en_val in en_keys.items():
            if key not in data:
                val = en_val
                if translate and isinstance(en_val, str) and en_val.strip():
                    if "{" in en_val:
                        val = en_val  # keep English template for ICU strings; translate manually
                    else:
                        try:
                            val = GoogleTranslator(source="en", target=loc).translate(en_val)
                        except Exception as e:
                            print(f"translate fail {loc}.{key}: {e}")
                            val = en_val
                data[key] = val
                meta_key = f"@{key}"
                if meta_key in en:
                    data[meta_key] = en[meta_key]
                added += 1
        save_arb(path, data)
        missing_total += added
        print(f"{path.name}: added {added} keys")
    return missing_total


def validate() -> bool:
    en = load_arb(TEMPLATE)
    en_keys = {k for k in en if not k.startswith("@") and k != "@@locale"}
    ok = True
    for path in sorted(L10N_DIR.glob("app_*.arb")):
        if path.name == "app_en.arb":
            continue
        data = load_arb(path)
        keys = {k for k in data if not k.startswith("@") and k != "@@locale"}
        missing = en_keys - keys
        extra = keys - en_keys
        if missing:
            ok = False
            print(f"FAIL {path.name} missing {len(missing)} keys")
        if extra:
            print(f"WARN {path.name} extra {len(extra)} keys")
    if ok:
        print("All locale files have key parity with app_en.arb")
    return ok


def main() -> None:
    translate = "--translate" in sys.argv
    if "--fix-placeholders" in sys.argv:
        n = fix_placeholders()
        print(f"Fixed {n} placeholder strings.")
        validate()
        return
    if "--validate" in sys.argv:
        sys.exit(0 if validate() else 1)
    added = sync_keys(translate=translate)
    print(f"Done. {added} keys added across locales.")
    validate()


if __name__ == "__main__":
    main()
