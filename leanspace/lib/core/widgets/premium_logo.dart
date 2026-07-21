import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// A premium, theme-adaptive brand logo widget.
/// Renders a distinctive circular badge with a stylized sprouting seed design.
class PremiumLogo extends StatelessWidget {
  const PremiumLogo({
    super.key,
    this.size = 120,
    this.showGlow = true,
    this.animate = false,
  });

  final double size;
  final bool showGlow;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    if (animate) {
      return _AnimatedLogo(size: size, showGlow: showGlow);
    }
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _BrandLogoPainter(
          primaryColor: AppColors.primary,
          secondaryColor: AppColors.primaryContainer,
          accentColor: AppColors.shareCardAccent,
          showGlow: showGlow,
          phase: 1.0,
        ),
      ),
    );
  }
}

class _AnimatedLogo extends StatefulWidget {
  const _AnimatedLogo({required this.size, required this.showGlow});
  final double size;
  final bool showGlow;

  @override
  State<_AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<_AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => Transform.scale(
        scale: 0.96 + _ctrl.value * 0.04,
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: _BrandLogoPainter(
              primaryColor: AppColors.primary,
              secondaryColor: AppColors.primaryContainer,
              accentColor: AppColors.shareCardAccent,
              showGlow: widget.showGlow,
              phase: _ctrl.value,
            ),
          ),
        ),
      ),
    );
  }
}

/// Renders a distinctive brand mark:
/// - Outer ring with gradient
/// - Inner circle with depth
/// - Stylized sprouting seed with two curved leaves
/// - Subtle shine and glow
class _BrandLogoPainter extends CustomPainter {
  _BrandLogoPainter({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.showGlow,
    required this.phase,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final bool showGlow;
  final double phase;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.44;

    // ── Ambient glow ──
    if (showGlow) {
      final glowPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            primaryColor.withValues(alpha: 0.12 + phase * 0.06),
            primaryColor.withValues(alpha: 0.0),
          ],
        ).createShader(
            Rect.fromCircle(center: Offset(cx, cy), radius: r * 1.8));
      canvas.drawCircle(Offset(cx, cy), r * 1.8, glowPaint);
    }

    // ── Outer ring ──
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.025
      ..shader = LinearGradient(
        colors: [
          primaryColor,
          secondaryColor,
        ],
      ).createShader(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    canvas.drawCircle(Offset(cx, cy), r, ringPaint);

    // ── Inner filled circle ──
    final innerPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, -0.3),
        radius: 1.2,
        colors: [
          secondaryColor.withValues(alpha: 0.25),
          primaryColor.withValues(alpha: 0.12),
        ],
      ).createShader(
          Rect.fromCircle(center: Offset(cx, cy), radius: r * 0.92));
    canvas.drawCircle(Offset(cx, cy), r * 0.92, innerPaint);

    // ── Stylized sprouting seed ──
    final seedCx = cx;
    final seedCy = cy + r * 0.15;
    final stemTop = cy - r * 0.45;

    // Stem
    final stemPaint = Paint()
      ..color = primaryColor
      ..strokeWidth = size.width * 0.028
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(seedCx, seedCy), Offset(seedCx, stemTop), stemPaint);

    // Left leaf - flowing organic curve
    final leftLeaf = Path();
    leftLeaf.moveTo(seedCx, cy - r * 0.05);
    leftLeaf.cubicTo(
      seedCx - r * 0.15, cy - r * 0.25,
      seedCx - r * 0.55, cy - r * 0.55,
      seedCx - r * 0.35, cy - r * 0.75,
    );
    leftLeaf.cubicTo(
      seedCx - r * 0.15, cy - r * 0.6,
      seedCx - r * 0.05, cy - r * 0.3,
      seedCx, cy - r * 0.05,
    );
    leftLeaf.close();

    final leftLeafPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [primaryColor, secondaryColor],
      ).createShader(leftLeaf.getBounds());
    canvas.drawPath(leftLeaf, leftLeafPaint);

    // Right leaf - slightly smaller, different angle
    final rightLeaf = Path();
    rightLeaf.moveTo(seedCx, cy - r * 0.1);
    rightLeaf.cubicTo(
      seedCx + r * 0.12, cy - r * 0.3,
      seedCx + r * 0.5, cy - r * 0.5,
      seedCx + r * 0.4, cy - r * 0.68,
    );
    rightLeaf.cubicTo(
      seedCx + r * 0.2, cy - r * 0.55,
      seedCx + r * 0.05, cy - r * 0.3,
      seedCx, cy - r * 0.1,
    );
    rightLeaf.close();

    final rightLeafPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          primaryColor.withValues(alpha: 0.8),
          primaryColor,
        ],
      ).createShader(rightLeaf.getBounds());
    canvas.drawPath(rightLeaf, rightLeafPaint);

    // ── Seed at base ──
    final seedPaint = Paint()
      ..shader = RadialGradient(
        colors: [accentColor, primaryColor],
      ).createShader(
          Rect.fromCircle(center: Offset(seedCx, seedCy), radius: r * 0.12));
    canvas.drawCircle(Offset(seedCx, seedCy), r * 0.12, seedPaint);

    // Seed highlight
    canvas.drawCircle(
      Offset(seedCx - r * 0.03, seedCy - r * 0.03),
      r * 0.05,
      Paint()..color = Colors.white.withValues(alpha: 0.35),
    );

    // ── Vein lines on leaves ──
    final veinPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.25)
      ..strokeWidth = size.width * 0.006
      ..strokeCap = StrokeCap.round;

    // Left leaf vein
    canvas.drawLine(
      Offset(seedCx - r * 0.05, cy - r * 0.15),
      Offset(seedCx - r * 0.35, cy - r * 0.55),
      veinPaint,
    );
    // Right leaf vein
    canvas.drawLine(
      Offset(seedCx + r * 0.03, cy - r * 0.2),
      Offset(seedCx + r * 0.32, cy - r * 0.5),
      veinPaint,
    );

    // ── Small decorative dots ──
    final dotPaint = Paint()..style = PaintingStyle.fill;
    dotPaint.color = primaryColor.withValues(alpha: 0.2);
    canvas.drawCircle(Offset(cx - r * 0.6, cy + r * 0.5), size.width * 0.012, dotPaint);
    dotPaint.color = secondaryColor.withValues(alpha: 0.25);
    canvas.drawCircle(Offset(cx + r * 0.65, cy - r * 0.4), size.width * 0.01, dotPaint);
    dotPaint.color = accentColor.withValues(alpha: 0.15);
    canvas.drawCircle(Offset(cx + r * 0.5, cy + r * 0.6), size.width * 0.015, dotPaint);

    // ── Shine arc on top-left ──
    final shinePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.18),
          Colors.white.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    canvas.drawCircle(Offset(cx, cy), r * 0.92, shinePaint);
  }

  @override
  bool shouldRepaint(covariant _BrandLogoPainter old) =>
      old.phase != phase ||
      old.primaryColor != primaryColor ||
      old.showGlow != showGlow;
}
