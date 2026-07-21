import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'premium_logo.dart';
import 'reveal_animations.dart';

class BloomSplash extends StatefulWidget {
  const BloomSplash({
    super.key,
    this.message,
    this.showSpinner = true,
    this.action,
  });

  final String? message;
  final bool showSpinner;
  final Widget? action;

  @override
  State<BloomSplash> createState() => _BloomSplashState();
}

class _BloomSplashState extends State<BloomSplash>
    with TickerProviderStateMixin {
  late final AnimationController _breath = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2200),
  )..repeat(reverse: true);

  late final AnimationController _particles = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3000),
  )..repeat();

  late final AnimationController _textReveal = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _textReveal.forward();
    });
  }

  @override
  void dispose() {
    _breath.dispose();
    _particles.dispose();
    _textReveal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: AppColors.surface,
      child: Stack(
        children: [
          // Gradient ambient background
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.6),
                  radius: 1.2,
                  colors: AppColors.ambientGradientTop,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.5, 0.8),
                  radius: 0.9,
                  colors: AppColors.ambientGradientBottom,
                ),
              ),
            ),
          ),
          // Floating particles
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _particles,
              builder: (_, __) => CustomPaint(
                painter: _FloatingParticles(
                  progress: _particles.value,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          // Dot grid
          Positioned.fill(
            child: RepaintBoundary(
              child: CustomPaint(painter: _DotGridPainter()),
            ),
          ),
          // Center content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo with breathing + glow
                  ScaleTransition(
                    scale: Tween<double>(begin: 0.92, end: 1.0).animate(
                      CurvedAnimation(parent: _breath, curve: Curves.easeInOut),
                    ),
                    child: ScaleIn(
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.surfaceContainerLow,
                              AppColors.surfaceContainer,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.20),
                              blurRadius: 40,
                              spreadRadius: 4,
                              offset: const Offset(0, 12),
                            ),
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              blurRadius: 60,
                              spreadRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(14),
                        child: const PremiumLogo(
                          size: 100,
                          showGlow: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  // App name with staggered reveal
                  AnimatedBuilder(
                    animation: _textReveal,
                    builder: (_, __) {
                      final t = Curves.easeOutCubic.transform(_textReveal.value);
                      return Opacity(
                        opacity: t,
                        child: Transform.translate(
                          offset: Offset(0, 12 * (1 - t)),
                          child: Text(
                            AppLocalizations.of(context).appTitle,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 6),
                  AnimatedBuilder(
                    animation: _textReveal,
                    builder: (_, __) {
                      final t = Curves.easeOutCubic.transform(
                        (_textReveal.value - 0.2).clamp(0.0, 1.0),
                      );
                      return Opacity(
                        opacity: t,
                        child: Transform.translate(
                          offset: Offset(0, 10 * (1 - t)),
                          child: Text(
                            'Nurture what matters.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (widget.message != null) ...[
                    const SizedBox(height: 22),
                    FadeUp(
                      delay: const Duration(milliseconds: 120),
                      child: Text(
                        widget.message!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                  if (widget.showSpinner) ...[
                    const SizedBox(height: 32),
                    FadeUp(
                      delay: const Duration(milliseconds: 200),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.2,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                  if (widget.action != null) ...[
                    const SizedBox(height: 24),
                    widget.action!,
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingParticles extends CustomPainter {
  _FloatingParticles({required this.progress, required this.color});
  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rng = math.Random(42);
    final paint = Paint()..style = PaintingStyle.fill;
    for (var i = 0; i < 18; i++) {
      final baseX = rng.nextDouble() * size.width;
      final baseY = rng.nextDouble() * size.height;
      final speed = 0.3 + rng.nextDouble() * 0.7;
      final offsetX = math.sin(progress * 2 * math.pi * speed + i) * 20;
      final offsetY = math.cos(progress * 2 * math.pi * speed + i * 0.7) * 15;
      final x = baseX + offsetX;
      final y = baseY + offsetY;
      final alpha = (0.06 + rng.nextDouble() * 0.08) *
          (0.5 + 0.5 * math.sin(progress * 2 * math.pi + i));
      paint.color = color.withValues(alpha: alpha);
      final r = 2.0 + rng.nextDouble() * 4.0;
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _FloatingParticles old) =>
      old.progress != progress;
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.dotPatternColor
      ..style = PaintingStyle.fill;
    const step = 24.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 0.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) => false;
}
