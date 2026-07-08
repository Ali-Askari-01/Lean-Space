import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/haptics.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';
import '../../../subscription/providers/entitlement_provider.dart';
import '../../domain/medals.dart';
import 'medal_badge.dart';

/// Opens a bottom sheet showing one medal in full detail with the badge,
/// tagline, progress, and "what to do next" hint. If [justEarned] is true,
/// plays a confetti-style celebrate animation on entry.
Future<void> showMedalSheet(
  BuildContext context, {
  required Medal medal,
  required MedalProgress progress,
  bool justEarned = false,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (_) => _MedalDetailSheet(
      medal: medal,
      progress: progress,
      justEarned: justEarned,
    ),
  );
}

class _MedalDetailSheet extends ConsumerStatefulWidget {
  const _MedalDetailSheet({
    required this.medal,
    required this.progress,
    required this.justEarned,
  });

  final Medal medal;
  final MedalProgress progress;
  final bool justEarned;

  @override
  ConsumerState<_MedalDetailSheet> createState() =>
      _MedalDetailSheetState();
}

class _MedalDetailSheetState extends ConsumerState<_MedalDetailSheet>
    with TickerProviderStateMixin {
  late final AnimationController _enter;
  late final AnimationController _celebrate;
  late final Animation<double> _badgeScale;
  late final Animation<double> _celebrateProgress;

  @override
  void initState() {
    super.initState();
    _enter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    _celebrate = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _badgeScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.6, end: 1.1), weight: 50),
      TweenSequenceItem(
        tween: Tween(begin: 1.1, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 50,
      ),
    ]).animate(_enter);
    _celebrateProgress = CurvedAnimation(
      parent: _celebrate,
      curve: Curves.easeOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      _enter.forward();
      if (widget.justEarned) {
        AppHaptics.success();
        await Future.delayed(const Duration(milliseconds: 240));
        if (!mounted) return;
        _celebrate.forward();
      }
    });
  }

  @override
  void dispose() {
    _enter.dispose();
    _celebrate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final m = widget.medal;
    final p = widget.progress;
    final earned = p.earned;
    final tone = m.tone.color;
    final isPro = ref.watch(entitlementProvider).isPro;
    final showProLock = m.proOnly && !isPro && !earned;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: AppColors.outlineVariant,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (earned)
                    AnimatedBuilder(
                      animation: _celebrateProgress,
                      builder: (_, __) {
                        return IgnorePointer(
                          child: CustomPaint(
                            size: const Size(220, 220),
                            painter: _ConfettiPainter(
                              progress: _celebrateProgress.value,
                              color: tone,
                            ),
                          ),
                        );
                      },
                    ),
                  ScaleTransition(
                    scale: _badgeScale,
                    child: Hero(
                      tag: 'medal-${m.id}',
                      child: MedalBadge(
                        medal: m,
                        progress: p,
                        size: 180,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              m.title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
                letterSpacing: -0.4,
              ),
            ),
            if (showProLock) ...[
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.tertiary,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'PRO MEDAL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 4),
            Text(
              m.subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: tone,
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
            const SizedBox(height: 18),
            if (showProLock)
              Material(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push('/paywall?from=medal');
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock_open_rounded, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Unlock with Pro',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else if (!earned)
              GlassCard(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.flag_rounded, color: tone, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Progress',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ),
                        Text(
                          '${p.value} / ${p.target} ${m.unit}',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: tone,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LiquidProgressBar(
                      value: p.ratio,
                      height: 8,
                      color: tone,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _hintFor(m, p),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              )
            else
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: tone.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: tone.withValues(alpha: 0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_rounded, color: tone, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      'EARNED · ${m.tier.label.toUpperCase()}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: tone,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(m.category.icon,
                    color: AppColors.onSurfaceVariant, size: 14),
                const SizedBox(width: 4),
                Text(
                  m.category.label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _hintFor(Medal m, MedalProgress p) {
    final remaining = m.target - p.value;
    if (remaining <= 0) return 'One more step to unlock.';
    return 'Just $remaining more ${m.unit} to unlock.';
  }
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  static const _particles = 18;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = math.max(size.width, size.height) * 0.45;
    for (var i = 0; i < _particles; i++) {
      final angle = (i / _particles) * 2 * math.pi;
      final dist = r * progress;
      final pos = c + Offset(math.cos(angle) * dist, math.sin(angle) * dist);
      final alpha = (1 - progress).clamp(0.0, 1.0);
      final paint = Paint()
        ..color = color.withValues(alpha: alpha * 0.7);
      canvas.drawCircle(pos, 3, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter old) =>
      old.progress != progress;
}
