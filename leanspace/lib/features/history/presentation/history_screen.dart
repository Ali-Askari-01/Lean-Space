import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/local_date.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../insights/domain/insights.dart';
import '../../insights/providers/insights_providers.dart';
import '../../streak_freeze/providers/streak_freeze_providers.dart';
import '../../subscription/providers/entitlement_provider.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  static const _freeWindowDays = 7;
  static const _proWindowDays = 365;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final insightsAsync = ref.watch(insightsProvider);
    final freeze = ref.watch(streakFreezeProvider);
    final isPro = ref.watch(entitlementProvider).isPro;
    final theme = Theme.of(context);
    final days = isPro ? _proWindowDays : _freeWindowDays;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.onSurfaceVariant,
        ),
        title: Text(isPro ? l10n.historyFullTitle : l10n.historyTitle),
        actions: [
          if (isPro)
            IconButton(
              onPressed: () => context.push('/progress'),
              icon: const Icon(Icons.calendar_view_month_rounded),
              color: AppColors.onSurfaceVariant,
              tooltip: l10n.historyFullCalendar,
            ),
        ],
      ),
      body: AmbientBackground(
        child: insightsAsync.when(
          loading: () => Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          error: (e, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                l10n.historyLoadError,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ),
          ),
          data: (data) => _HistoryBody(
            insights: data,
            frozenDates: freeze.frozenDates,
            days: days,
            isPro: isPro,
          ),
        ),
      ),
    );
  }
}

class _HistoryBody extends StatelessWidget {
  const _HistoryBody({
    required this.insights,
    required this.frozenDates,
    required this.days,
    required this.isPro,
  });
  final InsightsData insights;
  final List<DateTime> frozenDates;
  final int days;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final today = LocalDate.today;
    final dateList = <DateTime>[
      for (var i = days - 1; i >= 0; i--) today.subtract(Duration(days: i)),
    ];

    // Stats for the period
    var created = 0;
    var done = 0;
    var perfect = 0;
    for (final d in dateList) {
      final stat = insights.dayStats[d];
      if (stat == null) continue;
      created += stat.created;
      done += stat.done;
      if (stat.isPerfect) perfect++;
    }
    final completion =
        created == 0 ? 0 : ((done / created) * 100).round().clamp(0, 100);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 80),
      children: [
        _PeriodSummary(
          total: created,
          done: done,
          perfect: perfect,
          completion: completion,
          days: days,
        ),
        const SizedBox(height: 18),
        Text(
          l10n.historyDayByDay,
          style: theme.textTheme.labelSmall?.copyWith(
            color: AppColors.onSurfaceVariant,
            letterSpacing: 1.4,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        for (final d in dateList) ...[
          _DayRow(
            date: d,
            stat: insights.dayStats[d],
            frozen: frozenDates.any((f) => LocalDate.isSameDay(f, d)),
            isToday: LocalDate.isSameDay(d, LocalDate.today),
          ),
          const SizedBox(height: 8),
        ],
        if (!isPro) const _FullHistoryUpsell(),
      ],
    );
  }
}

class _PeriodSummary extends StatelessWidget {
  const _PeriodSummary({
    required this.total,
    required this.done,
    required this.perfect,
    required this.completion,
    required this.days,
  });
  final int total;
  final int done;
  final int perfect;
  final int completion;
  final int days;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.gradientHabit,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.insights_rounded,
                  color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Text(
                l10n.historyThisWeek('$days'),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            l10n.historyCompletedPercent('$completion'),
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              height: 1,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            total == 0
                ? l10n.historyEmpty
                : l10n.historyDoneCount('$done', '$total', '$perfect'),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.92),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _DayRow extends StatelessWidget {
  const _DayRow({
    required this.date,
    required this.stat,
    required this.frozen,
    required this.isToday,
  });
  final DateTime date;
  final DayStat? stat;
  final bool frozen;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final hasData = stat != null && stat!.created > 0;
    final ratio = hasData ? (stat!.done / stat!.created).clamp(0.0, 1.0) : 0.0;
    final isPerfect = hasData && stat!.isPerfect;
    final isEmpty = !hasData;
    final dow = DateFormat('EEE').format(date);
    final dayNum = date.day;

    final Color accent;
    if (frozen) {
      accent = AppColors.tertiary;
    } else if (isPerfect) {
      accent = AppColors.primary;
    } else if (ratio >= 0.5) {
      accent = AppColors.primary;
    } else if (ratio > 0) {
      accent = AppColors.secondary;
    } else if (isEmpty) {
      accent = AppColors.outline;
    } else {
      accent = AppColors.error;
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.elevatedCardSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isPerfect
              ? AppColors.primary.withValues(alpha: 0.4)
              : AppColors.cardBorder,
          width: isPerfect ? 1.2 : 0.5,
        ),
      ),
      child: Row(
        children: [
          // Day badge
          Container(
            width: 48,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: isEmpty ? 0.1 : 0.18),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: accent.withValues(alpha: 0.35),
                width: 0.8,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dow.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  '$dayNum',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        isToday
                            ? l10n.historyToday
                            : DateFormat('EEEE, MMM d').format(date),
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    if (frozen)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.tertiary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.ac_unit_rounded,
                              color: AppColors.tertiary,
                              size: 12,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              l10n.historyFrozen,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: AppColors.tertiary,
                                fontWeight: FontWeight.w800,
                                fontSize: 9,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (isPerfect)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.verified_rounded,
                              color: AppColors.primary,
                              size: 12,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              l10n.historyPerfect,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: 9,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                if (isEmpty)
                  Text(
                    l10n.historyEmptyDay,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: ratio,
                            minHeight: 6,
                            backgroundColor:
                                AppColors.surfaceContainerHigh,
                            color: accent,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        l10n.tasksProgressCount(
                          '${stat!.done}',
                          '${stat!.created}',
                        ),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                if (hasData && stat!.missed > 0) ...[
                  const SizedBox(height: 4),
                  Text(
                    l10n.historyLeftBehindCount('${stat!.missed}'),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FullHistoryUpsell extends StatelessWidget {
  const _FullHistoryUpsell();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => context.push('/paywall?from=history'),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.10),
                  AppColors.tertiary.withValues(alpha: 0.08),
                ],
              ),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_open_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            l10n.historyUpsellTitle,
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(
                              color: AppColors.tertiary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              l10n.youProBadge,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.historyUpsellBody,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
