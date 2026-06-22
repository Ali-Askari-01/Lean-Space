import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/haptics.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/todo_item.dart';
import '../../providers/my_day_providers.dart';
import '../../../reminders/providers/reminder_providers.dart';
import 'add_task_sheet.dart';

class TaskSection extends ConsumerWidget {
  const TaskSection({super.key});

  void _openAddSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgElev,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => const AddTaskSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myDayProvider);
    final notifier = ref.read(myDayProvider.notifier);
    final reminders = ref.watch(reminderControllerProvider);
    final reminderNotifier = ref.read(reminderControllerProvider.notifier);
    final theme = Theme.of(context);
    final tasks = state.todayTasks;
    final emptySlots = 5 - tasks.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...tasks.map(
          (task) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            child: _TaskSlot(
              task: task,
              hasReminder: reminders.hasReminder(task.id),
              onToggle: task.isOpen
                  ? () async {
                      AppHaptics.success();
                      await notifier.completeTask(task);
                      await reminderNotifier.clearTaskReminder(task.id);
                    }
                  : null,
              onDelete: () async {
                await notifier.deleteTask(task.id);
                await reminderNotifier.clearTaskReminder(task.id);
              },
            ),
          ),
        ),
        ...List.generate(
          emptySlots,
          (i) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            child: _EmptySlot(
              index: tasks.length + i + 1,
              onTap: state.atTaskCap ? null : () => _openAddSheet(context),
            ),
          ),
        ),
        if (tasks.isEmpty && !state.isLoading)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: Text(
              '5 empty slots. Pick the ones that matter.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ),
        if (!state.atTaskCap && tasks.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: OutlinedButton.icon(
              onPressed: () => _openAddSheet(context),
              icon: const Icon(Icons.add, size: 18),
              label: Text('Add link (${tasks.length}/5)'),
            ),
          ),
        if (state.atTaskCap)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                '5/5 — complete a task to free a slot',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _EmptySlot extends StatelessWidget {
  const _EmptySlot({required this.index, this.onTap});

  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(
          color: AppColors.borderStrong,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border, width: 1.5),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  onTap == null ? 'Slot $index' : 'Tap to add link $index',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textFaint,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (onTap != null)
                Icon(Icons.add, size: 18, color: AppColors.textFaint),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskSlot extends StatelessWidget {
  const _TaskSlot({
    required this.task,
    this.hasReminder = false,
    this.onToggle,
    required this.onDelete,
  });

  final TodoItem task;
  final bool hasReminder;
  final VoidCallback? onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDone = task.isDone;

    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.danger.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.delete_outline, color: AppColors.danger),
      ),
      onDismissed: (_) => onDelete(),
      child: Material(
        color: isDone
            ? AppColors.accent.withValues(alpha: 0.07)
            : AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: isDone ? AppColors.border : AppColors.borderStrong,
          ),
        ),
        child: InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                _ChainCheckbox(checked: isDone),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.text,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          decoration:
                              isDone ? TextDecoration.lineThrough : null,
                          color: isDone ? AppColors.textFaint : AppColors.text,
                        ),
                      ),
                      if (task.isCarriedForward) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: AppColors.warning.withValues(alpha: 0.25),
                            ),
                          ),
                          child: Text(
                            'carried forward',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.warning,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (hasReminder && !isDone)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.notifications_active_outlined,
                      size: 18,
                      color: AppColors.accentSoft,
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

class _ChainCheckbox extends StatelessWidget {
  const _ChainCheckbox({required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: checked ? AppColors.accent : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: checked ? AppColors.accent : AppColors.borderStrong,
          width: 1.8,
        ),
        boxShadow: checked
            ? [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.25),
                  blurRadius: 0,
                  spreadRadius: 3,
                ),
              ]
            : null,
      ),
      child: checked
          ? const Icon(Icons.check, size: 14, color: Colors.white)
          : null,
    );
  }
}
