import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/haptics.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme_provider.dart';
import '../../subscription/providers/entitlement_provider.dart';

class ThemeSelectionSheet extends ConsumerWidget {
  const ThemeSelectionSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final currentPreset = ref.watch(themePresetProvider);
    final isPro = ref.watch(entitlementProvider).isPro;

    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            controller: scrollController,
            children: [
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.bottomSheetHandle,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                l10n.themePickerTitle,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.themePickerSubtitle,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ...ThemePreset.values.map((preset) {
                final isSelected = currentPreset == preset;
                final isLocked = preset != ThemePreset.classicBloom && !isPro;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _ThemePreviewCard(
                    preset: preset,
                    isSelected: isSelected,
                    isLocked: isLocked,
                    onTap: () {
                      if (isLocked) {
                        AppHaptics.blocked();
                        context.pop();
                        context.push('/paywall?from=theme');
                        return;
                      }
                      AppHaptics.success();
                      ref.read(themePresetProvider.notifier).setPreset(preset);
                    },
                  ),
                );
              }),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}

class _ThemePreviewCard extends StatelessWidget {
  const _ThemePreviewCard({
    required this.preset,
    required this.isSelected,
    required this.isLocked,
    required this.onTap,
  });

  final ThemePreset preset;
  final bool isSelected;
  final bool isLocked;
  final VoidCallback onTap;

  String _getName(AppLocalizations l10n) {
    switch (preset) {
      case ThemePreset.classicBloom:
        return l10n.themeNameClassicBloom;
      case ThemePreset.solarTerracotta:
        return l10n.themeNameSolarTerracotta;
      case ThemePreset.midnightOasis:
        return l10n.themeNameMidnightOasis;
      case ThemePreset.lavenderDream:
        return l10n.themeNameLavenderDream;
      case ThemePreset.nordicFrost:
        return l10n.themeNameNordicFrost;
      case ThemePreset.cyberpunkNeon:
        return l10n.themeNameCyberpunkNeon;
    }
  }

  String _getDescription(AppLocalizations l10n) {
    switch (preset) {
      case ThemePreset.classicBloom:
        return 'Lush garden greens, organic warmth';
      case ThemePreset.solarTerracotta:
        return 'Sunset clay tones, amber warmth';
      case ThemePreset.midnightOasis:
        return 'Deep navy, cyan jewel tones';
      case ThemePreset.lavenderDream:
        return 'Soft violet, rosy pastels';
      case ThemePreset.nordicFrost:
        return 'Icy blue, snow white minimalism';
      case ThemePreset.cyberpunkNeon:
        return 'Hot pink & lime on deep black';
    }
  }

  Color _getPrimary() {
    switch (preset) {
      case ThemePreset.classicBloom:
        return const Color(0xFF2E7D4F);
      case ThemePreset.solarTerracotta:
        return const Color(0xFFC2601A);
      case ThemePreset.midnightOasis:
        return const Color(0xFF00B4D8);
      case ThemePreset.lavenderDream:
        return const Color(0xFF9D4EDD);
      case ThemePreset.nordicFrost:
        return const Color(0xFF4AA0C8);
      case ThemePreset.cyberpunkNeon:
        return const Color(0xFFFF007F);
    }
  }

  Color _getSurface() {
    switch (preset) {
      case ThemePreset.classicBloom:
        return const Color(0xFFF8FAF3);
      case ThemePreset.solarTerracotta:
        return const Color(0xFFFFF8F3);
      case ThemePreset.midnightOasis:
        return const Color(0xFF0A1628);
      case ThemePreset.lavenderDream:
        return const Color(0xFFF6F0FF);
      case ThemePreset.nordicFrost:
        return const Color(0xFFF0F8FA);
      case ThemePreset.cyberpunkNeon:
        return const Color(0xFF08080C);
    }
  }

  Color _getAccent() {
    switch (preset) {
      case ThemePreset.classicBloom:
        return const Color(0xFFB94A1F);
      case ThemePreset.solarTerracotta:
        return const Color(0xFFE89050);
      case ThemePreset.midnightOasis:
        return const Color(0xFF7C4DFF);
      case ThemePreset.lavenderDream:
        return const Color(0xFFE0508A);
      case ThemePreset.nordicFrost:
        return const Color(0xFF40B0A0);
      case ThemePreset.cyberpunkNeon:
        return const Color(0xFF39FF14);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final primary = _getPrimary();
    final surface = _getSurface();
    final accent = _getAccent();
    final isDark = surface.computeLuminance() < 0.3;
    final textColor = isDark ? Colors.white : const Color(0xFF1A1C19);
    final mutedTextColor = isDark ? Colors.white60 : Colors.black45;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isSelected ? primary : (isDark ? const Color(0xFF2A2A38) : const Color(0xFFD0D5C8)),
          width: isSelected ? 2.5 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: primary.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                )
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primary, primary.withValues(alpha: 0.7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: isSelected
                          ? const Icon(Icons.check_rounded, color: Colors.white, size: 24)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getName(l10n),
                            style: TextStyle(
                              color: textColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _getDescription(l10n),
                            style: TextStyle(
                              color: mutedTextColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isLocked)
                      Icon(
                        Icons.lock_rounded,
                        color: textColor.withValues(alpha: 0.4),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                // Mini preview showing card + progress bar
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.06)
                        : Colors.black.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      // Mini card
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.eco_rounded,
                          color: primary,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 4,
                              width: 60,
                              decoration: BoxDecoration(
                                color: textColor.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Mini progress bar
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? Colors.white.withValues(alpha: 0.1)
                                          : Colors.black.withValues(alpha: 0.06),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Color dots
                      ...[primary, accent, const Color(0xFFE8A33D)].map(
                        (c) => Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                            color: c,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
