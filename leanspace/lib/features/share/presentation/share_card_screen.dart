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
import '../../../core/local_date.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../insights/domain/insights.dart';
import '../../insights/domain/medals.dart';
import '../../insights/providers/insights_providers.dart';
import '../../my_day/providers/my_day_providers.dart';

class ShareCardScreen extends ConsumerStatefulWidget {
  const ShareCardScreen({super.key, this.highlightMedalId});

  /// When set, the share card is themed around the user's newest
  /// medal so they can post a celebratory card right after they earn it.
  final String? highlightMedalId;

  @override
  ConsumerState<ShareCardScreen> createState() => _ShareCardScreenState();
}

class _ShareCardScreenState extends ConsumerState<ShareCardScreen> {
  final _cardKey = GlobalKey();
  bool _sharing = false;

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
      final file = File('${dir.path}/bloom_tracker_share.png');
      await file.writeAsBytes(bytes);

      // Re-resolve the highlighted medal from the catalogue so the share
      // caption can include its name + tagline.
      String? highlightTitle;
      String? highlightSubtitle;
      if (widget.highlightMedalId != null) {
        for (final m in getMedalCatalogue()) {
          if (m.id == widget.highlightMedalId) {
            highlightTitle = m.title;
            highlightSubtitle = m.subtitle;
            break;
          }
        }
      }
      AppHaptics.light();
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text: highlightTitle == null
              ? 'My Bloom Tracker progress — ${DateTime.now().year} on Bloom Tracker.'
              : 'I just unlocked the "$highlightTitle" medal on Bloom Tracker. $highlightSubtitle',
        ),
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not share right now')),
        );
      }
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final myDay = ref.watch(myDayProvider);
    final insightsAsync = ref.watch(insightsProvider);
    final insights = insightsAsync.asData?.value ??
        const InsightsData(
          currentStreak: 0,
          bestStreak: 0,
          last7Days: [],
          tasksCompleted: 0,
          tasksCreated: 0,
          perfectDays: 0,
          activeHabits: 0,
          topHabitStreak: 0,
          windowDays: null,
        );

    final medalCtx = MedalContext(
      todos: myDay.todayTasks,
      habits: myDay.habits,
      insights: insights,
      today: LocalDate.today,
    );
    final catalogue = getMedalCatalogue();
    final progress = evaluateAll(catalogue, medalCtx);
    final earned = progress.where((p) => p.earned).toList();
    final strongest = _pickStrongest(insights, myDay.habits.length, earned.length);
    final theme = Theme.of(context);

    // If the user opened this from the celebration sheet, find that
    // medal and use it as the headline; otherwise pick the most
    // share-worthy stat (existing behaviour).
    Medal? highlighted;
    if (widget.highlightMedalId != null) {
      for (var i = 0; i < catalogue.length; i++) {
        if (catalogue[i].id == widget.highlightMedalId) {
          highlighted = catalogue[i];
          break;
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.onSurfaceVariant,
        ),
        title: Text(
          highlighted == null ? 'Share Card' : 'Share your medal',
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Center(
            child: RepaintBoundary(
              key: _cardKey,
              child: _ShareableCard(
                insights: insights,
                habitsCount: myDay.habits.length,
                medalsEarned: earned.length,
                totalMedals: catalogue.length,
                strongest: strongest,
                highlight: highlighted,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            highlighted == null
                ? 'A snapshot of your sanctuary'
                : 'Show off your new ${highlighted.title} badge',
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            highlighted == null
                ? 'The card above is exported as a PNG and sent to your share '
                    'sheet. Post it on your story, send it to a friend, or print '
                    'it as a sticker.'
                : 'Share the win with your circle. The card is exported as a PNG '
                    'and ready for any social app.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          CtaPill(
            label: _sharing ? 'Preparing…' : 'Share my bloom',
            icon: _sharing ? null : Icons.ios_share_rounded,
            onPressed: _sharing ? null : _share,
          ),
        ],
      ),
    );
  }

  /// Picks the single most share-worthy number for the card headline.
  String _pickStrongest(
    InsightsData insights,
    int habitsCount,
    int medals,
  ) {
    if (insights.currentStreak >= 7) return '${insights.currentStreak}';
    if (habitsCount >= 1) return '${insights.topHabitStreak}';
    if (insights.tasksCompleted > 0) return '${insights.tasksCompleted}';
    if (medals > 0) return '$medals';
    return '1';
  }
}

class _ShareableCard extends StatelessWidget {
  const _ShareableCard({
    required this.insights,
    required this.habitsCount,
    required this.medalsEarned,
    required this.totalMedals,
    required this.strongest,
    this.highlight,
  });

  final InsightsData insights;
  final int habitsCount;
  final int medalsEarned;
  final int totalMedals;
  final String strongest;
  final Medal? highlight;

  @override
  Widget build(BuildContext context) {
    final dateLabel = DateFormat('MMMM d, yyyy').format(DateTime.now());
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0F2E1B),
                Color(0xFF1B4A2E),
                Color(0xFF2A6B43),
              ],
              stops: [0.0, 0.55, 1.0],
            ),
          ),
          child: Stack(
            children: [
              // Bokeh light dots, evoking the reference design.
              Positioned.fill(
                child: CustomPaint(painter: _BokehPainter()),
              ),
              // Brand mark.
              Positioned(
                top: 24,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withValues(alpha: 0.2),
                            blurRadius: 18,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/brand/bloom_tracker_logo.png',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.eco_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Bloom Tracker',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              // Headline circle.
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 110, 28, 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [Color(0xFFFFA37A), Color(0xFFE5643B)],
                            center: Alignment.topLeft,
                            radius: 1.1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  const Color(0xFFE5643B).withValues(alpha: 0.5),
                              blurRadius: 24,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.eco_rounded,
                          color: Colors.white,
                          size: 56,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.16),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Text(
                          'NEW MILESTONE UNLOCKED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _headline(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.6,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _subhead(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom row: stats.
              Positioned(
                left: 0,
                right: 0,
                bottom: 18,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatBubble(
                        value: '${insights.currentStreak}',
                        label: 'day chain',
                        icon: Icons.local_fire_department_rounded,
                      ),
                      _StatBubble(
                        value: '$habitsCount',
                        label: 'sprouts',
                        icon: Icons.eco_rounded,
                      ),
                      _StatBubble(
                        value: '$medalsEarned/$totalMedals',
                        label: 'medals',
                        icon: Icons.emoji_events_rounded,
                      ),
                    ],
                  ),
                ),
              ),
              // Footer date.
              Positioned(
                right: 16,
                bottom: 0,
                child: Text(
                  dateLabel,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _headline() {
    if (highlight != null) {
      return highlight!.title;
    }
    if (insights.currentStreak >= 30) {
      return '${insights.currentStreak} Day Streak';
    }
    if (insights.currentStreak >= 7) {
      return '${insights.currentStreak} Day Streak';
    }
    if (medalsEarned > 0) {
      return '$medalsEarned Medal${medalsEarned == 1 ? '' : 's'} Earned';
    }
    if (habitsCount > 0) {
      return 'Sprout Guardian';
    }
    if (insights.tasksCompleted > 0) {
      return 'First Seeds Planted';
    }
    return 'A Garden Begins';
  }

  String _subhead() {
    if (highlight != null) {
      return highlight!.subtitle;
    }
    if (insights.currentStreak >= 30) {
      return "You've successfully nurtured your habits for a full month.";
    }
    if (insights.currentStreak >= 7) {
      return "A full week of growth — your forest is thickening.";
    }
    if (medalsEarned > 0) {
      return "Your sanctuary is showing real progress. Keep tending.";
    }
    if (habitsCount > 0) {
      return "Your first sprouts are taking root. Water them daily.";
    }
    if (insights.tasksCompleted > 0) {
      return "Your first seeds are in the soil. Watch them open.";
    }
    return "Every forest begins with one tiny choice.";
  }
}

class _StatBubble extends StatelessWidget {
  const _StatBubble({
    required this.value,
    required this.label,
    required this.icon,
  });
  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.18),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 16,
            height: 1,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}

class _BokehPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      const Color(0xFFFFE08A),
      const Color(0xFFFFA37A),
      const Color(0xFF8FE3B6),
      Colors.white,
    ];
    final rng = math.Random(7);
    for (var i = 0; i < 24; i++) {
      final c = colors[rng.nextInt(colors.length)];
      final paint = Paint()..color = c.withValues(alpha: 0.18);
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final r = 4 + rng.nextDouble() * 18;
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BokehPainter oldDelegate) => false;
}
