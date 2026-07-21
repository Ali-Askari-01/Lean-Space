import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/haptics.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../insights/domain/medals.dart';
import '../../insights/presentation/widgets/medal_badge.dart';

/// One-at-a-time celebration sheet for a newly earned medal. Shows the
/// badge, the title, the subtitle, and a single big "Share to socials"
/// button that deep-links to the share card screen.
Future<void> showMedalCelebration(
  BuildContext context, {
  required Medal medal,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (_) => _CelebrationSheet(medal: medal),
  );
}

class _CelebrationSheet extends ConsumerStatefulWidget {
  const _CelebrationSheet({required this.medal});
  final Medal medal;

  @override
  ConsumerState<_CelebrationSheet> createState() =>
      _CelebrationSheetState();
}

class _CelebrationSheetState extends ConsumerState<_CelebrationSheet>
    with TickerProviderStateMixin {
  late final AnimationController _enter = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 520),
  );
  late final AnimationController _halo = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat(reverse: true);
  late final AnimationController _confetti = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );

  late final Animation<double> _scale = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 0.4, end: 1.12), weight: 55),
    TweenSequenceItem(
      tween: Tween(begin: 1.12, end: 1.0)
          .chain(CurveTween(curve: Curves.easeOutBack)),
      weight: 45,
    ),
  ]).animate(_enter);

  late final Animation<double> _haloScale = Tween<double>(begin: 0.92, end: 1.10)
      .animate(CurvedAnimation(parent: _halo, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();
    AppHaptics.confirm();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      _enter.forward();
      await Future.delayed(const Duration(milliseconds: 220));
      if (!mounted) return;
      _confetti.forward();
    });
  }

  @override
  void dispose() {
    _enter.dispose();
    _halo.dispose();
    _confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final m = widget.medal;
    final theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: m.tier.accent.withValues(alpha: 0.30),
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Handle(),
            const SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _confetti,
                    builder: (_, __) => IgnorePointer(
                      child: CustomPaint(
                        size: const Size(260, 260),
                        painter: _CelebrationConfettiPainter(
                          progress: _confetti.value,
                          color: m.tier.accent,
                        ),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _halo,
                    builder: (_, __) => Transform.scale(
                      scale: _haloScale.value,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              m.tier.accent.withValues(alpha: 0.30),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ScaleTransition(
                    scale: _scale,
                    child: Hero(
                      tag: 'medal-${m.id}',
                      child: MedalBadge(
                        medal: m,
                        progress: const MedalProgress(
                          earned: true,
                          value: 1,
                          target: 1,
                        ),
                        size: 180,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.medalUnlocked,
              style: theme.textTheme.labelSmall?.copyWith(
                color: m.tier.accent,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              m.title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              m.subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: m.tier.accent,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              m.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.push('/medal-share?id=${m.id}');
                },
                style: FilledButton.styleFrom(
                  backgroundColor: m.tier.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                icon: const Icon(Icons.ios_share_rounded, color: Colors.white),
                label: Text(
                  l10n.medalShareOnSocials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.medalShareLater,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Handle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.outlineVariant,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _CelebrationConfettiPainter extends CustomPainter {
  _CelebrationConfettiPainter({required this.progress, required this.color});
  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = math.max(size.width, size.height) * 0.55;
    const particles = 26;
    final colors = [
      const Color(0xFFE0598C),
      const Color(0xFFE8A33D),
      const Color(0xFF50C878),
      const Color(0xFF6DB7FF),
      const Color(0xFF9B7BD8),
      Colors.white,
    ];
    for (var i = 0; i < particles; i++) {
      final a = (i / particles) * 2 * math.pi;
      final dist = r * progress;
      final pos = c + Offset(math.cos(a) * dist, math.sin(a) * dist);
      final alpha = (1 - progress).clamp(0.0, 1.0);
      final p = Paint()
        ..color = colors[i % colors.length].withValues(alpha: alpha * 0.85);
      final size = 2.5 + (i.isEven ? 1.5 : 0.0);
      canvas.drawCircle(pos, size, p);
    }
  }

  @override
  bool shouldRepaint(covariant _CelebrationConfettiPainter old) =>
      old.progress != progress;
}
