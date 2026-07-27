import re
import os

with open(r"c:\Users\TechnoTrade\Desktop\LeanSpace\leanspace\lib\core\theme\app_colors.dart", "r") as f:
    original = f.read()

colors = []
for line in original.splitlines():
    match = re.search(r"static const (\w+)\s*=\s*(Color\(.*?\)|\[.*?\]);", line)
    if match:
        name = match.group(1)
        if name not in ['bg', 'bgElev', 'border', 'borderStrong', 'text', 'textMuted', 'textFaint', 'accent', 'accentSoft', 'accentDeep', 'danger', 'warning']:
            colors.append((name, match.group(2)))

palette_class = """import 'package:flutter/material.dart';

class ThemePalette {
"""
for name, val in colors:
    if name.startswith("gradient"):
        palette_class += f"  final List<Color> {name};\n"
    else:
        palette_class += f"  final Color {name};\n"
palette_class += "\n  const ThemePalette({\n"
for name, val in colors:
    palette_class += f"    required this.{name},\n"
palette_class += "  });\n"
palette_class += "}\n\n"

presets = """enum ThemePreset {
  classicBloom,
  solarTerracotta,
  midnightOasis,
  lavenderDream,
  nordicFrost,
  cyberpunkNeon,
}

"""

def gen_palette(name, overrides):
    code = f"const {name}Palette = ThemePalette(\n"
    for k, v in colors:
        if k in overrides:
            code += f"  {k}: {overrides[k]},\n"
        else:
            code += f"  {k}: {v},\n"
    code += ");\n\n"
    return code

presets += gen_palette("classic", {})

# Solar Terracotta
presets += gen_palette("solarTerracotta", {
    "surface": "Color(0xFFFFF6F0)",
    "surfaceBright": "Color(0xFFFFF6F0)",
    "background": "Color(0xFFFFF6F0)",
    "primary": "Color(0xFFC85A17)",
    "surfaceTint": "Color(0xFFC85A17)",
    "primaryContainer": "Color(0xFFE9967A)",
})

# Midnight Oasis
presets += gen_palette("midnightOasis", {
    "surface": "Color(0xFF0D1B2A)",
    "surfaceBright": "Color(0xFF0D1B2A)",
    "background": "Color(0xFF0D1B2A)",
    "onSurface": "Color(0xFFE0E1DD)",
    "onBackground": "Color(0xFFE0E1DD)",
    "primary": "Color(0xFF00B4D8)",
    "surfaceTint": "Color(0xFF00B4D8)",
    "primaryContainer": "Color(0xFF0077B6)",
    "surfaceContainer": "Color(0xFF1B263B)",
})

# Lavender Dream
presets += gen_palette("lavenderDream", {
    "surface": "Color(0xFFF8F4FF)",
    "surfaceBright": "Color(0xFFF8F4FF)",
    "background": "Color(0xFFF8F4FF)",
    "primary": "Color(0xFF9D4EDD)",
    "surfaceTint": "Color(0xFF9D4EDD)",
    "primaryContainer": "Color(0xFFE0B1CB)",
})

# Nordic Frost
presets += gen_palette("nordicFrost", {
    "surface": "Color(0xFFF1FAEE)",
    "surfaceBright": "Color(0xFFF1FAEE)",
    "background": "Color(0xFFF1FAEE)",
    "primary": "Color(0xFF8ECAE6)",
    "surfaceTint": "Color(0xFF8ECAE6)",
    "primaryContainer": "Color(0xFFA8DADC)",
})

# Cyberpunk Neon
presets += gen_palette("cyberpunkNeon", {
    "surface": "Color(0xFF09090B)",
    "surfaceBright": "Color(0xFF09090B)",
    "background": "Color(0xFF09090B)",
    "onSurface": "Color(0xFF39FF14)",
    "onBackground": "Color(0xFF39FF14)",
    "primary": "Color(0xFFFF007F)",
    "surfaceTint": "Color(0xFFFF007F)",
    "primaryContainer": "Color(0xFFD90429)",
    "surfaceContainer": "Color(0xFF111115)",
})

app_colors_class = """abstract final class AppColors {
  static ThemePreset currentPreset = ThemePreset.classicBloom;

  static ThemePalette get palette {
    switch (currentPreset) {
      case ThemePreset.classicBloom: return classicPalette;
      case ThemePreset.solarTerracotta: return solarTerracottaPalette;
      case ThemePreset.midnightOasis: return midnightOasisPalette;
      case ThemePreset.lavenderDream: return lavenderDreamPalette;
      case ThemePreset.nordicFrost: return nordicFrostPalette;
      case ThemePreset.cyberpunkNeon: return cyberpunkNeonPalette;
    }
  }

"""
for name, val in colors:
    app_colors_class += f"  static {'List<Color>' if name.startswith('gradient') else 'Color'} get {name} => palette.{name};\n"

app_colors_class += """
  static Color get bg => background;
  static Color get bgElev => surfaceContainer;
  static Color get border => outlineVariant;
  static Color get borderStrong => outline;
  static Color get text => onSurface;
  static Color get textMuted => onSurfaceVariant;
  static Color get textFaint => outline;
  static Color get accent => primary;
  static Color get accentSoft => primaryFixedDim;
  static Color get accentDeep => onPrimaryContainer;
  static Color get danger => error;
  static Color get warning => secondaryContainer;
}
"""

with open(r"c:\Users\TechnoTrade\Desktop\LeanSpace\leanspace\lib\core\theme\app_colors.dart", "w") as f:
    f.write(palette_class)
    f.write(presets)
    f.write(app_colors_class)
