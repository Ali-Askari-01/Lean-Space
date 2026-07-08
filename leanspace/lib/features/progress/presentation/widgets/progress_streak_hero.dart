import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';
import '../../../../core/widgets/guardian_mascot.dart';
import '../../../../core/widgets/reveal_animations.dart';
import '../../../insights/providers/insights_providers.dart';
import '../../../my_day/providers/my_day_providers.dart';

/// Top-of-Progress hero: mascot card with vitality %, task/habit completion
/// progress bar. Relocated from the Today tab so the home screen stays
/// scannable.
class ProgressStreakHero extends ConsumerWidget {
  const ProgressStreakHero({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myDay = ref.watch(myDayProvider);
    final insightsAsync = ref.watch(insightsProvider);
    final insights = insightsAsync.asData?.value;
    final theme = Theme.of(context);

    final completed = myDay.todayTasks.where((t) => t.isDone).length;
    final total = myDay.todayTasks.length;
    final vitality = total == 0
        ? 0
        : ((completed / total) * 100).round().clamp(0, 100);
    final bestHabitStreak = myDay.habits.isEmpty
        ? 0
        : myDay.habits
            .map((h) => h.streakCount)
            .reduce((a, b) => a > b ? a : b);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      child: GlassCard(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
        radius: 28,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlueprintLabel(
                    "TODAY'S VITALITY",
                    color: AppColors.primary,
                    icon: Icons.bolt_rounded,
                  ),
                  const SizedBox(height: 4),
                  AnimatedCounter(
                    value: vitality,
                    textStyle: theme.textTheme.displaySmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    total == 0
                        ? 'Plant a seed to begin your garden.'
                        : '$completed of $total seeds planted today.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _Pill(
                        icon: Icons.local_fire_department_rounded,
                        label: '${insights?.currentStreak ?? myDay.taskStreak}d chain',
                        color: AppColors.secondary,
                      ),
                      if (myDay.habits.isNotEmpty)
                        _Pill(
                          icon: Icons.spa_rounded,
                          label: 'Best $bestHabitStreak d',
                          color: AppColors.tertiary,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 72,
              height: 72,
              child: const GuardianMascot(
                size: 88,
                expression: GuardianExpression.proud,
                withHalo: true,
                variant: GuardianMascotVariant.forestWatering,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 13),
          const SizedBox(width: 5),
          Text(
            label,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
