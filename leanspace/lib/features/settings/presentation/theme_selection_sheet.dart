import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/haptics.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme_provider.dart';
import '../../subscription/providers/entitlement_provider.dart';

class ThemeSelectionSheet extends ConsumerWidget {
  const ThemeSelectionSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentPreset = ref.watch(themePresetProvider);
    final isPro = ref.watch(entitlementProvider).isPro;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.9,
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
                    color: AppColors.outlineVariant,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Personal Sanctuary',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Choose a color palette that brings you peace.',
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

  String _getName() {
    switch (preset) {
      case ThemePreset.classicBloom:
        return 'Classic Bloom';
      case ThemePreset.solarTerracotta:
        return 'Solar Terracotta';
      case ThemePreset.midnightOasis:
        return 'Midnight Oasis';
      case ThemePreset.lavenderDream:
        return 'Lavender Dream';
      case ThemePreset.nordicFrost:
        return 'Nordic Frost';
      case ThemePreset.cyberpunkNeon:
        return 'Cyberpunk Neon';
    }
  }

  Color _getPrimary() {
    switch (preset) {
      case ThemePreset.classicBloom:
        return const Color(0xFF006D36);
      case ThemePreset.solarTerracotta:
        return const Color(0xFFC85A17);
      case ThemePreset.midnightOasis:
        return const Color(0xFF00B4D8);
      case ThemePreset.lavenderDream:
        return const Color(0xFF9D4EDD);
      case ThemePreset.nordicFrost:
        return const Color(0xFF8ECAE6);
      case ThemePreset.cyberpunkNeon:
        return const Color(0xFFFF007F);
    }
  }

  Color _getSurface() {
    switch (preset) {
      case ThemePreset.classicBloom:
        return const Color(0xFFF9FAF4);
      case ThemePreset.solarTerracotta:
        return const Color(0xFFFFF6F0);
      case ThemePreset.midnightOasis:
        return const Color(0xFF0D1B2A);
      case ThemePreset.lavenderDream:
        return const Color(0xFFF8F4FF);
      case ThemePreset.nordicFrost:
        return const Color(0xFFF1FAEE);
      case ThemePreset.cyberpunkNeon:
        return const Color(0xFF09090B);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = _getPrimary();
    final surface = _getSurface();
    final isDark = surface.computeLuminance() < 0.3;
    final textColor = isDark ? Colors.white : Colors.black87;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? primary : AppColors.outlineVariant,
          width: isSelected ? 2.5 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: primary.withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                  child: isSelected
                      ? const Icon(Icons.check_rounded, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    _getName(),
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (isLocked)
                  Icon(
                    Icons.lock_rounded,
                    color: textColor.withValues(alpha: 0.5),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
