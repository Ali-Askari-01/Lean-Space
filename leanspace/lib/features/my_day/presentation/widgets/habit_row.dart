import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/haptics.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';
import '../../../../core/widgets/pop_in.dart';
import '../../../subscription/providers/entitlement_provider.dart';
import '../../domain/habit.dart';
import '../../providers/my_day_providers.dart';
import 'add_habit_sheet.dart';

class HabitRow extends ConsumerWidget {
  const HabitRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myDayProvider);
    final notifier = ref.read(myDayProvider.notifier);
    final slotLimit = ref.watch(entitlementProvider).habitSlotLimit;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...List.generate(5, (index) {
            final habit = state.habitSlots[index];
            final locked = habit == null && index >= slotLimit;
            if (locked) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _LockedHabitRow(
                  onTap: () {
                    AppHaptics.blocked();
                    context.push('/paywall?from=habit_slot');
                  },
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _HabitRowItem(
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
              ),
            );
          }),
          _PlantNewRow(
            onTap: () {
              final firstEmptySlot = state.habitSlots.indexWhere((h) => h == null);
              if (firstEmptySlot == -1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All habit slots are currently full.')),
                );
                return;
              }
              if (firstEmptySlot >= slotLimit) {
                AppHaptics.blocked();
                context.push('/paywall?from=habit_slot');
                return;
              }
              AppHaptics.light();
              _openAddSheet(context, firstEmptySlot, null);
            },
          ),
        ],
      ),
    );
  }

  void _openAddSheet(BuildContext context, int slotIndex, Habit? habit) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      builder: (ctx) => AddHabitSheet(slotIndex: slotIndex, habit: habit),
    );
  }
}

class _PlantNewRow extends StatelessWidget {
  const _PlantNewRow({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_rounded, color: AppColors.primary, size: 18),
              const SizedBox(width: 8),
              Text(
                'Plant a new habit sprout',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LockedHabitRow extends StatelessWidget {
  const _LockedHabitRow({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.tertiary.withValues(alpha: 0.06),
            border: Border.all(
              color: AppColors.tertiary.withValues(alpha: 0.3),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.lock_outline,
                  color: AppColors.tertiary, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Pro habit slot — unlock to plant more sprouts',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.tertiary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.chevron_right_rounded,
                  color: AppColors.tertiary),
            ],
          ),
        ),
      ),
    );
  }
}

class _HabitRowItem extends StatelessWidget {
  const _HabitRowItem({
    required this.habit,
    required this.onTap,
    this.onLongPress,
  });

  final Habit? habit;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  HabitElement _elementFor(Habit h) {
    final n = h.name.toLowerCase();
    if (n.contains('water') || n.contains('drink') || n.contains('hydrat')) {
      return HabitElement.water;
    }
    if (n.contains('sun') ||
        n.contains('light') ||
        n.contains('morning') ||
        n.contains('meditat')) {
      return HabitElement.light;
    }
    if (n.contains('read') || n.contains('write') || n.contains('journal')) {
      return HabitElement.soil;
    }
    if (n.contains('run') ||
        n.contains('walk') ||
        n.contains('breath') ||
        n.contains('wind')) {
      return HabitElement.breeze;
    }
    return HabitElement.water;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEmpty = habit == null;
    final isDone = habit?.isCompletedToday() ?? false;

    if (isEmpty) {
      return Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.outlineVariant,
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: AppColors.outline,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Plant a habit',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.outline,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final element = _elementFor(habit!);
    final notes = (habit!.notes ?? '').trim();
    final hasNotes = notes.isNotEmpty;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isDone
                ? AppColors.primaryContainer.withValues(alpha: 0.18)
                : AppColors.surfaceContainerLow,
            border: Border.all(
              color: isDone
                  ? AppColors.primaryContainer.withValues(alpha: 0.4)
                  : AppColors.outlineVariant,
              width: 0.6,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: ElementIcon(element: element, size: 40, selected: isDone),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            habit!.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: isDone
                                  ? AppColors.onSurfaceVariant
                                  : AppColors.onSurface,
                              decoration:
                                  isDone ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryContainer
                                .withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.local_fire_department_rounded,
                                size: 12,
                                color: AppColors.secondary,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '${habit!.streakCount}d',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      habit!.cadenceLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                        letterSpacing: 0.4,
                      ),
                    ),
                    const SizedBox(height: 6),
                    LiquidProgressBar(
                      value: isDone
                          ? 1.0
                          : (habit!.streakCount / 30).clamp(0.0, 1.0),
                      height: 6,
                    ),
                    if (hasNotes) ...[
                      const SizedBox(height: 8),
                      _HabitNotesPreview(notes: notes),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              PopWhen(
                active: isDone,
                child: Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isDone
                        ? AppColors.primary
                        : AppColors.surfaceContainer,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDone
                          ? AppColors.primary
                          : AppColors.outline,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    isDone
                        ? Icons.check_rounded
                        : Icons.circle_outlined,
                    size: 18,
                    color: isDone
                        ? Colors.white
                        : AppColors.outline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HabitNotesPreview extends StatefulWidget {
  const _HabitNotesPreview({required this.notes});
  final String notes;

  @override
  State<_HabitNotesPreview> createState() => _HabitNotesPreviewState();
}

class _HabitNotesPreviewState extends State<_HabitNotesPreview> {
  bool _expanded = false;
  static const int _collapseThreshold = 90;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            Padding(
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
                _expanded ? 'Show less' : 'View full notes',
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
