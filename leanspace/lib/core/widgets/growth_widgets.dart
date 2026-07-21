import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.radius = 24,
    this.dashed = false,
    this.gradient,
    this.onTap,
  });

  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final bool dashed;
  final Gradient? gradient;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius_ = BorderRadius.circular(radius);
    return Material(
      color: Colors.transparent,
      borderRadius: radius_,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius_,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: radius_,
            gradient: gradient ?? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.cardGradient,
            ),
            border: dashed
                ? Border.all(
                    color: AppColors.cardBorder,
                    width: 1.2,
                    style: BorderStyle.solid,
                  )
                : Border.all(color: AppColors.cardBorder, width: 0.8),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 24,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class BlueprintLabel extends StatelessWidget {
  const BlueprintLabel(this.text, {super.key, this.color, this.icon});

  final String text;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = color ?? AppColors.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 12, color: c),
          const SizedBox(width: 4),
        ],
        Text(
          text.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: c,
            fontFamilyFallback: const ['JetBrains Mono', 'monospace'],
          ),
        ),
      ],
    );
  }
}

class CtaPill extends StatelessWidget {
  const CtaPill({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.gradient = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool gradient;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(32),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: gradient
                ? LinearGradient(
                    colors: AppColors.gradientCta,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                : null,
            color: gradient ? null : AppColors.primary,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.30),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: AppColors.onPrimary, size: 18),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.onPrimary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
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

class LiquidProgressBar extends StatelessWidget {
  const LiquidProgressBar({
    super.key,
    required this.value,
    this.height = 12,
    this.color,
    this.trackColor,
  });

  final double value;
  final double height;
  final Color? color;
  final Color? trackColor;

  @override
  Widget build(BuildContext context) {
    final pct = value.clamp(0.0, 1.0);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: trackColor ?? AppColors.progressTrack,
        borderRadius: BorderRadius.circular(height),
        border: Border.all(
          color: AppColors.cardBorder.withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: AnimatedFractionallySizedBox(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          widthFactor: pct,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height),
              gradient: LinearGradient(
                colors: color != null
                    ? [color!, color!]
                    : AppColors.progressFill,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.30),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ElementIcon extends StatelessWidget {
  const ElementIcon({
    super.key,
    required this.element,
    this.size = 48,
    this.selected = false,
  });

  final HabitElement element;
  final double size;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final color = switch (element) {
      HabitElement.water => AppColors.tertiary,
      HabitElement.light => const Color(0xFFE8A33D),
      HabitElement.soil => const Color(0xFF8B5E2B),
      HabitElement.breeze => AppColors.outline,
    };
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: selected
            ? LinearGradient(
                colors: [color, color.withValues(alpha: 0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: selected ? null : AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selected ? color : AppColors.cardBorder,
          width: selected ? 1.5 : 1,
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: color.withValues(alpha: 0.30),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Icon(_iconFor(element), color: selected ? Colors.white : color, size: size * 0.45),
    );
  }

  IconData _iconFor(HabitElement e) {
    return switch (e) {
      HabitElement.water => Icons.water_drop_rounded,
      HabitElement.light => Icons.wb_sunny_rounded,
      HabitElement.soil => Icons.grass_rounded,
      HabitElement.breeze => Icons.air_rounded,
    };
  }
}

enum HabitElement { water, light, soil, breeze }

extension HabitElementMeta on HabitElement {
  String get label => switch (this) {
        HabitElement.water => 'Water',
        HabitElement.light => 'Light',
        HabitElement.soil => 'Soil',
        HabitElement.breeze => 'Breeze',
      };

  IconData get icon => switch (this) {
        HabitElement.water => Icons.water_drop_rounded,
        HabitElement.light => Icons.wb_sunny_rounded,
        HabitElement.soil => Icons.grass_rounded,
        HabitElement.breeze => Icons.air_rounded,
      };

  String get tagline => switch (this) {
        HabitElement.water =>
          'Restore. Hydration, rest, emotional care — anything that refills the well.',
        HabitElement.light =>
          'Awaken. Morning light, focus blocks, study, meditation — energy and clarity.',
        HabitElement.soil =>
          'Ground. Reading, journaling, deep work — slow roots that build long-term strength.',
        HabitElement.breeze =>
          'Move. Walks, runs, breathwork — light, mobile energy that clears the head.',
      };

  String get whenToUse => switch (this) {
        HabitElement.water => 'When you feel drained or depleted.',
        HabitElement.light => 'When you need a clear start to your day.',
        HabitElement.soil =>
          'When the work is slow but worth it (study, craft, care).',
        HabitElement.breeze =>
          'When your body (or mind) needs to move and breathe.',
      };
}

class BlueprintPattern extends StatelessWidget {
  const BlueprintPattern({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(painter: _BlueprintPainter()),
        ),
        child,
      ],
    );
  }
}

class _BlueprintPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.dotPatternColor
      ..strokeWidth = 0.6
      ..style = PaintingStyle.fill;
    const step = 18.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 0.6, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BlueprintPainter oldDelegate) => false;
}
