import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/local_date.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../streak_freeze/providers/streak_freeze_providers.dart';
import '../../domain/todo_item.dart';
import '../../providers/my_day_providers.dart';

class LeftBehindBanner extends ConsumerWidget {
  const LeftBehindBanner({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myDayProvider);
    if (!state.showLeftBehindNudge) return const SizedBox.shrink();

    final freeze = ref.watch(streakFreezeProvider);
    final yesterday = LocalDate.yesterday(LocalDate.today);
    final yesterdayMissed = state.leftBehind.any(
      (t) => LocalDate.isSameDay(t.originalDate, yesterday),
    );
    final yesterdayFrozen = freeze.frozenDates.any(
      (d) => LocalDate.isSameDay(d, yesterday),
    );
    final showFreeze =
        yesterdayMissed && freeze.canUseFreeze && !yesterdayFrozen;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Column(
        children: [
          Material(
            color: AppColors.warning.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(14),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    const Icon(Icons.history,
                        color: AppColors.warning, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '${state.leftBehind.length} missed — still in Left Behind',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => ref
                          .read(myDayProvider.notifier)
                          .dismissLeftBehind(),
                      child: const Text('Dismiss'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showFreeze) ...[
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => _useFreeze(context, ref, yesterday),
              icon: const Icon(Icons.ac_unit_outlined, size: 18),
              label: const Text('Use monthly streak freeze for yesterday'),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _useFreeze(
    BuildContext context,
    WidgetRef ref,
    DateTime yesterday,
  ) async {
    final error =
        await ref.read(streakFreezeProvider.notifier).freezeDate(yesterday);
    if (!context.mounted) return;
    if (error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    await ref.read(myDayProvider.notifier).refresh();
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Streak freeze applied for yesterday.')),
    );
  }
}

class LeftBehindSheet extends ConsumerWidget {
  const LeftBehindSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myDayProvider);
    final notifier = ref.read(myDayProvider.notifier);
    final dateFormat = DateFormat.MMMd();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderStrong,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Left Behind',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Expanded(
              child: state.leftBehind.isEmpty
                  ? Center(
                      child: Text(
                        'Nothing left behind',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textMuted,
                            ),
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: state.leftBehind.length,
                      itemBuilder: (context, index) {
                        final task = state.leftBehind[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _LeftBehindTile(
                            task: task,
                            dateLabel: dateFormat.format(task.originalDate),
                            onReAdd: () => _reAdd(context, notifier, task),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _reAdd(
    BuildContext context,
    MyDayNotifier notifier,
    TodoItem task,
  ) async {
    final message = await notifier.reAddTask(task);
    if (!context.mounted) return;
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to today')),
      );
    }
  }
}

class _LeftBehindTile extends StatelessWidget {
  const _LeftBehindTile({
    required this.task,
    required this.dateLabel,
    required this.onReAdd,
  });

  final TodoItem task;
  final String dateLabel;
  final VoidCallback onReAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                      ),
                ),
              ],
            ),
          ),
          TextButton(onPressed: onReAdd, child: const Text('Re-add')),
        ],
      ),
    );
  }
}
