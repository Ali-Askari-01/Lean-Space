import 'package:flutter/material.dart';

class ThemePalette {
  final Color surface;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color outline;
  final Color outlineVariant;
  final Color surfaceTint;
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color inversePrimary;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color primaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixed;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixed;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixed;
  final Color onTertiaryFixedVariant;
  final Color background;
  final Color onBackground;
  final Color surfaceVariant;
  final List<Color> gradientHabit;
  final List<Color> gradientCta;
  final Color glassFill;
  final Color glassBorder;
  final Color glassShadow;

  const ThemePalette({
    required this.surface,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.outline,
    required this.outlineVariant,
    required this.surfaceTint,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.inversePrimary,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.primaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixed,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixed,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixed,
    required this.onTertiaryFixedVariant,
    required this.background,
    required this.onBackground,
    required this.surfaceVariant,
    required this.gradientHabit,
    required this.gradientCta,
    required this.glassFill,
    required this.glassBorder,
    required this.glassShadow,
  });
}

enum ThemePreset {
  classicBloom,
  solarTerracotta,
  midnightOasis,
  lavenderDream,
  nordicFrost,
  cyberpunkNeon,
}

const classicPalette = ThemePalette(
  surface: Color(0xFFF9FAF4),
  surfaceDim: Color(0xFFD9DBD5),
  surfaceBright: Color(0xFFF9FAF4),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF3F4EE),
  surfaceContainer: Color(0xFFEDEEE8),
  surfaceContainerHigh: Color(0xFFE8E9E3),
  surfaceContainerHighest: Color(0xFFE2E3DD),
  onSurface: Color(0xFF1A1C19),
  onSurfaceVariant: Color(0xFF3E4A3F),
  inverseSurface: Color(0xFF2E312D),
  inverseOnSurface: Color(0xFFF0F1EB),
  outline: Color(0xFF6E7A6E),
  outlineVariant: Color(0xFFBDCABC),
  surfaceTint: Color(0xFF006D36),
  primary: Color(0xFF006D36),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF50C878),
  onPrimaryContainer: Color(0xFF005025),
  inversePrimary: Color(0xFF66DD8B),
  secondary: Color(0xFFA53B22),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFE7D5E),
  onSecondaryContainer: Color(0xFF711601),
  tertiary: Color(0xFF00629F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF6DB7FF),
  onTertiaryContainer: Color(0xFF004776),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF93000A),
  primaryFixed: Color(0xFF83FBA5),
  primaryFixedDim: Color(0xFF66DD8B),
  onPrimaryFixed: Color(0xFF00210C),
  onPrimaryFixedVariant: Color(0xFF005227),
  secondaryFixed: Color(0xFFFFDAD2),
  secondaryFixedDim: Color(0xFFFFB4A3),
  onSecondaryFixed: Color(0xFF3D0700),
  onSecondaryFixedVariant: Color(0xFF84240D),
  tertiaryFixed: Color(0xFFD0E4FF),
  tertiaryFixedDim: Color(0xFF9BCBFF),
  onTertiaryFixed: Color(0xFF001D34),
  onTertiaryFixedVariant: Color(0xFF004A7A),
  background: Color(0xFFF9FAF4),
  onBackground: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFE2E3DD),
  gradientHabit: [Color(0xFF50C878), Color(0xFFA8E063)],
  gradientCta: [Color(0xFFA53B22), Color(0xFF006D36)],
  glassFill: Color(0x66FFFFFF),
  glassBorder: Color(0x99FFFFFF),
  glassShadow: Color(0x0D006D36),
);

const solarTerracottaPalette = ThemePalette(
  surface: Color(0xFFFFF6F0),
  surfaceDim: Color(0xFFD9DBD5),
  surfaceBright: Color(0xFFFFF6F0),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF3F4EE),
  surfaceContainer: Color(0xFFEDEEE8),
  surfaceContainerHigh: Color(0xFFE8E9E3),
  surfaceContainerHighest: Color(0xFFE2E3DD),
  onSurface: Color(0xFF1A1C19),
  onSurfaceVariant: Color(0xFF3E4A3F),
  inverseSurface: Color(0xFF2E312D),
  inverseOnSurface: Color(0xFFF0F1EB),
  outline: Color(0xFF6E7A6E),
  outlineVariant: Color(0xFFBDCABC),
  surfaceTint: Color(0xFFC85A17),
  primary: Color(0xFFC85A17),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE9967A),
  onPrimaryContainer: Color(0xFF005025),
  inversePrimary: Color(0xFF66DD8B),
  secondary: Color(0xFFA53B22),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFE7D5E),
  onSecondaryContainer: Color(0xFF711601),
  tertiary: Color(0xFF00629F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF6DB7FF),
  onTertiaryContainer: Color(0xFF004776),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF93000A),
  primaryFixed: Color(0xFF83FBA5),
  primaryFixedDim: Color(0xFF66DD8B),
  onPrimaryFixed: Color(0xFF00210C),
  onPrimaryFixedVariant: Color(0xFF005227),
  secondaryFixed: Color(0xFFFFDAD2),
  secondaryFixedDim: Color(0xFFFFB4A3),
  onSecondaryFixed: Color(0xFF3D0700),
  onSecondaryFixedVariant: Color(0xFF84240D),
  tertiaryFixed: Color(0xFFD0E4FF),
  tertiaryFixedDim: Color(0xFF9BCBFF),
  onTertiaryFixed: Color(0xFF001D34),
  onTertiaryFixedVariant: Color(0xFF004A7A),
  background: Color(0xFFFFF6F0),
  onBackground: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFE2E3DD),
  gradientHabit: [Color(0xFF50C878), Color(0xFFA8E063)],
  gradientCta: [Color(0xFFA53B22), Color(0xFF006D36)],
  glassFill: Color(0x66FFFFFF),
  glassBorder: Color(0x99FFFFFF),
  glassShadow: Color(0x0D006D36),
);

const midnightOasisPalette = ThemePalette(
  surface: Color(0xFF0D1B2A),
  surfaceDim: Color(0xFFD9DBD5),
  surfaceBright: Color(0xFF0D1B2A),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF3F4EE),
  surfaceContainer: Color(0xFF1B263B),
  surfaceContainerHigh: Color(0xFFE8E9E3),
  surfaceContainerHighest: Color(0xFFE2E3DD),
  onSurface: Color(0xFFE0E1DD),
  onSurfaceVariant: Color(0xFF3E4A3F),
  inverseSurface: Color(0xFF2E312D),
  inverseOnSurface: Color(0xFFF0F1EB),
  outline: Color(0xFF6E7A6E),
  outlineVariant: Color(0xFFBDCABC),
  surfaceTint: Color(0xFF00B4D8),
  primary: Color(0xFF00B4D8),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF0077B6),
  onPrimaryContainer: Color(0xFF005025),
  inversePrimary: Color(0xFF66DD8B),
  secondary: Color(0xFFA53B22),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFE7D5E),
  onSecondaryContainer: Color(0xFF711601),
  tertiary: Color(0xFF00629F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF6DB7FF),
  onTertiaryContainer: Color(0xFF004776),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF93000A),
  primaryFixed: Color(0xFF83FBA5),
  primaryFixedDim: Color(0xFF66DD8B),
  onPrimaryFixed: Color(0xFF00210C),
  onPrimaryFixedVariant: Color(0xFF005227),
  secondaryFixed: Color(0xFFFFDAD2),
  secondaryFixedDim: Color(0xFFFFB4A3),
  onSecondaryFixed: Color(0xFF3D0700),
  onSecondaryFixedVariant: Color(0xFF84240D),
  tertiaryFixed: Color(0xFFD0E4FF),
  tertiaryFixedDim: Color(0xFF9BCBFF),
  onTertiaryFixed: Color(0xFF001D34),
  onTertiaryFixedVariant: Color(0xFF004A7A),
  background: Color(0xFF0D1B2A),
  onBackground: Color(0xFFE0E1DD),
  surfaceVariant: Color(0xFFE2E3DD),
  gradientHabit: [Color(0xFF50C878), Color(0xFFA8E063)],
  gradientCta: [Color(0xFFA53B22), Color(0xFF006D36)],
  glassFill: Color(0x66FFFFFF),
  glassBorder: Color(0x99FFFFFF),
  glassShadow: Color(0x0D006D36),
);

const lavenderDreamPalette = ThemePalette(
  surface: Color(0xFFF8F4FF),
  surfaceDim: Color(0xFFD9DBD5),
  surfaceBright: Color(0xFFF8F4FF),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF3F4EE),
  surfaceContainer: Color(0xFFEDEEE8),
  surfaceContainerHigh: Color(0xFFE8E9E3),
  surfaceContainerHighest: Color(0xFFE2E3DD),
  onSurface: Color(0xFF1A1C19),
  onSurfaceVariant: Color(0xFF3E4A3F),
  inverseSurface: Color(0xFF2E312D),
  inverseOnSurface: Color(0xFFF0F1EB),
  outline: Color(0xFF6E7A6E),
  outlineVariant: Color(0xFFBDCABC),
  surfaceTint: Color(0xFF9D4EDD),
  primary: Color(0xFF9D4EDD),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE0B1CB),
  onPrimaryContainer: Color(0xFF005025),
  inversePrimary: Color(0xFF66DD8B),
  secondary: Color(0xFFA53B22),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFE7D5E),
  onSecondaryContainer: Color(0xFF711601),
  tertiary: Color(0xFF00629F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF6DB7FF),
  onTertiaryContainer: Color(0xFF004776),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF93000A),
  primaryFixed: Color(0xFF83FBA5),
  primaryFixedDim: Color(0xFF66DD8B),
  onPrimaryFixed: Color(0xFF00210C),
  onPrimaryFixedVariant: Color(0xFF005227),
  secondaryFixed: Color(0xFFFFDAD2),
  secondaryFixedDim: Color(0xFFFFB4A3),
  onSecondaryFixed: Color(0xFF3D0700),
  onSecondaryFixedVariant: Color(0xFF84240D),
  tertiaryFixed: Color(0xFFD0E4FF),
  tertiaryFixedDim: Color(0xFF9BCBFF),
  onTertiaryFixed: Color(0xFF001D34),
  onTertiaryFixedVariant: Color(0xFF004A7A),
  background: Color(0xFFF8F4FF),
  onBackground: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFE2E3DD),
  gradientHabit: [Color(0xFF50C878), Color(0xFFA8E063)],
  gradientCta: [Color(0xFFA53B22), Color(0xFF006D36)],
  glassFill: Color(0x66FFFFFF),
  glassBorder: Color(0x99FFFFFF),
  glassShadow: Color(0x0D006D36),
);

const nordicFrostPalette = ThemePalette(
  surface: Color(0xFFF1FAEE),
  surfaceDim: Color(0xFFD9DBD5),
  surfaceBright: Color(0xFFF1FAEE),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF3F4EE),
  surfaceContainer: Color(0xFFEDEEE8),
  surfaceContainerHigh: Color(0xFFE8E9E3),
  surfaceContainerHighest: Color(0xFFE2E3DD),
  onSurface: Color(0xFF1A1C19),
  onSurfaceVariant: Color(0xFF3E4A3F),
  inverseSurface: Color(0xFF2E312D),
  inverseOnSurface: Color(0xFFF0F1EB),
  outline: Color(0xFF6E7A6E),
  outlineVariant: Color(0xFFBDCABC),
  surfaceTint: Color(0xFF8ECAE6),
  primary: Color(0xFF8ECAE6),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFA8DADC),
  onPrimaryContainer: Color(0xFF005025),
  inversePrimary: Color(0xFF66DD8B),
  secondary: Color(0xFFA53B22),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFE7D5E),
  onSecondaryContainer: Color(0xFF711601),
  tertiary: Color(0xFF00629F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF6DB7FF),
  onTertiaryContainer: Color(0xFF004776),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF93000A),
  primaryFixed: Color(0xFF83FBA5),
  primaryFixedDim: Color(0xFF66DD8B),
  onPrimaryFixed: Color(0xFF00210C),
  onPrimaryFixedVariant: Color(0xFF005227),
  secondaryFixed: Color(0xFFFFDAD2),
  secondaryFixedDim: Color(0xFFFFB4A3),
  onSecondaryFixed: Color(0xFF3D0700),
  onSecondaryFixedVariant: Color(0xFF84240D),
  tertiaryFixed: Color(0xFFD0E4FF),
  tertiaryFixedDim: Color(0xFF9BCBFF),
  onTertiaryFixed: Color(0xFF001D34),
  onTertiaryFixedVariant: Color(0xFF004A7A),
  background: Color(0xFFF1FAEE),
  onBackground: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFE2E3DD),
  gradientHabit: [Color(0xFF50C878), Color(0xFFA8E063)],
  gradientCta: [Color(0xFFA53B22), Color(0xFF006D36)],
  glassFill: Color(0x66FFFFFF),
  glassBorder: Color(0x99FFFFFF),
  glassShadow: Color(0x0D006D36),
);

const cyberpunkNeonPalette = ThemePalette(
  surface: Color(0xFF09090B),
  surfaceDim: Color(0xFFD9DBD5),
  surfaceBright: Color(0xFF09090B),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF3F4EE),
  surfaceContainer: Color(0xFF111115),
  surfaceContainerHigh: Color(0xFFE8E9E3),
  surfaceContainerHighest: Color(0xFFE2E3DD),
  onSurface: Color(0xFF39FF14),
  onSurfaceVariant: Color(0xFF3E4A3F),
  inverseSurface: Color(0xFF2E312D),
  inverseOnSurface: Color(0xFFF0F1EB),
  outline: Color(0xFF6E7A6E),
  outlineVariant: Color(0xFFBDCABC),
  surfaceTint: Color(0xFFFF007F),
  primary: Color(0xFFFF007F),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD90429),
  onPrimaryContainer: Color(0xFF005025),
  inversePrimary: Color(0xFF66DD8B),
  secondary: Color(0xFFA53B22),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFE7D5E),
  onSecondaryContainer: Color(0xFF711601),
  tertiary: Color(0xFF00629F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF6DB7FF),
  onTertiaryContainer: Color(0xFF004776),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF93000A),
  primaryFixed: Color(0xFF83FBA5),
  primaryFixedDim: Color(0xFF66DD8B),
  onPrimaryFixed: Color(0xFF00210C),
  onPrimaryFixedVariant: Color(0xFF005227),
  secondaryFixed: Color(0xFFFFDAD2),
  secondaryFixedDim: Color(0xFFFFB4A3),
  onSecondaryFixed: Color(0xFF3D0700),
  onSecondaryFixedVariant: Color(0xFF84240D),
  tertiaryFixed: Color(0xFFD0E4FF),
  tertiaryFixedDim: Color(0xFF9BCBFF),
  onTertiaryFixed: Color(0xFF001D34),
  onTertiaryFixedVariant: Color(0xFF004A7A),
  background: Color(0xFF09090B),
  onBackground: Color(0xFF39FF14),
  surfaceVariant: Color(0xFFE2E3DD),
  gradientHabit: [Color(0xFF50C878), Color(0xFFA8E063)],
  gradientCta: [Color(0xFFA53B22), Color(0xFF006D36)],
  glassFill: Color(0x66FFFFFF),
  glassBorder: Color(0x99FFFFFF),
  glassShadow: Color(0x0D006D36),
);

abstract final class AppColors {
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

  static Color get surface => palette.surface;
  static Color get surfaceDim => palette.surfaceDim;
  static Color get surfaceBright => palette.surfaceBright;
  static Color get surfaceContainerLowest => palette.surfaceContainerLowest;
  static Color get surfaceContainerLow => palette.surfaceContainerLow;
  static Color get surfaceContainer => palette.surfaceContainer;
  static Color get surfaceContainerHigh => palette.surfaceContainerHigh;
  static Color get surfaceContainerHighest => palette.surfaceContainerHighest;
  static Color get onSurface => palette.onSurface;
  static Color get onSurfaceVariant => palette.onSurfaceVariant;
  static Color get inverseSurface => palette.inverseSurface;
  static Color get inverseOnSurface => palette.inverseOnSurface;
  static Color get outline => palette.outline;
  static Color get outlineVariant => palette.outlineVariant;
  static Color get surfaceTint => palette.surfaceTint;
  static Color get primary => palette.primary;
  static Color get onPrimary => palette.onPrimary;
  static Color get primaryContainer => palette.primaryContainer;
  static Color get onPrimaryContainer => palette.onPrimaryContainer;
  static Color get inversePrimary => palette.inversePrimary;
  static Color get secondary => palette.secondary;
  static Color get onSecondary => palette.onSecondary;
  static Color get secondaryContainer => palette.secondaryContainer;
  static Color get onSecondaryContainer => palette.onSecondaryContainer;
  static Color get tertiary => palette.tertiary;
  static Color get onTertiary => palette.onTertiary;
  static Color get tertiaryContainer => palette.tertiaryContainer;
  static Color get onTertiaryContainer => palette.onTertiaryContainer;
  static Color get error => palette.error;
  static Color get onError => palette.onError;
  static Color get errorContainer => palette.errorContainer;
  static Color get onErrorContainer => palette.onErrorContainer;
  static Color get primaryFixed => palette.primaryFixed;
  static Color get primaryFixedDim => palette.primaryFixedDim;
  static Color get onPrimaryFixed => palette.onPrimaryFixed;
  static Color get onPrimaryFixedVariant => palette.onPrimaryFixedVariant;
  static Color get secondaryFixed => palette.secondaryFixed;
  static Color get secondaryFixedDim => palette.secondaryFixedDim;
  static Color get onSecondaryFixed => palette.onSecondaryFixed;
  static Color get onSecondaryFixedVariant => palette.onSecondaryFixedVariant;
  static Color get tertiaryFixed => palette.tertiaryFixed;
  static Color get tertiaryFixedDim => palette.tertiaryFixedDim;
  static Color get onTertiaryFixed => palette.onTertiaryFixed;
  static Color get onTertiaryFixedVariant => palette.onTertiaryFixedVariant;
  static Color get background => palette.background;
  static Color get onBackground => palette.onBackground;
  static Color get surfaceVariant => palette.surfaceVariant;
  static List<Color> get gradientHabit => palette.gradientHabit;
  static List<Color> get gradientCta => palette.gradientCta;
  static Color get glassFill => palette.glassFill;
  static Color get glassBorder => palette.glassBorder;
  static Color get glassShadow => palette.glassShadow;

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
