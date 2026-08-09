import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';

class TodayHeroStrip extends StatelessWidget {
  const TodayHeroStrip({
    super.key,
    required this.tasksDone,
    required this.tasksTotal,
    required this.taskCap,
    required this.habitsDone,
    required this.habitsTotal,
  });

  final int tasksDone;
  final int tasksTotal;
  final int taskCap;
  final int habitsDone;
  final int habitsTotal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final totalUnits = taskCap + habitsTotal;
    final doneUnits = tasksDone + habitsDone;
    final ratio = totalUnits == 0 ? 0.0 : (doneUnits / totalUnits).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${l10n.todayTasksCount('$tasksDone', '$taskCap')} · '
                  '${l10n.todayHabitsCount('$habitsDone', '$habitsTotal')}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 8),
                LiquidProgressBar(value: ratio, height: 8, color: AppColors.primary),
                const SizedBox(height: 6),
                BlueprintLabel(
                  tasksDone >= taskCap && habitsDone >= habitsTotal && habitsTotal > 0
                      ? l10n.todayChainComplete
                      : l10n.todayChainGrows,
                  color: AppColors.onSurfaceVariant,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 56,
            height: 56,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: CircularProgressIndicator(
                    value: ratio,
                    strokeWidth: 5,
                    backgroundColor: AppColors.progressTrack,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  '${(ratio * 100).toInt()}%',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
