import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/local_date.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../my_day/domain/todo_item.dart';
import '../../my_day/providers/my_day_providers.dart';
import '../../streak_freeze/providers/streak_freeze_providers.dart';

class LeftBehindScreen extends ConsumerStatefulWidget {
  const LeftBehindScreen({super.key});

  @override
  ConsumerState<LeftBehindScreen> createState() => _LeftBehindScreenState();
}

class _LeftBehindScreenState extends ConsumerState<LeftBehindScreen> {
  bool _dismissingAll = false;

  Future<void> _reAdd(BuildContext context, TodoItem task) async {
    final notifier = ref.read(myDayProvider.notifier);
    final result = await notifier.reAddTask(task);
    if (!context.mounted) return;
    final msg = result ?? '"${task.text}" is back in your day.';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _dismiss(BuildContext context, TodoItem task) async {
    final notifier = ref.read(myDayProvider.notifier);
    final err = await notifier.dismissMissed(task);
    if (!context.mounted) return;
    if (err == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Removed "${task.text}"')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
    }
  }

  Future<void> _dismissAll(BuildContext context) async {
    final state = ref.read(myDayProvider);
    if (state.leftBehind.isEmpty) return;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear all left-behind?'),
        content: Text(
          'This will permanently remove ${state.leftBehind.length} '
          'missed task${state.leftBehind.length == 1 ? '' : 's'}. '
          'You can\'t undo this.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton.tonal(
            style: FilledButton.styleFrom(foregroundColor: AppColors.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Clear all'),
          ),
        ],
      ),
    );
    if (confirm != true || !mounted) return;
    setState(() => _dismissingAll = true);
    final notifier = ref.read(myDayProvider.notifier);
    for (final t in [...state.leftBehind]) {
      await notifier.dismissMissed(t);
    }
    if (!mounted) return;
    setState(() => _dismissingAll = false);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Left-behind cleared')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myDayProvider);
    final freeze = ref.watch(streakFreezeProvider);
    final yesterday = LocalDate.yesterday(LocalDate.today);
    final yesterdayMissed = state.leftBehind.any(
      (t) => LocalDate.isSameDay(t.originalDate, yesterday),
    );
    final yesterdayFrozen = freeze.frozenDates.any(
      (d) => LocalDate.isSameDay(d, yesterday),
    );
    final showFreeze = yesterdayMissed && freeze.canUseFreeze && !yesterdayFrozen;

    // Group by day for clearer display
    final grouped = <DateTime, List<TodoItem>>{};
    for (final t in state.leftBehind) {
      final d = DateTime(t.originalDate.year, t.originalDate.month, t.originalDate.day);
      grouped.putIfAbsent(d, () => []).add(t);
    }
    final groupKeys = grouped.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.onSurfaceVariant,
        ),
        title: const Text('Left Behind'),
        actions: [
          if (state.leftBehind.isNotEmpty)
            TextButton.icon(
              onPressed: _dismissingAll ? null : () => _dismissAll(context),
              icon: const Icon(Icons.delete_sweep_rounded, size: 18),
              label: const Text('Clear all'),
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
            ),
        ],
      ),
      body: AmbientBackground(
        child: state.leftBehind.isEmpty
            ? const _EmptyState()
            : ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                children: [
                  _HeaderCard(
                    count: state.leftBehind.length,
                    yesterdayMissed: yesterdayMissed,
                    canUseFreeze: freeze.canUseFreeze,
                    showFreeze: showFreeze,
                    onUseFreeze: () => _useFreeze(context, yesterday),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'MISSED TASKS',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 10),
                  for (final day in groupKeys) ...[
                    _DayHeader(date: day),
                    const SizedBox(height: 8),
                    for (final task in grouped[day]!) ...[
                      _MissedTile(
                        task: task,
                        onReAdd: () => _reAdd(context, task),
                        onDismiss: () => _dismiss(context, task),
                      ),
                      const SizedBox(height: 8),
                    ],
                    const SizedBox(height: 6),
                  ],
                ],
              ),
      ),
    );
  }

  Future<void> _useFreeze(BuildContext context, DateTime yesterday) async {
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

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.count,
    required this.yesterdayMissed,
    required this.canUseFreeze,
    required this.showFreeze,
    required this.onUseFreeze,
  });

  final int count;
  final bool yesterdayMissed;
  final bool canUseFreeze;
  final bool showFreeze;
  final VoidCallback onUseFreeze;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.secondary.withValues(alpha: 0.10),
            AppColors.tertiary.withValues(alpha: 0.08),
          ],
        ),
        border: Border.all(
          color: AppColors.secondary.withValues(alpha: 0.30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.history_rounded,
                color: AppColors.secondary,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'LEFT BEHIND',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            count == 1
                ? '1 task is waiting for you.'
                : '$count tasks are waiting for you.',
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
              height: 1.15,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Re-add a task to bring it back to today, or let it go. '
            'Re-adding keeps your streak alive.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          if (showFreeze) ...[
            const SizedBox(height: 14),
            OutlinedButton.icon(
              onPressed: onUseFreeze,
              icon: const Icon(Icons.ac_unit_outlined, size: 18),
              label: const Text('Use monthly freeze for yesterday'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.tertiary,
                side: BorderSide(
                  color: AppColors.tertiary.withValues(alpha: 0.4),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({required this.date});
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isYesterday = LocalDate.isSameDay(date, LocalDate.yesterday(LocalDate.today));
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4, bottom: 2),
      child: Text(
        isYesterday
            ? 'Yesterday · ${DateFormat.MMMd().format(date)}'
            : DateFormat('EEEE · MMM d').format(date),
        style: theme.textTheme.labelMedium?.copyWith(
          color: AppColors.onSurface,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _MissedTile extends StatelessWidget {
  const _MissedTile({
    required this.task,
    required this.onReAdd,
    required this.onDismiss,
  });
  final TodoItem task;
  final VoidCallback onReAdd;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant, width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_box_outline_blank_rounded,
              color: AppColors.secondary,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.text,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                if (task.notes != null && task.notes!.trim().isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    task.notes!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: onReAdd,
                        icon: const Icon(Icons.replay_rounded, size: 16),
                        label: const Text('Re-add today'),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding:
                              const EdgeInsets.symmetric(vertical: 8),
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: onDismiss,
                      icon: const Icon(Icons.delete_outline_rounded),
                      color: AppColors.outline,
                      tooltip: 'Let it go',
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surfaceContainerHigh,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.10),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                color: AppColors.primary,
                size: 36,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Nothing left behind',
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.onSurface,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'No missed tasks. Every seed you plant is being '
              'tended. The garden is clean.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
