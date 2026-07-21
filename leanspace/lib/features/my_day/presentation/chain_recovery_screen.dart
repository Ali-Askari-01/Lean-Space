import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/reveal_animations.dart';
import '../../insights/providers/insights_providers.dart';
import '../providers/my_day_providers.dart';

/// One-screen, first-frame recovery ritual when the user's chain has just
/// broken. Designed to feel like a soft landing — not a failure screen.
class ChainRecoveryScreen extends ConsumerWidget {
  const ChainRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final insightsAsync = ref.watch(insightsProvider);
    final myDay = ref.watch(myDayProvider);
    final insights = insightsAsync.asData?.value;
    final bestStreak = insights?.bestStreak ?? 0;
    final totalDone = insights?.tasksCompleted ?? 0;
    final openToday = myDay.todayTasks.where((t) => t.isOpen).length;
    final activeHabits = myDay.habits.length;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close_rounded),
          color: AppColors.onSurfaceVariant,
        ),
        title: Text(l10n.chainRecoveryFreshStart),
      ),
      body: AmbientBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
            children: [
              ScaleIn(
                child: Container(
                  width: 96,
                  height: 96,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: AppColors.gradientHabit,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.25),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.eco_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeUp(
                delay: const Duration(milliseconds: 60),
                child: Text(
                  l10n.chainBrokenTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                    color: AppColors.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FadeUp(
                delay: const Duration(milliseconds: 120),
                child: Text(
                  l10n.chainBrokenBody,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeUp(
                delay: const Duration(milliseconds: 200),
                child: _StatsRow(
                  bestStreak: bestStreak,
                  totalDone: totalDone,
                  activeHabits: activeHabits,
                ),
              ),
              const SizedBox(height: 28),
              FadeUp(
                delay: const Duration(milliseconds: 280),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (openToday == 0) {
                        // No tasks yet — nudge the user to plant.
                        context.go('/my-day');
                      } else {
                        context.go('/my-day');
                      }
                    },
                    icon: const Icon(Icons.eco_rounded),
                    label: Text(
                      openToday == 0
                          ? l10n.chainBrokenPlantFirst
                          : l10n.chainBrokenCta,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeUp(
                delay: const Duration(milliseconds: 360),
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.push('/left-behind');
                    },
                    icon: const Icon(Icons.history_rounded, size: 16),
                    label: Text(l10n.chainBrokenCheck),
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

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.bestStreak,
    required this.totalDone,
    required this.activeHabits,
  });
  final int bestStreak;
  final int totalDone;
  final int activeHabits;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.elevatedCardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: _Stat(
              value: '$bestStreak',
              label: l10n.chainBrokenBestChain,
              color: AppColors.secondary,
              icon: Icons.local_fire_department_rounded,
            ),
          ),
          Container(
            width: 0.5,
            height: 36,
            color: AppColors.outlineVariant,
          ),
          Expanded(
            child: _Stat(
              value: '$totalDone',
              label: l10n.chainBrokenTasksDone,
              color: AppColors.primary,
              icon: Icons.check_circle_outline_rounded,
            ),
          ),
          Container(
            width: 0.5,
            height: 36,
            color: AppColors.outlineVariant,
          ),
          Expanded(
            child: _Stat(
              value: '$activeHabits',
              label: l10n.chainBrokenSprouts,
              color: AppColors.tertiary,
              icon: Icons.spa_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
  });
  final String value;
  final String label;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w800,
            height: 1,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelSmall?.copyWith(
            color: AppColors.onSurfaceVariant,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}
