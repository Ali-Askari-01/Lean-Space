import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/medals.dart';

/// The trophy / badge widget. Renders one medal as a unique illustration.
///
/// Every badge has:
///  - a **frame** that varies by tier (Sprout → Legendary). The frame is the
///    outer shape, gradient, ring count, and glow strength.
///  - a **scene** that is unique to the medal — its icon, plus a small
///    category glyph (banner / leaf / chain / crown), painted inside.
///  - a **ribbon** at the bottom that names the tier.
///  - when locked, a soft progress arc fills clockwise and the scene is
///    desaturated.
class MedalBadge extends StatelessWidget {
  const MedalBadge({
    super.key,
    required this.medal,
    required this.progress,
    this.size = 132,
    this.onTap,
  });

  final Medal medal;
  final MedalProgress progress;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final earned = progress.earned;
    final tier = medal.tier;
    final tone = medal.tone.color;
    final accent = tier.accent;
    final ribbon = tier.ribbon;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: size,
        height: size + 22,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            if (earned) _Glow(accent: tone, size: size, tier: tier),
            Positioned(
              top: 0,
              child: CustomPaint(
                size: Size(size, size),
                painter: _BadgePainter(
                  progress: progress.ratio,
                  earned: earned,
                  medal: medal,
                  primary: tone,
                  accent: accent,
                  ribbon: ribbon,
                  tier: tier,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: _RibbonBanner(
                tier: tier,
                earned: earned,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.accent, required this.size, required this.tier});
  final Color accent;
  final double size;
  final MedalTier tier;

  @override
  Widget build(BuildContext context) {
    final strength = switch (tier) {
      MedalTier.sprout => 0.20,
      MedalTier.common => 0.30,
      MedalTier.rare => 0.45,
      MedalTier.epic => 0.60,
      MedalTier.legendary => 0.80,
    };
    return Positioned(
      top: 6,
      child: Container(
        width: size * 0.7,
        height: size * 0.7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: strength),
              blurRadius: 28,
              spreadRadius: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class _RibbonBanner extends StatelessWidget {
  const _RibbonBanner({required this.tier, required this.earned});
  final MedalTier tier;
  final bool earned;

  @override
  Widget build(BuildContext context) {
    final fg = earned ? Colors.white : AppColors.outline;
    final bg = earned
        ? tier.ribbon
        : AppColors.surfaceContainerHigh;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: earned
              ? Colors.white.withValues(alpha: 0.25)
              : AppColors.outlineVariant,
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(earned ? tier.sigil : Icons.lock_rounded, size: 9, color: fg),
          const SizedBox(width: 4),
          Text(
            tier.label.toUpperCase(),
            style: TextStyle(
              color: fg,
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgePainter extends CustomPainter {
  _BadgePainter({
    required this.progress,
    required this.earned,
    required this.medal,
    required this.primary,
    required this.accent,
    required this.ribbon,
    required this.tier,
  });

  final double progress;
  final bool earned;
  final Medal medal;
  final Color primary;
  final Color accent;
  final Color ribbon;
  final MedalTier tier;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final outerR = size.width * 0.46;

    switch (tier) {
      case MedalTier.sprout:
        _paintSprout(canvas, size, c, outerR);
        break;
      case MedalTier.common:
        _paintCommon(canvas, size, c, outerR);
        break;
      case MedalTier.rare:
        _paintRare(canvas, size, c, outerR);
        break;
      case MedalTier.epic:
        _paintEpic(canvas, size, c, outerR);
        break;
      case MedalTier.legendary:
        _paintLegendary(canvas, size, c, outerR);
        break;
    }
  }

  // ─── Tier 1: Sprout — a soft circle with a single leaf-tone. ─────────
  void _paintSprout(Canvas canvas, Size size, Offset c, double outerR) {
    final frame = Paint()
      ..shader = RadialGradient(
        colors: earned
            ? [const Color(0xFFB7D9B0), const Color(0xFF8AA68A)]
            : [AppColors.surfaceContainerHigh, AppColors.outlineVariant],
        center: const Alignment(-0.3, -0.5),
      ).createShader(Rect.fromCircle(center: c, radius: outerR));
    canvas.drawCircle(c, outerR, frame);

    final inner = Paint()
      ..color = earned
          ? Colors.white.withValues(alpha: 0.85)
          : AppColors.surfaceContainerHigh;
    canvas.drawCircle(c, outerR * 0.70, inner);

    _paintScene(canvas, size, c, outerR * 0.62, ringColors: [
      const Color(0xFF8AA68A),
      const Color(0xFF4F6F52),
    ]);
  }

  // ─── Tier 2: Common — rounded square with a single accent ring. ─────
  void _paintCommon(Canvas canvas, Size size, Offset c, double outerR) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromCircle(center: c, radius: outerR),
      const Radius.circular(14),
    );
    final frame = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: earned
            ? [Color.lerp(primary, Colors.white, 0.4)!, primary]
            : [AppColors.surfaceContainer, AppColors.outlineVariant],
      ).createShader(Rect.fromCircle(center: c, radius: outerR));
    canvas.drawRRect(rect, frame);

    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04
      ..color = earned
          ? Color.lerp(primary, Colors.white, 0.5)!
          : AppColors.outlineVariant;
    canvas.drawCircle(c, outerR * 0.82, ring);

    final inner = Paint()
      ..shader = RadialGradient(
        colors: earned
            ? [Color.lerp(primary, Colors.white, 0.7)!, primary]
            : [AppColors.surfaceContainer, AppColors.outlineVariant],
      ).createShader(Rect.fromCircle(center: c, radius: outerR * 0.70));
    canvas.drawCircle(c, outerR * 0.70, inner);

    _paintScene(canvas, size, c, outerR * 0.62, ringColors: [
      primary,
      Color.lerp(primary, Colors.black, 0.2)!,
    ]);
  }

  // ─── Tier 3: Rare — hexagonal frame with two concentric rings. ─────
  void _paintRare(Canvas canvas, Size size, Offset c, double outerR) {
    final hex = _hexagonPath(c, outerR);
    final frame = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: earned
            ? [Color.lerp(primary, Colors.white, 0.5)!, primary]
            : [AppColors.surfaceContainer, AppColors.outlineVariant],
      ).createShader(Rect.fromCircle(center: c, radius: outerR));
    canvas.drawPath(hex, frame);

    final innerRing = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = (earned
              ? Color.lerp(primary, Colors.white, 0.7)!
              : AppColors.outlineVariant)
          .withValues(alpha: 0.6);
    _hexagonPath(c, outerR * 0.84)
        .computeMetrics()
        .forEach((m) => canvas.drawPath(m.extractPath(0, m.length), innerRing));

    final inner = Paint()
      ..shader = RadialGradient(
        colors: earned
            ? [Color.lerp(primary, Colors.white, 0.8)!, primary]
            : [AppColors.surfaceContainer, AppColors.outlineVariant],
      ).createShader(Rect.fromCircle(center: c, radius: outerR * 0.70));
    canvas.drawCircle(c, outerR * 0.70, inner);

    // 4 accent dots at corners
    final dotPaint = Paint()..color = earned ? primary : AppColors.outline;
    for (var i = 0; i < 4; i++) {
      final a = math.pi / 4 + i * (math.pi / 2);
      final p = c + Offset(math.cos(a) * outerR * 0.95, math.sin(a) * outerR * 0.95);
      canvas.drawCircle(p, 2.0, dotPaint);
    }

    _paintScene(canvas, size, c, outerR * 0.62, ringColors: [
      primary,
      Color.lerp(primary, Colors.black, 0.2)!,
    ]);
  }

  // ─── Tier 4: Epic — 8-point star frame with crown glyph. ───────────
  void _paintEpic(Canvas canvas, Size size, Offset c, double outerR) {
    final star = _starPath(c, outerR, 8, 0.78);
    final frame = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: earned
            ? [
                Color.lerp(primary, Colors.white, 0.6)!,
                primary,
                Color.lerp(primary, Colors.black, 0.15)!,
              ]
            : [AppColors.surfaceContainer, AppColors.outlineVariant],
      ).createShader(Rect.fromCircle(center: c, radius: outerR));
    canvas.drawPath(star, frame);

    final innerRing = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = (earned
              ? Color.lerp(primary, Colors.white, 0.7)!
              : AppColors.outlineVariant)
          .withValues(alpha: 0.7);
    canvas.drawCircle(c, outerR * 0.78, innerRing);

    final inner = Paint()
      ..shader = RadialGradient(
        colors: earned
            ? [Color.lerp(primary, Colors.white, 0.85)!, primary]
            : [AppColors.surfaceContainer, AppColors.outlineVariant],
      ).createShader(Rect.fromCircle(center: c, radius: outerR * 0.68));
    canvas.drawCircle(c, outerR * 0.68, inner);

    // Crown spokes
    final spoke = Paint()
      ..color = earned
          ? Color.lerp(primary, Colors.white, 0.7)!
          : AppColors.outlineVariant;
    spoke.strokeWidth = 1.4;
    spoke.style = PaintingStyle.stroke;
    for (var i = 0; i < 6; i++) {
      final a = i * (math.pi / 3);
      final from = c + Offset(math.cos(a) * outerR * 0.55, math.sin(a) * outerR * 0.55);
      final to = c + Offset(math.cos(a) * outerR * 0.72, math.sin(a) * outerR * 0.72);
      canvas.drawLine(from, to, spoke);
    }

    _paintScene(canvas, size, c, outerR * 0.60, ringColors: [
      primary,
      Color.lerp(primary, Colors.black, 0.2)!,
    ]);
  }

  // ─── Tier 5: Legendary — ornate shield with sun rays. ─────────────
  void _paintLegendary(Canvas canvas, Size size, Offset c, double outerR) {
    // Sun rays (outer)
    final ray = Paint()
      ..color = earned
          ? Color.lerp(primary, Colors.white, 0.6)!
          : AppColors.outlineVariant
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 12; i++) {
      final a = i * (math.pi / 6);
      final from = c + Offset(math.cos(a) * outerR * 0.95, math.sin(a) * outerR * 0.95);
      final to = c + Offset(math.cos(a) * outerR * 1.02, math.sin(a) * outerR * 1.02);
      canvas.drawLine(from, to, ray);
    }

    // Shield frame
    final shield = _shieldPath(c, outerR * 0.95);
    final frame = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: earned
            ? [
                Color.lerp(primary, Colors.white, 0.7)!,
                primary,
                Color.lerp(primary, Colors.black, 0.2)!,
              ]
            : [AppColors.surfaceContainer, AppColors.outlineVariant],
      ).createShader(Rect.fromCircle(center: c, radius: outerR));
    canvas.drawPath(shield, frame);

    final innerRing = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = (earned
              ? Color.lerp(primary, Colors.white, 0.7)!
              : AppColors.outlineVariant)
          .withValues(alpha: 0.8);
    canvas.drawCircle(c, outerR * 0.76, innerRing);

    final inner = Paint()
      ..shader = RadialGradient(
        colors: earned
            ? [Colors.white, primary, Color.lerp(primary, Colors.black, 0.2)!]
            : [AppColors.surfaceContainer, AppColors.outlineVariant],
      ).createShader(Rect.fromCircle(center: c, radius: outerR * 0.66));
    canvas.drawCircle(c, outerR * 0.66, inner);

    // Two gold dots (north + south)
    final dotPaint = Paint()..color = earned ? primary : AppColors.outline;
    canvas.drawCircle(c + Offset(0, -outerR * 0.86), 3, dotPaint);
    canvas.drawCircle(c + Offset(0, outerR * 0.86), 3, dotPaint);

    _paintScene(canvas, size, c, outerR * 0.58, ringColors: [
      primary,
      Color.lerp(primary, Colors.black, 0.2)!,
    ]);

    // Sparkle for legendaries
    if (earned) {
      _paintSparkle(canvas, c + Offset(outerR * 0.55, -outerR * 0.45), 5);
      _paintSparkle(canvas, c + Offset(-outerR * 0.45, outerR * 0.5), 4);
    }
  }

  // ─── Scene: unique per medal. Drawn into the inner disc. ───────────
  void _paintScene(
    Canvas canvas,
    Size size,
    Offset c,
    double sceneR, {
    required List<Color> ringColors,
  }) {
    // Base radial sheen
    final sheen = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0, -0.5),
        colors: [
          (earned ? Colors.white : AppColors.surfaceContainer)
              .withValues(alpha: 0.5),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: c, radius: sceneR));
    canvas.drawCircle(c, sceneR, sheen);

    // Category glyph (unique per category)
    _paintCategoryGlyph(canvas, c, sceneR);

    // Progress arc when locked
    if (!earned && progress > 0) {
      final p = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.045
        ..strokeCap = StrokeCap.round
        ..color = ringColors.first.withValues(alpha: 0.85);
      final rect = Rect.fromCircle(center: c, radius: sceneR * 0.78);
      canvas.drawArc(
        rect,
        -math.pi / 2,
        2 * math.pi * progress,
        false,
        p,
      );
    }

    // Drawn icon at the center (slightly above) — this is what makes
    // each medal visually unique.
    _drawIconCenter(canvas, size, c, sceneR);
  }

  void _paintCategoryGlyph(Canvas canvas, Offset c, double r) {
    final paint = Paint()
      ..color = (earned ? Colors.white : AppColors.outlineVariant)
          .withValues(alpha: 0.18)
      ..style = PaintingStyle.fill;
    final stroke = Paint()
      ..color = (earned ? Colors.white : AppColors.outlineVariant)
          .withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    switch (medal.category) {
      case MedalCategory.task:
        // tiny flag at top-right
        final tip = c + Offset(r * 0.55, -r * 0.55);
        final path = Path()
          ..moveTo(tip.dx, tip.dy)
          ..lineTo(tip.dx + 8, tip.dy + 2)
          ..lineTo(tip.dx, tip.dy + 4)
          ..close();
        canvas.drawPath(path, stroke);
        break;
      case MedalCategory.habit:
        // tiny leaf at bottom-left
        final center = c + Offset(-r * 0.55, r * 0.45);
        final leaf = Path()
          ..moveTo(center.dx, center.dy)
          ..quadraticBezierTo(
              center.dx - 6, center.dy - 6, center.dx - 2, center.dy - 12)
          ..quadraticBezierTo(
              center.dx + 2, center.dy - 6, center.dx, center.dy);
        canvas.drawPath(leaf, stroke);
        break;
      case MedalCategory.streak:
        // tiny chain link at top-left
        final center = c + Offset(-r * 0.55, -r * 0.55);
        canvas.drawCircle(center, 4, stroke);
        canvas.drawCircle(center.translate(6, 6), 4, stroke);
        canvas.drawLine(
            center.translate(2, 2), center.translate(4, 4), stroke);
        break;
      case MedalCategory.mastery:
        // tiny crown at bottom-right
        final tip = c + Offset(r * 0.5, r * 0.5);
        final crown = Path()
          ..moveTo(tip.dx - 8, tip.dy)
          ..lineTo(tip.dx - 6, tip.dy - 5)
          ..lineTo(tip.dx - 3, tip.dy)
          ..lineTo(tip.dx, tip.dy - 5)
          ..lineTo(tip.dx + 3, tip.dy)
          ..lineTo(tip.dx + 6, tip.dy - 5)
          ..lineTo(tip.dx + 8, tip.dy)
          ..close();
        canvas.drawPath(crown, paint);
        canvas.drawPath(crown, stroke);
        break;
    }
  }

  void _drawIconCenter(Canvas canvas, Size size, Offset c, double r) {
    // Use a TextPainter to render the icon's glyph as a vector path.
    // This is a "free" custom paint using the icon font itself.
    final iconColor = earned ? Colors.white : AppColors.outline;
    // 1.4× the scene radius puts the icon at ~57% of the badge size,
    // which is the right balance between "dominant" and "fits the frame".
    final iconSize = r * 1.4;
    final iconCenter = c + Offset(0, r * 0.05);
    final tp = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(medal.icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: medal.icon.fontFamily,
          package: medal.icon.fontPackage,
          color: iconColor,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      iconCenter - Offset(tp.width / 2, tp.height / 2),
    );

    // Subtle dark drop-shadow behind the icon for depth
    if (earned) {
      final shadow = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(medal.icon.codePoint),
          style: TextStyle(
            fontSize: iconSize,
            fontFamily: medal.icon.fontFamily,
            package: medal.icon.fontPackage,
            color: Colors.black.withValues(alpha: 0.18),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      shadow.layout();
      shadow.paint(
        canvas,
        iconCenter - Offset(shadow.width / 2, shadow.height / 2) +
            const Offset(0, 1.4),
      );
    }
  }

  void _paintSparkle(Canvas canvas, Offset c, double s) {
    final p = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(c + Offset(-s, 0), c + Offset(s, 0), p);
    canvas.drawLine(c + Offset(0, -s), c + Offset(0, s), p);
  }

  Path _hexagonPath(Offset c, double r) {
    final path = Path();
    for (var i = 0; i < 6; i++) {
      final a = -math.pi / 2 + i * (math.pi / 3);
      final p = c + Offset(math.cos(a) * r, math.sin(a) * r);
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    path.close();
    return path;
  }

  Path _starPath(Offset c, double r, int points, double innerRatio) {
    final path = Path();
    for (var i = 0; i < points * 2; i++) {
      final a = -math.pi / 2 + i * (math.pi / points);
      final radius = i.isEven ? r : r * innerRatio;
      final p = c + Offset(math.cos(a) * radius, math.sin(a) * radius);
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    path.close();
    return path;
  }

  Path _shieldPath(Offset c, double r) {
    return Path()
      ..moveTo(c.dx, c.dy - r)
      ..quadraticBezierTo(c.dx + r * 1.05, c.dy - r * 0.6, c.dx + r * 0.9, c.dy)
      ..quadraticBezierTo(
          c.dx + r * 0.7, c.dy + r * 0.85, c.dx, c.dy + r * 1.05)
      ..quadraticBezierTo(
          c.dx - r * 0.7, c.dy + r * 0.85, c.dx - r * 0.9, c.dy)
      ..quadraticBezierTo(
          c.dx - r * 1.05, c.dy - r * 0.6, c.dx, c.dy - r)
      ..close();
  }

  @override
  bool shouldRepaint(covariant _BadgePainter old) =>
      old.progress != progress ||
      old.earned != earned ||
      old.primary != primary ||
      old.medal.id != medal.id ||
      old.tier != tier;
}
