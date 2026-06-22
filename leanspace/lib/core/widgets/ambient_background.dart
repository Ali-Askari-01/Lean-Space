import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Ambient gradient used on auth and main screens.
class AmbientBackground extends StatelessWidget {
  const AmbientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.7),
                radius: 1.2,
                colors: [
                  AppColors.accent.withValues(alpha: 0.14),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.9, 1.1),
                radius: 0.9,
                colors: [
                  AppColors.accentDeep.withValues(alpha: 0.08),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textFaint,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

/// Small drag handle shown at the top of bottom sheets.
class SheetHandle extends StatelessWidget {
  const SheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.borderStrong,
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}

class CapacityPips extends StatelessWidget {
  const CapacityPips({
    super.key,
    required this.filled,
    required this.total,
    this.label,
  });

  final int filled;
  final int total;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(total, (i) {
          final isFilled = i < filled;
          return Container(
            width: 18,
            height: 3,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: isFilled ? AppColors.accent : AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }),
        if (label != null) ...[
          const SizedBox(width: 8),
          Text(
            label!,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textFaint,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ],
    );
  }
}
