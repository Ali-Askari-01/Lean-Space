import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'reveal_animations.dart';

/// Lightweight splash screen — no continuously-running animation controllers,
/// no CustomPaint particle systems. Just a static gradient background, the
/// app logo from assets, and a simple fade-in for the text.
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
    with SingleTickerProviderStateMixin {
  late final AnimationController _textReveal = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
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
          // Center content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo from assets (no CustomPaint, no breathing animation)
                  ScaleIn(
                    duration: const Duration(milliseconds: 400),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/app_logo.png',
                          fit: BoxFit.contain,
                          gaplessPlayback: true,
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
