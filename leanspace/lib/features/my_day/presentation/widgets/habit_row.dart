import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/haptics.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/pop_in.dart';
import '../../../subscription/providers/entitlement_provider.dart';
import '../../domain/habit.dart';
import '../../providers/my_day_providers.dart';
import 'add_habit_sheet.dart';

class HabitRow extends ConsumerWidget {
  const HabitRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slots = ref.watch(myDayProvider).habitSlots;
    final notifier = ref.read(myDayProvider.notifier);
    final slotLimit = ref.watch(entitlementProvider).habitSlotLimit;

    return SizedBox(
      height: 108,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 5,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final habit = slots[index];
          final locked = habit == null && index >= slotLimit;

          if (locked) {
            return _LockedHabitTile(
              onTap: () {
                AppHaptics.blocked();
                context.push('/paywall');
              },
            );
          }

          return _HabitTile(
            habit: habit,
            onTap: habit == null
                ? () {
                    AppHaptics.light();
                    _openAddSheet(context, index, null);
                  }
                : () {
                    habit.isCompletedToday()
                        ? AppHaptics.light()
                        : AppHaptics.success();
                    notifier.toggleHabit(habit);
                  },
            onLongPress: habit == null
                ? null
                : () => _openAddSheet(context, index, habit),
          );
        },
      ),
    );
  }

  void _openAddSheet(BuildContext context, int slotIndex, Habit? habit) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgElev,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) => AddHabitSheet(slotIndex: slotIndex, habit: habit),
    );
  }
}

class _LockedHabitTile extends StatelessWidget {
  const _LockedHabitTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.accent.withValues(alpha: 0.05),
          border: Border.all(
            color: AppColors.accent.withValues(alpha: 0.25),
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline, size: 20, color: AppColors.accent),
            const SizedBox(height: 8),
            Text(
              'Pro slot',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.accentSoft,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HabitTile extends StatelessWidget {
  const _HabitTile({
    required this.habit,
    required this.onTap,
    this.onLongPress,
  });

  final Habit? habit;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final isEmpty = habit == null;
    final isDone = habit?.isCompletedToday() ?? false;

    if (isEmpty) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.borderStrong,
              width: 1.5,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.textFaint, width: 1.5),
                ),
                child: Icon(Icons.add, size: 14, color: AppColors.textFaint),
              ),
              const SizedBox(height: 8),
              Text(
                'Add habit',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.textFaint,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    return Material(
      color: isDone
          ? AppColors.accent.withValues(alpha: 0.08)
          : AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: isDone ? AppColors.accent.withValues(alpha: 0.4) : AppColors.borderStrong,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: 96,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PopWhen(
                      active: isDone,
                      child: Icon(
                        isDone
                            ? Icons.check_circle_rounded
                            : Icons.circle_outlined,
                        size: 20,
                        color: isDone ? AppColors.accent : AppColors.textFaint,
                      ),
                    ),
                    const Spacer(),
                    if (habit!.streakCount > 0)
                      Text(
                        '${habit!.streakCount}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.accentSoft,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                  ],
                ),
                const Spacer(),
                Text(
                  habit!.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
