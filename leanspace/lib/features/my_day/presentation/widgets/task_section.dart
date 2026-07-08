import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/haptics.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';
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
      backgroundColor: AppColors.surface,
      builder: (_) => const AddTaskSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(myDayProvider);
    final notifier = ref.read(myDayProvider.notifier);
    final reminders = ref.watch(reminderControllerProvider);
    final reminderNotifier = ref.read(reminderControllerProvider.notifier);
    final theme = Theme.of(context);
    final tasks = state.todayTasks;
    final completed = tasks.where((t) => t.isDone).length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                l10n.tasksHeader,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                l10n.tasksProgressCount('$completed', '${tasks.length}'),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...tasks.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
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
          if (!state.atTaskCap)
            _AddSeedRow(onTap: () => _openAddSheet(context)),
          if (state.atTaskCap)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GlassCard(
                padding: const EdgeInsets.all(14),
                dashed: true,
                child: Row(
                  children: [
                    const Icon(
                      Icons.lock_clock_rounded,
                      color: AppColors.tertiary,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        l10n.tasksCapReached,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (tasks.isEmpty && !state.isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                l10n.tasksEmptyCta,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AddSeedRow extends StatelessWidget {
  const _AddSeedRow({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.outlineVariant,
              width: 1.2,
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_rounded, color: AppColors.primary, size: 18),
              const SizedBox(width: 8),
              Text(
                l10n.tasksAddSeed,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
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
    final notes = (task.notes ?? '').trim();
    final hasNotes = notes.isNotEmpty;

    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(Icons.delete_outline, color: AppColors.error),
      ),
      onDismissed: (_) => onDelete(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isDone
              ? AppColors.primaryContainer.withValues(alpha: 0.18)
              : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isDone
                ? AppColors.primaryContainer.withValues(alpha: 0.4)
                : AppColors.outlineVariant,
            width: 0.6,
          ),
        ),
        child: InkWell(
          onTap: onToggle,
          onLongPress: hasNotes ? () => _openNotesSheet(context, task) : null,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: _SeedCheckbox(checked: isDone),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (task.priority != null) ...[
                            Padding(
                              padding: const EdgeInsets.only(top: 6, right: 8),
                              child: _PriorityDot(
                                priority: task.priority!,
                              ),
                            ),
                          ],
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.text,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    decoration: isDone
                                        ? TextDecoration.lineThrough
                                        : null,
                                    color: isDone
                                        ? AppColors.onSurfaceVariant
                                        : AppColors.onSurface,
                                  ),
                                ),
                                if (task.priority != null) ...[
                                  const SizedBox(height: 4),
                                  _PriorityChip(priority: task.priority!),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (hasReminder) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.notifications_active_rounded,
                              size: 12,
                              color: AppColors.tertiary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              AppLocalizations.of(context).myDayReminderSet,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: AppColors.tertiary,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (hasNotes) ...[
                        const SizedBox(height: 6),
                        _NotesPreview(notes: notes),
                      ],
                    ],
                  ),
                ),
                Icon(
                  Icons.drag_indicator_rounded,
                  color: AppColors.outlineVariant,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openNotesSheet(BuildContext context, TodoItem task) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => _NotesSheet(task: task),
    );
  }
}

class _NotesPreview extends StatefulWidget {
  const _NotesPreview({required this.notes});
  final String notes;

  @override
  State<_NotesPreview> createState() => _NotesPreviewState();
}

class _NotesPreviewState extends State<_NotesPreview> {
  bool _expanded = false;
  static const int _collapseThreshold = 90;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final longNotes = widget.notes.length > _collapseThreshold;
    final shown = (_expanded || !longNotes)
        ? widget.notes
        : '${widget.notes.substring(0, _collapseThreshold).trimRight()}…';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 3),
              child: Icon(
                Icons.sticky_note_2_outlined,
                size: 13,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                shown,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
        if (longNotes)
          Padding(
            padding: const EdgeInsets.only(left: 19, top: 2),
            child: GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Text(
                _expanded ? l10n.commonShowLess : l10n.commonViewFull,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _NotesSheet extends StatelessWidget {
  const _NotesSheet({required this.task});
  final TodoItem task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.35,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.outline,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                task.text,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context).myDayPreparationNotes,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Text(
                    task.notes ?? '',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.onSurface,
                      height: 1.55,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PriorityDot extends StatelessWidget {
  const _PriorityDot({required this.priority});
  final TodoPriority priority;

  @override
  Widget build(BuildContext context) {
    final color = switch (priority) {
      TodoPriority.standard => AppColors.outline,
      TodoPriority.vital => AppColors.secondary,
      TodoPriority.spark => AppColors.tertiary,
    };
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.45),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}

/// Tiny pill that shows the priority label (Standard / Vital / Spark)
/// under the task text so the user can see what they picked.
class _PriorityChip extends StatelessWidget {
  const _PriorityChip({required this.priority});
  final TodoPriority priority;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final color = switch (priority) {
      TodoPriority.standard => AppColors.outline,
      TodoPriority.vital => AppColors.secondary,
      TodoPriority.spark => AppColors.tertiary,
    };
    final icon = switch (priority) {
      TodoPriority.standard => Icons.eco_rounded,
      TodoPriority.vital => Icons.local_fire_department_rounded,
      TodoPriority.spark => Icons.auto_awesome_rounded,
    };
    final label = switch (priority) {
      TodoPriority.standard => l10n.priorityStandard,
      TodoPriority.vital => l10n.priorityVital,
      TodoPriority.spark => l10n.prioritySpark,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 9.5,
              letterSpacing: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _SeedCheckbox extends StatelessWidget {
  const _SeedCheckbox({required this.checked});
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: checked ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: checked ? AppColors.primary : AppColors.outline,
          width: 1.8,
        ),
        boxShadow: checked
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: checked
          ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
          : null,
    );
  }
}
