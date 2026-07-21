import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/l10n/medal_l10n.dart';
import '../../../core/local_date.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../../core/widgets/reveal_animations.dart';
import '../../insights/domain/guardian_angel.dart';
import '../../insights/domain/habit_blooms.dart';
import '../../insights/domain/insights.dart';
import '../../insights/domain/medals.dart';
import '../../insights/providers/insights_providers.dart';
import '../../my_day/providers/my_day_providers.dart';
import 'how_this_works_sheet.dart';
import 'widgets/progress_calendar_card.dart';
import 'widgets/progress_metrics_row.dart';
import 'widgets/progress_streak_hero.dart';
import '../../insights/presentation/widgets/medal_badge.dart';
import '../../insights/presentation/widgets/medal_detail_sheet.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final myDay = ref.watch(myDayProvider);
    final insightsAsync = ref.watch(insightsProvider);
    final insights = insightsAsync.asData?.value;
    final theme = Theme.of(context);

    final ctx = MedalContext(
      todos: myDay.todayTasks,
      habits: myDay.habits,
      insights: insights ??
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
          ),
      today: LocalDate.today,
    );

    final catalogue = getMedalCatalogue();
    final progress = evaluateAll(catalogue, ctx);
    final next = nextMedal(catalogue, progress);
    final earned = earnedCount(progress);
    final insight = GuardianAngel.insight(ctx, l10n);

    final blooms = buildHabitBlooms(myDay.habits, l10n);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AmbientBackground(
        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 120),
            children: [
              _Header(
                onSettings: () => context.push('/settings'),
                onHowItWorks: () => showHowThisWorksSheet(context),
              ),
              const SizedBox(height: 4),
              const FadeUp(child: ProgressStreakHero()),
              const SizedBox(height: 6),
              const FadeUp(
                delay: Duration(milliseconds: 80),
                child: ProgressMetricsRow(),
              ),
              const SizedBox(height: 6),
              const FadeUp(
                delay: Duration(milliseconds: 160),
                child: ProgressCalendarCard(),
              ),
              const SizedBox(height: 10),
              const FadeUp(
                delay: Duration(milliseconds: 220),
                child: _HistoryTeaser(),
              ),
              const SizedBox(height: 18),
              FadeUp(
                delay: const Duration(milliseconds: 280),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          l10n.progressMedals,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.push('/medals'),
                        child: Text(l10n.progressSeeAll),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              FadeUp(
                delay: const Duration(milliseconds: 320),
                child: _MedalsGrid(progress: progress, catalogue: catalogue),
              ),
              const SizedBox(height: 12),
              FadeUp(
                delay: const Duration(milliseconds: 360),
                child: _SeeAllMedalsCta(
                  onTap: () => context.push('/medals'),
                  earned: earned,
                  total: catalogue.length,
                ),
              ),
              const SizedBox(height: 18),
              if (blooms.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    l10n.progressHabitBlooms,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    l10n.progressHabitBloomsSub,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: blooms.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, i) =>
                        _BloomCard(bloom: blooms[i]),
                  ),
                ),
                const SizedBox(height: 18),
              ],
              if (insight != null)
                FadeUp(
                  child: _GuardianInsightCard(insight: insight),
                ),
              const SizedBox(height: 12),
              if (next != null)
                FadeUp(
                  delay: const Duration(milliseconds: 60),
                  child: _NextMedalCard(
                    medal: next.medal,
                    progress: next.progress,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryTeaser extends ConsumerWidget {
  const _HistoryTeaser();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final insightsAsync = ref.watch(insightsProvider);
    final theme = Theme.of(context);
    final insights = insightsAsync.asData?.value;
    final today = LocalDate.today;
    final days = <DateTime>[
      for (var i = 6; i >= 0; i--) today.subtract(Duration(days: i)),
    ];
    var done = 0;
    var total = 0;
    for (final d in days) {
      final s = insights?.dayStats[d];
      if (s == null) continue;
      done += s.done;
      total += s.created;
    }
    final pct = total == 0 ? 0.0 : (done / total).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => context.push('/history'),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.12),
                  AppColors.tertiary.withValues(alpha: 0.08),
                ],
              ),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.28),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.history_rounded,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.progressLast7Days,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        total == 0
                            ? l10n.progressSeeDayByDayActivity
                            : l10n.progressTasksFinishedPct(
                                '$done', '$total', '${(pct * 100).round()}'),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.onSettings, required this.onHowItWorks});
  final VoidCallback onSettings;
  final VoidCallback onHowItWorks;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.tabProgress,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
          ),
        ),
        IconButton(
          onPressed: onHowItWorks,
          icon: const Icon(Icons.help_outline_rounded),
          color: AppColors.onSurfaceVariant,
          tooltip: l10n.commonHowThisWorks,
          visualDensity: VisualDensity.compact,
        ),
        IconButton(
          onPressed: onSettings,
          icon: const Icon(Icons.settings_outlined),
          color: AppColors.onSurfaceVariant,
          tooltip: l10n.commonSettingsTooltip,
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}

class _MedalsGrid extends StatelessWidget {
  const _MedalsGrid({required this.progress, required this.catalogue});
  final List<MedalProgress> progress;
  final List<Medal> catalogue;

  @override
  Widget build(BuildContext context) {
    final paired = [
      for (var i = 0; i < catalogue.length; i++)
        (medal: catalogue[i], progress: progress[i])
    ];
    final earned = paired.where((e) => e.progress.earned).toList()
      ..sort((a, b) => a.medal.title.compareTo(b.medal.title));
    final inProgress = paired
        .where((e) => !e.progress.earned && e.progress.value > 0)
        .toList()
      ..sort((a, b) => b.progress.ratio.compareTo(a.progress.ratio));
    final shown = [...earned, ...inProgress].take(6).toList();

    if (shown.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.outlineVariant),
        ),
        child: Row(
          children: [
            Icon(Icons.emoji_events_outlined,
                color: AppColors.outline, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                AppLocalizations.of(context).progressNoMedalsYet,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
              ),
            ),
          ],
        ),
      );
    }

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      // 0.78 keeps the 80px-wide cell at ~103px tall — fits the
      // 80+22 badge with ~1px breathing room.
      childAspectRatio: 0.78,
      children: [
        for (final entry in shown)
          _MedalTile(medal: entry.medal, progress: entry.progress),
      ],
    );
  }
}

class _MedalTile extends StatelessWidget {
  const _MedalTile({required this.medal, required this.progress});
  final Medal medal;
  final MedalProgress progress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => showMedalSheet(context, medal: medal, progress: progress),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'medal-${medal.id}',
              child: MedalBadge(medal: medal, progress: progress, size: 80),
            ),
            const SizedBox(height: 4),
            Text(
              medal.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: progress.earned
                    ? AppColors.onSurface
                    : AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w800,
                fontSize: 10.5,
                letterSpacing: -0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeeAllMedalsCta extends StatelessWidget {
  const _SeeAllMedalsCta({
    required this.onTap,
    required this.earned,
    required this.total,
  });
  final VoidCallback onTap;
  final int earned;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Material(
      color: AppColors.elevatedCardSurface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            children: [
              Icon(
                Icons.emoji_events_rounded,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l10n.progressSeeAllMedals('$earned', '$total'),
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.primary,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BloomCard extends StatelessWidget {
  const _BloomCard({required this.bloom});
  final HabitBloom bloom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = bloom.locked ? AppColors.outline : bloom.tone.color;
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: bloom.locked
            ? null
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withValues(alpha: 0.08),
                  AppColors.elevatedCardSurface,
                ],
              ),
        color: bloom.locked
            ? AppColors.surfaceContainer.withValues(alpha: 0.6)
            : null,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: bloom.locked
              ? AppColors.cardBorder
              : color.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: bloom.locked
            ? null
            : [
                BoxShadow(
                  color: color.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(bloom.icon, color: color, size: 20),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: bloom.badgeColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  bloom.badgeLabel.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: bloom.badgeColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            bloom.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: bloom.locked
                  ? AppColors.onSurfaceVariant
                  : AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            bloom.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          if (bloom.locked)
            Row(
              children: [
                Icon(
                  Icons.lock_rounded,
                  color: AppColors.outline,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  AppLocalizations.of(context)
                      .progressDaysTarget('${bloom.targetStreak}'),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.outline,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          else
            LiquidProgressBar(
              value: bloom.progress,
              height: 6,
              color: bloom.badgeColor,
            ),
        ],
      ),
    );
  }
}

class _GuardianInsightCard extends StatelessWidget {
  const _GuardianInsightCard({required this.insight});
  final GuardianInsight insight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.heroGradient,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 28,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).progressGuardianInsight,
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.white60,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            insight.title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            insight.body,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _NextMedalCard extends StatelessWidget {
  const _NextMedalCard({required this.medal, required this.progress});
  final Medal medal;
  final MedalProgress progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tone = medal.tone.color;
    return InkWell(
      onTap: () => showMedalSheet(context, medal: medal, progress: progress),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              tone.withValues(alpha: 0.08),
              AppColors.elevatedCardSurface,
            ],
          ),
          border: Border.all(color: tone.withValues(alpha: 0.30)),
          boxShadow: [
            BoxShadow(
              color: tone.withValues(alpha: 0.12),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: 'medal-${medal.id}',
              child: MedalBadge(medal: medal, progress: progress, size: 84),
            ),
            const SizedBox(width: 14),
            Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .progressNextBadgeTier(medal.tier.localizedLabel(AppLocalizations.of(context))),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: medal.tier.accent,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        medal.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        medal.subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: LiquidProgressBar(
                              value: progress.ratio,
                              height: 6,
                              color: tone,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context).progressOfTotal(
                                '${progress.value}', '${progress.target}'),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: tone,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
