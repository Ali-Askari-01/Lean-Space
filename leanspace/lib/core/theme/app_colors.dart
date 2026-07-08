import 'package:flutter/material.dart';

/// Growth Guardian palette — warm cream + emerald sprout + solar coral.
/// Includes legacy aliases (`bg`, `text`, `accent` …) so older files keep compiling.
abstract final class AppColors {
  // ── Growth Guardian M3 palette ───────────────────────────────────────
  static const surface = Color(0xFFF9FAF4);
  static const surfaceDim = Color(0xFFD9DBD5);
  static const surfaceBright = Color(0xFFF9FAF4);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF3F4EE);
  static const surfaceContainer = Color(0xFFEDEEE8);
  static const surfaceContainerHigh = Color(0xFFE8E9E3);
  static const surfaceContainerHighest = Color(0xFFE2E3DD);
  static const onSurface = Color(0xFF1A1C19);
  static const onSurfaceVariant = Color(0xFF3E4A3F);
  static const inverseSurface = Color(0xFF2E312D);
  static const inverseOnSurface = Color(0xFFF0F1EB);
  static const outline = Color(0xFF6E7A6E);
  static const outlineVariant = Color(0xFFBDCABC);

  static const surfaceTint = Color(0xFF006D36);
  static const primary = Color(0xFF006D36);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFF50C878);
  static const onPrimaryContainer = Color(0xFF005025);
  static const inversePrimary = Color(0xFF66DD8B);

  static const secondary = Color(0xFFA53B22);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFFFE7D5E);
  static const onSecondaryContainer = Color(0xFF711601);

  static const tertiary = Color(0xFF00629F);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFF6DB7FF);
  static const onTertiaryContainer = Color(0xFF004776);

  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);

  static const primaryFixed = Color(0xFF83FBA5);
  static const primaryFixedDim = Color(0xFF66DD8B);
  static const onPrimaryFixed = Color(0xFF00210C);
  static const onPrimaryFixedVariant = Color(0xFF005227);

  static const secondaryFixed = Color(0xFFFFDAD2);
  static const secondaryFixedDim = Color(0xFFFFB4A3);
  static const onSecondaryFixed = Color(0xFF3D0700);
  static const onSecondaryFixedVariant = Color(0xFF84240D);

  static const tertiaryFixed = Color(0xFFD0E4FF);
  static const tertiaryFixedDim = Color(0xFF9BCBFF);
  static const onTertiaryFixed = Color(0xFF001D34);
  static const onTertiaryFixedVariant = Color(0xFF004A7A);

  static const background = Color(0xFFF9FAF4);
  static const onBackground = Color(0xFF1A1C19);
  static const surfaceVariant = Color(0xFFE2E3DD);

  static const gradientHabit = [Color(0xFF50C878), Color(0xFFA8E063)];
  static const gradientCta = [Color(0xFFA53B22), Color(0xFF006D36)];

  static const glassFill = Color(0x66FFFFFF);
  static const glassBorder = Color(0x99FFFFFF);
  static const glassShadow = Color(0x0D006D36);

  // ── Legacy aliases (for older widgets that still reference them) ─────
  static const bg = background;
  static const bgElev = surfaceContainer;
  static const border = outlineVariant;
  static const borderStrong = outline;
  static const text = onSurface;
  static const textMuted = onSurfaceVariant;
  static const textFaint = outline;
  static const accent = primary;
  static const accentSoft = primaryFixedDim;
  static const accentDeep = onPrimaryContainer;
  static const danger = error;
  static const warning = secondaryContainer;
}
