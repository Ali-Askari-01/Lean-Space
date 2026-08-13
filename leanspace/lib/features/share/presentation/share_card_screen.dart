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

import '../../../core/l10n/app_localizations.dart';
import '../../../core/haptics.dart';
import '../../../core/local_date.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../../core/widgets/premium_logo.dart';
import '../../insights/domain/insights.dart';
import '../../insights/domain/medals.dart';
import '../../insights/providers/insights_providers.dart';
import '../../my_day/providers/my_day_providers.dart';

class ShareCardScreen extends ConsumerStatefulWidget {
  const ShareCardScreen({super.key, this.highlightMedalId});

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
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text: highlightTitle == null
              ? l10n.shareCardProgressText('${DateTime.now().year}')
              : l10n.shareCardMedalText(highlightTitle, highlightSubtitle ?? ''),
        ),
      );
    } catch (_) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.shareCouldNotShare)),
        );
      }
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
          highlighted == null ? l10n.shareCardAppBarTitle : l10n.shareCardAppBarTitleMedal,
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
                ? l10n.shareCardSnapshot
                : l10n.shareCardDescMedal(highlighted.title),
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            highlighted == null
                ? l10n.shareCardBody
                : l10n.shareCardBodyMedal,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          CtaPill(
            label: _sharing ? l10n.shareCardCtaPreparing : l10n.shareCardShareMyBloom,
            icon: _sharing ? null : Icons.ios_share_rounded,
            onPressed: _sharing ? null : _share,
          ),
        ],
      ),
    );
  }

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
    final l10n = AppLocalizations.of(context);
    final dateLabel = DateFormat('MMMM d, yyyy').format(DateTime.now());
    final gradientColors = AppColors.shareCardGradient;
    final bokehColors = AppColors.shareCardBokeh;
    final accent = AppColors.shareCardAccent;
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
              stops: [0.0, 0.55, 1.0],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ExcludeSemantics(
                  child: CustomPaint(painter: _BokehPainter(colors: bokehColors)),
                ),
              ),
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
                            color: accent.withValues(alpha: 0.3),
                            blurRadius: 18,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const PremiumLogo(size: 48, showGlow: false),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.appTitle,
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
                          gradient: RadialGradient(
                            colors: [accent, accent.withValues(alpha: 0.7)],
                            center: Alignment.topLeft,
                            radius: 1.1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: accent.withValues(alpha: 0.5),
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
                        child: Text(
                          l10n.shareCardMilestone,
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
                        _headline(l10n),
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
                        _subhead(l10n),
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
                        label: l10n.shareCardStatChain,
                        icon: Icons.local_fire_department_rounded,
                        accent: accent,
                      ),
                      _StatBubble(
                        value: '$habitsCount',
                        label: l10n.shareCardStatSprouts,
                        icon: Icons.eco_rounded,
                        accent: accent,
                      ),
                      _StatBubble(
                        value: '$medalsEarned/$totalMedals',
                        label: l10n.shareCardStatMedals,
                        icon: Icons.emoji_events_rounded,
                        accent: accent,
                      ),
                    ],
                  ),
                ),
              ),
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

  String _headline(AppLocalizations l10n) {
    if (highlight != null) return highlight!.title;
    if (insights.currentStreak >= 7) return l10n.shareCardHeadlineStreak(insights.currentStreak);
    if (medalsEarned > 0) return l10n.shareCardHeadlineMedals(medalsEarned);
    if (habitsCount > 0) return l10n.shareCardHeadlineSproutGuardian;
    if (insights.tasksCompleted > 0) return l10n.shareCardHeadlineFirstSeeds;
    return l10n.shareCardHeadlineGardenBegins;
  }

  String _subhead(AppLocalizations l10n) {
    if (highlight != null) return highlight!.subtitle;
    if (insights.currentStreak >= 30) return l10n.shareCardSubheadMonth;
    if (insights.currentStreak >= 7) return l10n.shareCardSubheadWeek;
    if (medalsEarned > 0) return l10n.shareCardSubheadProgress;
    if (habitsCount > 0) return l10n.shareCardSubheadSprouts;
    if (insights.tasksCompleted > 0) return l10n.shareCardSubheadFirstSeeds;
    return l10n.shareCardSubheadFallback;
  }
}

class _StatBubble extends StatelessWidget {
  const _StatBubble({
    required this.value,
    required this.label,
    required this.icon,
    required this.accent,
  });
  final String value;
  final String label;
  final IconData icon;
  final Color accent;

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
            gradient: LinearGradient(
              colors: [accent.withValues(alpha: 0.25), accent.withValues(alpha: 0.10)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
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
  const _BokehPainter({required this.colors});
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final rng = math.Random(7);
    for (var i = 0; i < 28; i++) {
      final c = colors[rng.nextInt(colors.length)];
      final paint = Paint()..color = c.withValues(alpha: 0.15 + rng.nextDouble() * 0.1);
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final r = 4 + rng.nextDouble() * 20;
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BokehPainter oldDelegate) => false;
}
