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

  // ── Premium additions ──
  final List<Color> ambientGradientTop;
  final List<Color> ambientGradientBottom;
  final Color dotPatternColor;
  final List<Color> cardGradient;
  final Color cardBorder;
  final Color cardShadow;
  final List<Color> shareCardGradient;
  final List<Color> shareCardBokeh;
  final Color shareCardAccent;
  final List<Color> navIndicatorGradient;
  final Color navBackground;
  final Color navBorder;
  final List<Color> heroGradient;
  final Color progressTrack;
  final List<Color> progressFill;
  final Color bottomSheetHandle;
  final Color dividerColor;
  final List<Color> fabGradient;
  final Color elevatedCardSurface;
  final Color shimmerBase;
  final Color shimmerHighlight;

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
    required this.ambientGradientTop,
    required this.ambientGradientBottom,
    required this.dotPatternColor,
    required this.cardGradient,
    required this.cardBorder,
    required this.cardShadow,
    required this.shareCardGradient,
    required this.shareCardBokeh,
    required this.shareCardAccent,
    required this.navIndicatorGradient,
    required this.navBackground,
    required this.navBorder,
    required this.heroGradient,
    required this.progressTrack,
    required this.progressFill,
    required this.bottomSheetHandle,
    required this.dividerColor,
    required this.fabGradient,
    required this.elevatedCardSurface,
    required this.shimmerBase,
    required this.shimmerHighlight,
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

// ──────────────────────────────────────────────
// Classic Bloom – organic, lush garden greens
// ──────────────────────────────────────────────
const classicPalette = ThemePalette(
  surface: Color(0xFFF8FAF3),
  surfaceDim: Color(0xFFD4D9CC),
  surfaceBright: Color(0xFFF8FAF3),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF1F4EB),
  surfaceContainer: Color(0xFFEBEEE5),
  surfaceContainerHigh: Color(0xFFE5E8DF),
  surfaceContainerHighest: Color(0xFFDFE2D9),
  onSurface: Color(0xFF181D14),
  onSurfaceVariant: Color(0xFF42493A),
  inverseSurface: Color(0xFF2D3228),
  inverseOnSurface: Color(0xFFF0F2EC),
  outline: Color(0xFF727A6B),
  outlineVariant: Color(0xFFC2C9BB),
  surfaceTint: Color(0xFF2E7D4F),
  primary: Color(0xFF2E7D4F),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF5DBB78),
  onPrimaryContainer: Color(0xFF00391A),
  inversePrimary: Color(0xFF6EDD92),
  secondary: Color(0xFFB94A1F),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFF7B52),
  onSecondaryContainer: Color(0xFF5C1800),
  tertiary: Color(0xFF1565A7),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF54A0D6),
  onTertiaryContainer: Color(0xFF003560),
  error: Color(0xFFBC342E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF8C120E),
  primaryFixed: Color(0xFF7FFDB1),
  primaryFixedDim: Color(0xFF54C882),
  onPrimaryFixed: Color(0xFF001F0B),
  onPrimaryFixedVariant: Color(0xFF105530),
  secondaryFixed: Color(0xFFFFDBCF),
  secondaryFixedDim: Color(0xFFFFB5A0),
  onSecondaryFixed: Color(0xFF3D0C00),
  onSecondaryFixedVariant: Color(0xFF803009),
  tertiaryFixed: Color(0xFFD3E5FF),
  tertiaryFixedDim: Color(0xFF9BC4FF),
  onTertiaryFixed: Color(0xFF001D37),
  onTertiaryFixedVariant: Color(0xFF004C7E),
  background: Color(0xFFF8FAF3),
  onBackground: Color(0xFF181D14),
  surfaceVariant: Color(0xFFDFE2D9),
  gradientHabit: [Color(0xFF2E7D4F), Color(0xFF8BC34A)],
  gradientCta: [Color(0xFFB94A1F), Color(0xFF2E7D4F)],
  glassFill: Color(0x55FFFFFF),
  glassBorder: Color(0x88FFFFFF),
  glassShadow: Color(0x152E7D4F),
  // Premium fields
  ambientGradientTop: [Color(0x402E7D4F), Colors.transparent],
  ambientGradientBottom: [Color(0x25FF7B52), Colors.transparent],
  dotPatternColor: Color(0x22727A6B),
  cardGradient: [Color(0xFFF1F4EB), Color(0xFFE8EBE2)],
  cardBorder: Color(0xFFD0D5C8),
  cardShadow: Color(0x1A2E7D4F),
  shareCardGradient: [Color(0xFF0D2818), Color(0xFF1A4D2E), Color(0xFF2E7D4F)],
  shareCardBokeh: [Color(0xFFFFE08A), Color(0xFFFFA37A), Color(0xFF8FE3B6)],
  shareCardAccent: Color(0xFFE8A33D),
  navIndicatorGradient: [Color(0xFF2E7D4F), Color(0xFF5DBB78)],
  navBackground: Color(0xFFF8FAF3),
  navBorder: Color(0xFFD0D5C8),
  heroGradient: [Color(0xFF2E7D4F), Color(0xFF1A6B3A)],
  progressTrack: Color(0xFFDFE2D9),
  progressFill: [Color(0xFF2E7D4F), Color(0xFF8BC34A)],
  bottomSheetHandle: Color(0xFFC2C9BB),
  dividerColor: Color(0xFFD0D5C8),
  fabGradient: [Color(0xFFB94A1F), Color(0xFFD4642E)],
  elevatedCardSurface: Color(0xFFF5F7F0),
  shimmerBase: Color(0x30C2C9BB),
  shimmerHighlight: Color(0x50FFFFFF),
);

// ──────────────────────────────────────────────
// Solar Terracotta – warm sunset, clay & amber
// ──────────────────────────────────────────────
const solarTerracottaPalette = ThemePalette(
  surface: Color(0xFFFFF8F3),
  surfaceDim: Color(0xFFE0D5CC),
  surfaceBright: Color(0xFFFFF8F3),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFFFF1E8),
  surfaceContainer: Color(0xFFFFECE0),
  surfaceContainerHigh: Color(0xFFFFE6D8),
  surfaceContainerHighest: Color(0xFFFFE0D0),
  onSurface: Color(0xFF2D1C10),
  onSurfaceVariant: Color(0xFF6B4E3A),
  inverseSurface: Color(0xFF3D2A1A),
  inverseOnSurface: Color(0xFFFFF0E6),
  outline: Color(0xFF9E7E68),
  outlineVariant: Color(0xFFE0C8B8),
  surfaceTint: Color(0xFFC2601A),
  primary: Color(0xFFC2601A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE89050),
  onPrimaryContainer: Color(0xFF4A1A00),
  inversePrimary: Color(0xFFFFB080),
  secondary: Color(0xFF9E3A10),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFF6840),
  onSecondaryContainer: Color(0xFF501400),
  tertiary: Color(0xFF8B5A2B),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFC49060),
  onTertiaryContainer: Color(0xFF3A2000),
  error: Color(0xFFBC342E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF8C120E),
  primaryFixed: Color(0xFFFFCBA8),
  primaryFixedDim: Color(0xFFFFA870),
  onPrimaryFixed: Color(0xFF2A0C00),
  onPrimaryFixedVariant: Color(0xFF7A3008),
  secondaryFixed: Color(0xFFFFD4C4),
  secondaryFixedDim: Color(0xFFFFB098),
  onSecondaryFixed: Color(0xFF3A0A00),
  onSecondaryFixedVariant: Color(0xFF7A2408),
  tertiaryFixed: Color(0xFFFFE0C8),
  tertiaryFixedDim: Color(0xFFD4A878),
  onTertiaryFixed: Color(0xFF2A1400),
  onTertiaryFixedVariant: Color(0xFF6A4018),
  background: Color(0xFFFFF8F3),
  onBackground: Color(0xFF2D1C10),
  surfaceVariant: Color(0xFFFFE0D0),
  gradientHabit: [Color(0xFFC2601A), Color(0xFFE89050)],
  gradientCta: [Color(0xFF9E3A10), Color(0xFFC2601A)],
  glassFill: Color(0x55FFFFFF),
  glassBorder: Color(0x88FFFFFF),
  glassShadow: Color(0x15C2601A),
  ambientGradientTop: [Color(0x40C2601A), Colors.transparent],
  ambientGradientBottom: [Color(0x25FF6840), Colors.transparent],
  dotPatternColor: Color(0x229E7E68),
  cardGradient: [Color(0xFFFFF1E8), Color(0xFFFFE8DB)],
  cardBorder: Color(0xFFE8D0C0),
  cardShadow: Color(0x1AC2601A),
  shareCardGradient: [Color(0xFF3D1A08), Color(0xFF6B3015), Color(0xFF9E4A20)],
  shareCardBokeh: [Color(0xFFFFD080), Color(0xFFFF9060), Color(0xFFFFF0C0)],
  shareCardAccent: Color(0xFFFFD080),
  navIndicatorGradient: [Color(0xFFC2601A), Color(0xFFE89050)],
  navBackground: Color(0xFFFFF8F3),
  navBorder: Color(0xFFE8D0C0),
  heroGradient: [Color(0xFFC2601A), Color(0xFF9E4A10)],
  progressTrack: Color(0xFFFFE0D0),
  progressFill: [Color(0xFFC2601A), Color(0xFFE89050)],
  bottomSheetHandle: Color(0xFFE0C8B8),
  dividerColor: Color(0xFFE8D0C0),
  fabGradient: [Color(0xFF9E3A10), Color(0xFFC2601A)],
  elevatedCardSurface: Color(0xFFFFF4ED),
  shimmerBase: Color(0x30E0C8B8),
  shimmerHighlight: Color(0x50FFFFFF),
);

// ──────────────────────────────────────────────
// Midnight Oasis – deep navy, cyan jewel tones
// ──────────────────────────────────────────────
const midnightOasisPalette = ThemePalette(
  surface: Color(0xFF0A1628),
  surfaceDim: Color(0xFF060E1C),
  surfaceBright: Color(0xFF0F1E35),
  surfaceContainerLowest: Color(0xFF040A14),
  surfaceContainerLow: Color(0xFF0E1A2E),
  surfaceContainer: Color(0xFF142240),
  surfaceContainerHigh: Color(0xFF1A2C4E),
  surfaceContainerHighest: Color(0xFF203660),
  onSurface: Color(0xFFE2EAF4),
  onSurfaceVariant: Color(0xFF9EAAC0),
  inverseSurface: Color(0xFFE2EAF4),
  inverseOnSurface: Color(0xFF0E1A2E),
  outline: Color(0xFF5A6E8A),
  outlineVariant: Color(0xFF2A3C58),
  surfaceTint: Color(0xFF00B4D8),
  primary: Color(0xFF00B4D8),
  onPrimary: Color(0xFF003644),
  primaryContainer: Color(0xFF007EA8),
  onPrimaryContainer: Color(0xFFD0F0FF),
  inversePrimary: Color(0xFF0090B0),
  secondary: Color(0xFFFF7043),
  onSecondary: Color(0xFF3D0E00),
  secondaryContainer: Color(0xFFFF8A65),
  onSecondaryContainer: Color(0xFF5C1A00),
  tertiary: Color(0xFF7C4DFF),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF5C35CC),
  onTertiaryContainer: Color(0xFFE8DDFF),
  error: Color(0xFFFF5449),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  primaryFixed: Color(0xFF80E0FF),
  primaryFixedDim: Color(0xFF00B4D8),
  onPrimaryFixed: Color(0xFF001F2A),
  onPrimaryFixedVariant: Color(0xFF004C62),
  secondaryFixed: Color(0xFFFFDBC8),
  secondaryFixedDim: Color(0xFFFFB598),
  onSecondaryFixed: Color(0xFF2C0800),
  onSecondaryFixedVariant: Color(0xFF6A2000),
  tertiaryFixed: Color(0xFFE0D0FF),
  tertiaryFixedDim: Color(0xFFB8A0FF),
  onTertiaryFixed: Color(0xFF1A0050),
  onTertiaryFixedVariant: Color(0xFF4A20AA),
  background: Color(0xFF0A1628),
  onBackground: Color(0xFFE2EAF4),
  surfaceVariant: Color(0xFF2A3C58),
  gradientHabit: [Color(0xFF00B4D8), Color(0xFF00E5FF)],
  gradientCta: [Color(0xFF7C4DFF), Color(0xFF00B4D8)],
  glassFill: Color(0x20FFFFFF),
  glassBorder: Color(0x35FFFFFF),
  glassShadow: Color(0x3000B4D8),
  ambientGradientTop: [Color(0x3000B4D8), Colors.transparent],
  ambientGradientBottom: [Color(0x207C4DFF), Colors.transparent],
  dotPatternColor: Color(0x18FFFFFF),
  cardGradient: [Color(0xFF142240), Color(0xFF1A2C4E)],
  cardBorder: Color(0xFF2A4060),
  cardShadow: Color(0x40000000),
  shareCardGradient: [Color(0xFF040A14), Color(0xFF0E1A2E), Color(0xFF1A3050)],
  shareCardBokeh: [Color(0xFF00B4D8), Color(0xFF7C4DFF), Color(0xFF00E5FF)],
  shareCardAccent: Color(0xFF00B4D8),
  navIndicatorGradient: [Color(0xFF00B4D8), Color(0xFF0090B0)],
  navBackground: Color(0xFF0A1628),
  navBorder: Color(0xFF2A3C58),
  heroGradient: [Color(0xFF00B4D8), Color(0xFF007EA8)],
  progressTrack: Color(0xFF1A2C4E),
  progressFill: [Color(0xFF00B4D8), Color(0xFF00E5FF)],
  bottomSheetHandle: Color(0xFF3A5070),
  dividerColor: Color(0xFF2A3C58),
  fabGradient: [Color(0xFFFF7043), Color(0xFFFF8A65)],
  elevatedCardSurface: Color(0xFF182844),
  shimmerBase: Color(0x25FFFFFF),
  shimmerHighlight: Color(0x35FFFFFF),
);

// ──────────────────────────────────────────────
// Lavender Dream – soft violet, rosy pink pastels
// ──────────────────────────────────────────────
const lavenderDreamPalette = ThemePalette(
  surface: Color(0xFFF6F0FF),
  surfaceDim: Color(0xFFDDD4E8),
  surfaceBright: Color(0xFFF6F0FF),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF0E8FA),
  surfaceContainer: Color(0xFFEBE2F5),
  surfaceContainerHigh: Color(0xFFE5DCF0),
  surfaceContainerHighest: Color(0xFFDFD6EA),
  onSurface: Color(0xFF201830),
  onSurfaceVariant: Color(0xFF5C4A70),
  inverseSurface: Color(0xFF2E2440),
  inverseOnSurface: Color(0xFFF2EAF8),
  outline: Color(0xFF8A7898),
  outlineVariant: Color(0xFFD0C4DE),
  surfaceTint: Color(0xFF9D4EDD),
  primary: Color(0xFF9D4EDD),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFC88EFF),
  onPrimaryContainer: Color(0xFF36006A),
  inversePrimary: Color(0xFFB070EE),
  secondary: Color(0xFFE0508A),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFF78AA),
  onSecondaryContainer: Color(0xFF5C0028),
  tertiary: Color(0xFF5080D0),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF80AAEE),
  onTertiaryContainer: Color(0xFF003060),
  error: Color(0xFFCC3430),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF8C1210),
  primaryFixed: Color(0xFFDDB8FF),
  primaryFixedDim: Color(0xFFB880EE),
  onPrimaryFixed: Color(0xFF200040),
  onPrimaryFixedVariant: Color(0xFF6A20AA),
  secondaryFixed: Color(0xFFFFD4E2),
  secondaryFixedDim: Color(0xFFFFA8C4),
  onSecondaryFixed: Color(0xFF3C0018),
  onSecondaryFixedVariant: Color(0xFF8A2050),
  tertiaryFixed: Color(0xFFD0E4FF),
  tertiaryFixedDim: Color(0xFF98C0FF),
  onTertiaryFixed: Color(0xFF001C3C),
  onTertiaryFixedVariant: Color(0xFF3060A0),
  background: Color(0xFFF6F0FF),
  onBackground: Color(0xFF201830),
  surfaceVariant: Color(0xFFDFD6EA),
  gradientHabit: [Color(0xFF9D4EDD), Color(0xFFE070FF)],
  gradientCta: [Color(0xFFE0508A), Color(0xFF9D4EDD)],
  glassFill: Color(0x50FFFFFF),
  glassBorder: Color(0x80FFFFFF),
  glassShadow: Color(0x159D4EDD),
  ambientGradientTop: [Color(0x409D4EDD), Colors.transparent],
  ambientGradientBottom: [Color(0x25FF78AA), Colors.transparent],
  dotPatternColor: Color(0x208A7898),
  cardGradient: [Color(0xFFF0E8FA), Color(0xFFEBE1F5)],
  cardBorder: Color(0xFFD8CCE8),
  cardShadow: Color(0x189D4EDD),
  shareCardGradient: [Color(0xFF180A2E), Color(0xFF301550), Color(0xFF4A2080)],
  shareCardBokeh: [Color(0xFFDDB8FF), Color(0xFFFFA8C4), Color(0xFF80AAEE)],
  shareCardAccent: Color(0xFFC88EFF),
  navIndicatorGradient: [Color(0xFF9D4EDD), Color(0xFFC88EFF)],
  navBackground: Color(0xFFF6F0FF),
  navBorder: Color(0xFFD8CCE8),
  heroGradient: [Color(0xFF9D4EDD), Color(0xFF7030B0)],
  progressTrack: Color(0xFFE5DCF0),
  progressFill: [Color(0xFF9D4EDD), Color(0xFFE070FF)],
  bottomSheetHandle: Color(0xFFC8B8DA),
  dividerColor: Color(0xFFD8CCE8),
  fabGradient: [Color(0xFFE0508A), Color(0xFFE870A0)],
  elevatedCardSurface: Color(0xFFF2EAFF),
  shimmerBase: Color(0x30D0C4DE),
  shimmerHighlight: Color(0x50FFFFFF),
);

// ──────────────────────────────────────────────
// Nordic Frost – icy blue, snow white, clean
// ──────────────────────────────────────────────
const nordicFrostPalette = ThemePalette(
  surface: Color(0xFFF0F8FA),
  surfaceDim: Color(0xFFCCDAE0),
  surfaceBright: Color(0xFFF0F8FA),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFE8F2F6),
  surfaceContainer: Color(0xFFE0ECF2),
  surfaceContainerHigh: Color(0xFFD8E6EE),
  surfaceContainerHighest: Color(0xFFD0E0E8),
  onSurface: Color(0xFF141E28),
  onSurfaceVariant: Color(0xFF445A6A),
  inverseSurface: Color(0xFF243040),
  inverseOnSurface: Color(0xFFF0F6FA),
  outline: Color(0xFF6A8090),
  outlineVariant: Color(0xFFC0D0DA),
  surfaceTint: Color(0xFF4AA0C8),
  primary: Color(0xFF4AA0C8),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF80C4E8),
  onPrimaryContainer: Color(0xFF003450),
  inversePrimary: Color(0xFF60B8E0),
  secondary: Color(0xFF607890),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF8898B0),
  onSecondaryContainer: Color(0xFF1A2838),
  tertiary: Color(0xFF40B0A0),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF70D4C4),
  onTertiaryContainer: Color(0xFF003830),
  error: Color(0xFFBC342E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF8C120E),
  primaryFixed: Color(0xFFB0E0F8),
  primaryFixedDim: Color(0xFF70C0E8),
  onPrimaryFixed: Color(0xFF001E30),
  onPrimaryFixedVariant: Color(0xFF205878),
  secondaryFixed: Color(0xFFD0DCEA),
  secondaryFixedDim: Color(0xFFA8BCD0),
  onSecondaryFixed: Color(0xFF0E1820),
  onSecondaryFixedVariant: Color(0xFF3A5060),
  tertiaryFixed: Color(0xFFB0EDE4),
  tertiaryFixedDim: Color(0xFF70D8C8),
  onTertiaryFixed: Color(0xFF00201C),
  onTertiaryFixedVariant: Color(0xFF206858),
  background: Color(0xFFF0F8FA),
  onBackground: Color(0xFF141E28),
  surfaceVariant: Color(0xFFD0E0E8),
  gradientHabit: [Color(0xFF4AA0C8), Color(0xFF80D4E8)],
  gradientCta: [Color(0xFF607890), Color(0xFF4AA0C8)],
  glassFill: Color(0x55FFFFFF),
  glassBorder: Color(0x88FFFFFF),
  glassShadow: Color(0x154AA0C8),
  ambientGradientTop: [Color(0x354AA0C8), Colors.transparent],
  ambientGradientBottom: [Color(0x2070D8C8), Colors.transparent],
  dotPatternColor: Color(0x206A8090),
  cardGradient: [Color(0xFFE8F2F6), Color(0xFFE0ECF2)],
  cardBorder: Color(0xFFC8DAE4),
  cardShadow: Color(0x154AA0C8),
  shareCardGradient: [Color(0xFF0A1A28), Color(0xFF143040), Color(0xFF1E4858)],
  shareCardBokeh: [Color(0xFFB0E0F8), Color(0xFFB0EDE4), Color(0xFFFFFFFF)],
  shareCardAccent: Color(0xFF80C4E8),
  navIndicatorGradient: [Color(0xFF4AA0C8), Color(0xFF80C4E8)],
  navBackground: Color(0xFFF0F8FA),
  navBorder: Color(0xFFC8DAE4),
  heroGradient: [Color(0xFF4AA0C8), Color(0xFF3888B0)],
  progressTrack: Color(0xFFD8E6EE),
  progressFill: [Color(0xFF4AA0C8), Color(0xFF80D4E8)],
  bottomSheetHandle: Color(0xFFB8C8D4),
  dividerColor: Color(0xFFC8DAE4),
  fabGradient: [Color(0xFF607890), Color(0xFF8898B0)],
  elevatedCardSurface: Color(0xFFECF4F8),
  shimmerBase: Color(0x30C0D0DA),
  shimmerHighlight: Color(0x50FFFFFF),
);

// ──────────────────────────────────────────────
// Cyberpunk Neon – deep black, hot pink & lime
// ──────────────────────────────────────────────
const cyberpunkNeonPalette = ThemePalette(
  surface: Color(0xFF08080C),
  surfaceDim: Color(0xFF040408),
  surfaceBright: Color(0xFF0E0E14),
  surfaceContainerLowest: Color(0xFF020204),
  surfaceContainerLow: Color(0xFF0C0C12),
  surfaceContainer: Color(0xFF12121A),
  surfaceContainerHigh: Color(0xFF1A1A24),
  surfaceContainerHighest: Color(0xFF22222E),
  onSurface: Color(0xFFE8FFE0),
  onSurfaceVariant: Color(0xFF98A890),
  inverseSurface: Color(0xFFE8FFE0),
  inverseOnSurface: Color(0xFF0C0C12),
  outline: Color(0xFF506048),
  outlineVariant: Color(0xFF283020),
  surfaceTint: Color(0xFFFF007F),
  primary: Color(0xFFFF007F),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFCC0066),
  onPrimaryContainer: Color(0xFFFFE0EE),
  inversePrimary: Color(0xFFFF409F),
  secondary: Color(0xFF39FF14),
  onSecondary: Color(0xFF003D00),
  secondaryContainer: Color(0xFF20CC10),
  onSecondaryContainer: Color(0xFFE0FFE0),
  tertiary: Color(0xFFFFE500),
  onTertiary: Color(0xFF3D3800),
  tertiaryContainer: Color(0xFFCCB800),
  onTertiaryContainer: Color(0xFFFFFAE0),
  error: Color(0xFFFF3B30),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  primaryFixed: Color(0xFFFF80BF),
  primaryFixedDim: Color(0xFFFF007F),
  onPrimaryFixed: Color(0xFF3D0020),
  onPrimaryFixedVariant: Color(0xFF800040),
  secondaryFixed: Color(0xFF80FF60),
  secondaryFixedDim: Color(0xFF39FF14),
  onSecondaryFixed: Color(0xFF0C3D00),
  onSecondaryFixedVariant: Color(0xFF1A8008),
  tertiaryFixed: Color(0xFFFFF080),
  tertiaryFixedDim: Color(0xFFFFE500),
  onTertiaryFixed: Color(0xFF3D3600),
  onTertiaryFixedVariant: Color(0xFF806E00),
  background: Color(0xFF08080C),
  onBackground: Color(0xFFE8FFE0),
  surfaceVariant: Color(0xFF283020),
  gradientHabit: [Color(0xFFFF007F), Color(0xFFFF409F)],
  gradientCta: [Color(0xFF39FF14), Color(0xFFFF007F)],
  glassFill: Color(0x18FFFFFF),
  glassBorder: Color(0x28FFFFFF),
  glassShadow: Color(0x40FF007F),
  ambientGradientTop: [Color(0x30FF007F), Colors.transparent],
  ambientGradientBottom: [Color(0x2039FF14), Colors.transparent],
  dotPatternColor: Color(0x12FF007F),
  cardGradient: [Color(0xFF0E0E16), Color(0xFF14141E)],
  cardBorder: Color(0xFF2A2A38),
  cardShadow: Color(0x50FF007F),
  shareCardGradient: [Color(0xFF040408), Color(0xFF0C0C14), Color(0xFF18182A)],
  shareCardBokeh: [Color(0xFFFF007F), Color(0xFF39FF14), Color(0xFFFFE500)],
  shareCardAccent: Color(0xFFFF007F),
  navIndicatorGradient: [Color(0xFFFF007F), Color(0xFFCC0066)],
  navBackground: Color(0xFF08080C),
  navBorder: Color(0xFF2A2A38),
  heroGradient: [Color(0xFFFF007F), Color(0xFFCC0066)],
  progressTrack: Color(0xFF1A1A24),
  progressFill: [Color(0xFFFF007F), Color(0xFF39FF14)],
  bottomSheetHandle: Color(0xFF383848),
  dividerColor: Color(0xFF282838),
  fabGradient: [Color(0xFF39FF14), Color(0xFF20CC10)],
  elevatedCardSurface: Color(0xFF101018),
  shimmerBase: Color(0x20FF007F),
  shimmerHighlight: Color(0x30FFFFFF),
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

  // Premium accessors
  static List<Color> get ambientGradientTop => palette.ambientGradientTop;
  static List<Color> get ambientGradientBottom => palette.ambientGradientBottom;
  static Color get dotPatternColor => palette.dotPatternColor;
  static List<Color> get cardGradient => palette.cardGradient;
  static Color get cardBorder => palette.cardBorder;
  static Color get cardShadow => palette.cardShadow;
  static List<Color> get shareCardGradient => palette.shareCardGradient;
  static List<Color> get shareCardBokeh => palette.shareCardBokeh;
  static Color get shareCardAccent => palette.shareCardAccent;
  static List<Color> get navIndicatorGradient => palette.navIndicatorGradient;
  static Color get navBackground => palette.navBackground;
  static Color get navBorder => palette.navBorder;
  static List<Color> get heroGradient => palette.heroGradient;
  static Color get progressTrack => palette.progressTrack;
  static List<Color> get progressFill => palette.progressFill;
  static Color get bottomSheetHandle => palette.bottomSheetHandle;
  static Color get dividerColor => palette.dividerColor;
  static List<Color> get fabGradient => palette.fabGradient;
  static Color get elevatedCardSurface => palette.elevatedCardSurface;
  static Color get shimmerBase => palette.shimmerBase;
  static Color get shimmerHighlight => palette.shimmerHighlight;

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
