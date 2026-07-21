import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/l10n/medal_l10n.dart';
import '../../../core/local_date.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../my_day/providers/my_day_providers.dart';
import '../../insights/domain/insights.dart';
import '../../insights/domain/medals.dart';
import '../../insights/providers/insights_providers.dart';
import '../../insights/presentation/widgets/medal_badge.dart';
import '../../insights/presentation/widgets/medal_detail_sheet.dart';
import '../../subscription/providers/entitlement_provider.dart';

class AllMedalsScreen extends ConsumerStatefulWidget {
  const AllMedalsScreen({super.key});

  @override
  ConsumerState<AllMedalsScreen> createState() => _AllMedalsScreenState();
}

class _AllMedalsScreenState extends ConsumerState<AllMedalsScreen> {
  MedalCategory? _filter;

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
    final catalogue = getMedalCatalogue();
    final isPro = ref.watch(entitlementProvider).isPro;
    final medalCtx = MedalContext(
      todos: myDay.todayTasks,
      habits: myDay.habits,
      insights: insights,
      today: LocalDate.today,
    );
    final progress = evaluateAll(catalogue, medalCtx);

    final paired = [
      for (var i = 0; i < catalogue.length; i++)
        (medal: catalogue[i], progress: progress[i])
    ];
    final earned = paired
        .where((e) => e.progress.earned && (!e.medal.proOnly || isPro))
        .toList()
      ..sort((a, b) {
        final t = b.medal.tier.index.compareTo(a.medal.tier.index);
        if (t != 0) return t;
        return a.medal.title.compareTo(b.medal.title);
      });
    final total = catalogue.length;

    final filtered = _filter == null
        ? catalogue
        : catalogue.where((m) => m.category == _filter).toList();
    final filteredProgress = [
      for (final m in filtered) m.evaluate(medalCtx)
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.onSurfaceVariant,
        ),
        title: Text(l10n.medalsTitle),
        actions: [
          IconButton(
            onPressed: () => context.push('/share-card'),
            icon: const Icon(Icons.ios_share_rounded),
            color: AppColors.onSurfaceVariant,
            tooltip: l10n.medalsShareTooltip,
          ),
        ],
      ),
      body: AmbientBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 80),
            children: [
              _SummaryBanner(earned: earned.length, total: total),
              const SizedBox(height: 16),
              _CategoryFilter(
                selected: _filter,
                onChanged: (c) => setState(() => _filter = c),
              ),
              if (earned.isNotEmpty && _filter == null) ...[
                const SizedBox(height: 18),
                _SectionLabel(
                  title: l10n.medalsTrophyRoom,
                  icon: Icons.emoji_events_rounded,
                  color: AppColors.primary,
                  count: earned.length,
                ),
                const SizedBox(height: 12),
                _EarnedShowcase(earned: earned),
              ],
              const SizedBox(height: 18),
              _SectionLabel(
                title: _filter == null ? l10n.medalsAllMedals : '${_filter!.localizedLabel(l10n)} ${l10n.medalsAllMedals.toLowerCase()}',
                icon: Icons.workspace_premium_rounded,
                color: AppColors.tertiary,
                count: filtered.length,
              ),
              const SizedBox(height: 8),
              _TierLegend(),
              const SizedBox(height: 14),
              if (filtered.isEmpty)
                const _EmptyState()
              else
                _MedalGrid(
                  filtered: filtered,
                  progress: filteredProgress,
                ),
              const SizedBox(height: 24),
              _ShareCta(onTap: () => context.push('/share-card')),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryBanner extends StatelessWidget {
  const _SummaryBanner({required this.earned, required this.total});
  final int earned;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pct = total == 0 ? 0.0 : (earned / total);
    final l10n = AppLocalizations.of(context);
    final headline = earned == 0
        ? l10n.medalsTrophyEmpty
        : earned == 1
            ? l10n.medalsTrophyFirst
            : l10n.medalsTrophyMany('$earned');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.gradientHabit,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.30),
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
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.30),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.emoji_events_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.medalsTrophyRoom,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      headline,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.88),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LiquidProgressBar(value: pct, height: 10, color: Colors.white),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.medalsProgressLabel('$total'),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
              ),
              Text(
                '${(pct * 100).round()}%',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TierLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        children: [
          for (final t in MedalTier.values) ...[
            _TierPill(tier: t),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _TierPill extends StatelessWidget {
  const _TierPill({required this.tier});
  final MedalTier tier;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: tier.ribbon.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: tier.ribbon.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(tier.sigil, color: tier.ribbon, size: 12),
          const SizedBox(width: 4),
          Text(
            tier.localizedLabel(l10n),
            style: TextStyle(
              color: tier.ribbon,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter({required this.selected, required this.onChanged});
  final MedalCategory? selected;
  final ValueChanged<MedalCategory?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        children: [
          _Chip(
            label: l10n.medalsFilterAll,
            icon: Icons.dashboard_rounded,
            color: AppColors.onSurface,
            selected: selected == null,
            onTap: () => onChanged(null),
          ),
          const SizedBox(width: 8),
          for (final c in MedalCategory.values) ...[
            _Chip(
              label: c.localizedLabel(l10n),
              icon: c.icon,
              color: AppColors.primary,
              selected: selected == c,
              onTap: () => onChanged(c),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.icon,
    required this.color,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? color.withValues(alpha: 0.12)
          : AppColors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: selected ? color : AppColors.outlineVariant,
                width: selected ? 1.4 : 0.6,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon,
                    color: selected ? color : AppColors.onSurfaceVariant,
                    size: 13),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: TextStyle(
                    color: selected ? color : AppColors.onSurface,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.5,
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({
    required this.title,
    required this.icon,
    required this.color,
    required this.count,
  });
  final String title;
  final IconData icon;
  final Color color;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
              fontSize: 15,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w800,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EarnedShowcase extends StatelessWidget {
  const _EarnedShowcase({required this.earned});
  final List<({Medal medal, MedalProgress progress})> earned;

  @override
  Widget build(BuildContext context) {
    final showcase = earned.take(8).toList();
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: showcase.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final e = showcase[i];
          return SizedBox(
            width: 140,
            child: _EarnedCard(medal: e.medal, progress: e.progress),
          );
        },
      ),
    );
  }
}

class _EarnedCard extends StatelessWidget {
  const _EarnedCard({required this.medal, required this.progress});
  final Medal medal;
  final MedalProgress progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => showMedalSheet(context, medal: medal, progress: progress),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 14, 10, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.elevatedCardSurface,
          border: Border.all(color: medal.tier.accent.withValues(alpha: 0.35)),
          boxShadow: [
            BoxShadow(
              color: medal.tier.accent.withValues(alpha: 0.15),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            MedalBadge(medal: medal, progress: progress, size: 88),
            const SizedBox(height: 6),
            Text(
              medal.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.onSurface,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MedalGrid extends StatelessWidget {
  const _MedalGrid({
    required this.filtered,
    required this.progress,
  });
  final List<Medal> filtered;
  final List<MedalProgress> progress;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        // 0.62 keeps a 100px-wide cell at 161px tall — gives the
        // 100+22 badge + ribbon + a small breathing buffer.
        childAspectRatio: 0.62,
      ),
      itemCount: filtered.length,
      itemBuilder: (_, i) {
        final m = filtered[i];
        final p = progress[i];
        return _MedalTile(medal: m, progress: p);
      },
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: 'medal-${medal.id}',
            child: MedalBadge(medal: medal, progress: progress, size: 100),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(
          Icons.emoji_events_outlined,
          color: AppColors.outline,
          size: 48,
        ),
        const SizedBox(height: 10),
        Text(
          l10n.medalsEmptyTitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.medalsEmptyBody,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _ShareCta extends StatelessWidget {
  const _ShareCta({required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.ios_share_rounded, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                l10n.medalsShareCta,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
