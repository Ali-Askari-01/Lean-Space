import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../insights/domain/insights.dart';
import '../../../insights/providers/insights_providers.dart';

/// Five small stat tiles summarising the user's progress. 3 primary
/// metrics on the top row, 2 secondary metrics on the bottom row —
/// gives the hero numbers the breathing room they need.
class ProgressMetricsRow extends ConsumerWidget {
  const ProgressMetricsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 6),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _Metric(
                  label: 'Current',
                  value: '${insights.currentStreak}d',
                  color: AppColors.primary,
                  icon: Icons.local_fire_department_rounded,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _Metric(
                  label: 'Best',
                  value: '${insights.bestStreak}d',
                  color: AppColors.secondary,
                  icon: Icons.emoji_events_rounded,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _Metric(
                  label: 'Done',
                  value: '${insights.tasksCompleted}',
                  color: AppColors.tertiary,
                  icon: Icons.check_circle_outline_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: _Metric(
                  label: 'Perfect',
                  value: '${insights.perfectDays}',
                  color: AppColors.primary,
                  icon: Icons.eco_rounded,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _Metric(
                  label: 'Habits',
                  value: '${insights.activeHabits}',
                  color: AppColors.tertiary,
                  icon: Icons.spa_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
              height: 1,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
