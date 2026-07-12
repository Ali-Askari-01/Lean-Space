import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../streak_freeze/providers/streak_freeze_providers.dart';
import '../../../../core/local_date.dart';
import '../../providers/my_day_providers.dart';

/// Shown on the Today screen when the user still has open tasks and it's
/// late in the day. Tapping scrolls to the task list (the user just has
/// to tap to see them). Includes a quick "use streak freeze" affordance
/// when the streak is on the line AND yesterday is a missed day.
class StreakAtRiskBanner extends ConsumerWidget {
  const StreakAtRiskBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myDayProvider);
    final freeze = ref.watch(streakFreezeProvider);

    final open = state.todayTasks.where((t) => t.isOpen).length;
    if (open == 0) return const SizedBox.shrink();

    final hour = DateTime.now().hour;
    // Only nudge after 6pm and before 11pm, so the user has time to act.
    if (hour < 18 || hour >= 23) return const SizedBox.shrink();

    final yesterday = LocalDate.yesterday(LocalDate.today);
    final yesterdayMissed = state.leftBehind.any(
      (t) => LocalDate.isSameDay(t.originalDate, yesterday),
    );
    final yesterdayFrozen = freeze.frozenDates.any(
      (d) => LocalDate.isSameDay(d, yesterday),
    );
    final canFreeze = yesterdayMissed && freeze.canUseFreeze && !yesterdayFrozen;

    final urgency = hour >= 21 ? 'high' : 'low';
    final accent = urgency == 'high' ? AppColors.error : AppColors.tertiary;
    final bg = urgency == 'high'
        ? AppColors.error.withValues(alpha: 0.06)
        : AppColors.tertiary.withValues(alpha: 0.06);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            // Tap scrolls to the task section; the user just has to scroll.
            Scrollable.ensureVisible(
              context,
              duration: const Duration(milliseconds: 360),
              curve: Curves.easeOutCubic,
              alignment: 0.0,
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      urgency == 'high'
                          ? Icons.warning_amber_rounded
                          : Icons.hourglass_bottom_rounded,
                      color: accent,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            urgency == 'high'
                                ? 'Last call — $open task${open == 1 ? '' : 's'} still open'
                                : '$open task${open == 1 ? '' : 's'} left for today',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.onSurface,
                                ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            urgency == 'high'
                                ? 'Midnight is close. The chain depends on these.'
                                : 'You still have time. A clean day extends your streak.',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.outline,
                      size: 16,
                    ),
                  ],
                ),
                if (canFreeze) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.ac_unit_rounded,
                        color: AppColors.tertiary,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Yesterday missed — use a streak freeze?',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: AppColors.tertiary,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _useFreeze(context, ref, yesterday),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.tertiary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 0),
                          minimumSize: const Size(0, 36),
                          visualDensity: VisualDensity.compact,
                        ),
                        child: const Text('Use freeze'),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _useFreeze(
    BuildContext context,
    WidgetRef ref,
    DateTime yesterday,
  ) async {
    final err =
        await ref.read(streakFreezeProvider.notifier).freezeDate(yesterday);
    if (!context.mounted) return;
    if (err != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err)));
      return;
    }
    await ref.read(myDayProvider.notifier).refresh();
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Streak freeze applied for yesterday.')),
    );
  }
}
