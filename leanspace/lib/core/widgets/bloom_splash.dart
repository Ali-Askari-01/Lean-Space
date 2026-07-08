import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';

/// Branded loading/splash widget — used as the app's first frame, the
/// fallback "config error" screen, and the splash shown while async work
/// is happening. Matches the Bloom Tracker look (cream surface + green
/// accent + brand logo).
class BloomSplash extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Material(
      color: AppColors.surface,
      child: Stack(
        children: [
          // Soft dot-grid background to match the app's blueprint feel.
          Positioned.fill(
            child: CustomPaint(painter: _DotGridPainter()),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Brand mark — rounded square with the mascot logo.
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color:
                              AppColors.primary.withValues(alpha: 0.18),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.asset(
                        'assets/brand/bloom_tracker_logo.png',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.eco_rounded,
                          color: AppColors.primary,
                          size: 56,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  ShaderMask(
                    shaderCallback: (rect) => const LinearGradient(
                      colors: [AppColors.primary, Color(0xFF005C2E)],
                    ).createShader(rect),
                    child: Text(
                      l10n.appTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.splashTagline,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                  if (message != null) ...[
                    const SizedBox(height: 18),
                    Text(
                      message!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ],
                  if (showSpinner) ...[
                    const SizedBox(height: 24),
                    const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                  if (action != null) ...[
                    const SizedBox(height: 24),
                    action!,
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

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.outlineVariant.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;
    const step = 18.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 0.6, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) => false;
}
