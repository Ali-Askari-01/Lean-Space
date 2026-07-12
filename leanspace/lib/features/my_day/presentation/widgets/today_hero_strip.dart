import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';
import 'task_cap_info_sheet.dart';

/// Top-of-screen summary on Today.
///
/// Shows: "Today · X of 5 tasks · Y of Z habits" with a combined progress
/// bar and a small "?" icon that opens [TaskCapInfoSheet]. Designed to be
/// the first thing a new user reads so they understand the value prop
/// (the 5-task cap) without scrolling.
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
    final totalUnits = taskCap + (habitsTotal == 0 ? 1 : habitsTotal);
    final doneUnits = tasksDone + habitsDone;
    final ratio = totalUnits == 0 ? 0.0 : (doneUnits / totalUnits).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${l10n.todayTasksCount('$tasksDone', '$taskCap')} · '
                  '${l10n.todayHabitsCount('$habitsDone', '$habitsTotal')}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              InkWell(
                onTap: () => showTaskCapInfoSheet(context),
                customBorder: const CircleBorder(),
                child: Tooltip(
                  message: l10n.taskCapInfo,
                  child: Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryContainer.withValues(alpha: 0.45),
                    ),
                    child: Icon(
                      Icons.help_outline_rounded,
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
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
    );
  }
}
