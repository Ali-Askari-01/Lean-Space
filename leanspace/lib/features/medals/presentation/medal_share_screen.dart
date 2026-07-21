import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/haptics.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/premium_logo.dart';
import '../../insights/domain/medals.dart';
import '../../insights/presentation/widgets/medal_badge.dart';

class MedalShareScreen extends ConsumerStatefulWidget {
  const MedalShareScreen({super.key, required this.medalId});

  final String medalId;

  @override
  ConsumerState<MedalShareScreen> createState() => _MedalShareScreenState();
}

class _MedalShareScreenState extends ConsumerState<MedalShareScreen>
    with SingleTickerProviderStateMixin {
  final _cardKey = GlobalKey();
  bool _sharing = false;
  late final AnimationController _glow = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2500),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _glow.dispose();
    super.dispose();
  }

  Medal? _findMedal() {
    for (final m in getMedalCatalogue()) {
      if (m.id == widget.medalId) return m;
    }
    return null;
  }

  Future<void> _share() async {
    if (_sharing) return;
    setState(() => _sharing = true);
    try {
      final boundary =
          _cardKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;
      final image = await boundary.toImage(pixelRatio: 3);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;
      final bytes = byteData.buffer.asUint8List();

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/medal_share.png');
      await file.writeAsBytes(bytes);

      AppHaptics.light();
      final medal = _findMedal();
      final l10n = AppLocalizations.of(context);
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text: l10n.shareCardMedalText(
            medal?.title ?? '',
            medal?.subtitle ?? '',
          ),
        ),
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not share')),
        );
      }
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final medal = _findMedal();
    if (medal == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Medal')),
        body: const Center(child: Text('Medal not found')),
      );
    }

    final progress = MedalProgress(
      earned: true,
      value: medal.target,
      target: medal.target,
    );
    final dateLabel = DateFormat('MMMM d, yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.onSurfaceVariant,
        ),
        title: const Text('Share Medal'),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Center(
            child: RepaintBoundary(
              key: _cardKey,
              child: _MedalShareCard(
                medal: medal,
                progress: progress,
                dateLabel: dateLabel,
                glowAnimation: _glow,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            medal.title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            medal.description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton.icon(
              onPressed: _sharing ? null : _share,
              style: FilledButton.styleFrom(
                backgroundColor: medal.tier.accent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              icon: _sharing
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.ios_share_rounded, color: Colors.white),
              label: Text(
                _sharing ? 'Preparing...' : 'Share to Socials',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MedalShareCard extends StatelessWidget {
  const _MedalShareCard({
    required this.medal,
    required this.progress,
    required this.dateLabel,
    required this.glowAnimation,
  });

  final Medal medal;
  final MedalProgress progress;
  final String dateLabel;
  final AnimationController glowAnimation;

  @override
  Widget build(BuildContext context) {
    final accent = medal.tier.accent;
    final ribbon = medal.tier.ribbon;
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ribbon,
                ribbon.withValues(alpha: 0.8),
                accent.withValues(alpha: 0.6),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
          child: Stack(
            children: [
              // Bokeh particles
              Positioned.fill(
                child: CustomPaint(
                  painter: _MedalBokehPainter(accent: accent),
                ),
              ),
              // Decorative ring
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Center(
                  child: AnimatedBuilder(
                    animation: glowAnimation,
                    builder: (_, __) {
                      final t = glowAnimation.value;
                      return Container(
                        width: 180 + t * 10,
                        height: 180 + t * 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.10 + t * 0.05),
                            width: 1.5,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Brand mark
              Positioned(
                top: 24,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                      padding: const EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: const PremiumLogo(size: 42, showGlow: false),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      AppLocalizations.of(context).appTitle,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              // Center content
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Medal badge
                      MedalBadge(
                        medal: medal,
                        progress: progress,
                        size: 160,
                      ),
                      const SizedBox(height: 20),
                      // Tier label
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.16),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          medal.tier.label.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      // Medal title
                      Text(
                        medal.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.4,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Subtitle
                      Text(
                        medal.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Category badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: accent.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(medal.category.icon,
                                color: Colors.white, size: 13),
                            const SizedBox(width: 5),
                            Text(
                              medal.tier.tagline,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom stats
              Positioned(
                left: 0,
                right: 0,
                bottom: 24,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _MiniStat(
                        icon: Icons.star_rounded,
                        label: medal.tier.label,
                        accent: accent,
                      ),
                      _MiniStat(
                        icon: medal.category.icon,
                        label: medal.category.label,
                        accent: accent,
                      ),
                      _MiniStat(
                        icon: Icons.calendar_today_rounded,
                        label: dateLabel.split(' ').take(2).join(' '),
                        accent: accent,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({
    required this.icon,
    required this.label,
    required this.accent,
  });

  final IconData icon;
  final String label;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.25),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

class _MedalBokehPainter extends CustomPainter {
  const _MedalBokehPainter({required this.accent});
  final Color accent;

  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      accent,
      accent.withValues(alpha: 0.5),
      Colors.white,
      accent.withValues(alpha: 0.3),
    ];
    final rng = math.Random(42);
    for (var i = 0; i < 30; i++) {
      final c = colors[rng.nextInt(colors.length)];
      final paint = Paint()
        ..color = c.withValues(alpha: 0.08 + rng.nextDouble() * 0.06);
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final r = 3 + rng.nextDouble() * 16;
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _MedalBokehPainter oldDelegate) => false;
}
