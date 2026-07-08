import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/haptics.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';
import '../../../../core/widgets/guardian_mascot.dart';
import '../../../../core/widgets/intention_quotes.dart';
import '../../domain/todo_item.dart';
import '../../providers/my_day_providers.dart';
import '../../../reminders/providers/reminder_providers.dart';

enum SeedType { task, habit }

class AddTaskSheet extends ConsumerStatefulWidget {
  const AddTaskSheet({super.key, this.initialType = SeedType.task});

  /// Lets callers pre-select a tab (e.g. when opened from a habit row).
  final SeedType initialType;

  @override
  ConsumerState<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends ConsumerState<AddTaskSheet> {
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  bool _saving = false;
  String? _error;
  TimeOfDay _reminderTime = TimeOfDay.now();
  HabitElement _element = HabitElement.water;
  TodoPriority _priority = TodoPriority.standard;
  String _cadence = 'Daily';
  late SeedType _type = widget.initialType;
  late final _quote = IntentionQuotes.pick();

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  DateTime? _reminderDateTime() {
    if (_type != SeedType.task) return null;
    final now = DateTime.now();
    var scheduled = DateTime(
      now.year,
      now.month,
      now.day,
      _reminderTime.hour,
      _reminderTime.minute,
    );
    if (!scheduled.isAfter(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  Future<void> _pickReminderTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );
    if (picked != null) {
      setState(() => _reminderTime = picked);
    }
  }

  Future<void> _save() async {
    final text = _nameController.text.trim();
    if (text.isEmpty) {
      setState(() => _error =
          _type == SeedType.task ? 'Name your intention' : 'Name your sprout');
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });

    final notifier = ref.read(myDayProvider.notifier);

    if (_type == SeedType.task) {
      final notes = _notesController.text.trim();
      final result = await notifier.addTask(
        text,
        notes: notes.isEmpty ? null : notes,
        priority: _priority,
      );
      if (!mounted) return;
      if (!result.ok) {
        AppHaptics.blocked();
        setState(() {
          _saving = false;
          _error = result.error;
        });
        return;
      }

      // Notes/priority silently dropped because the DB columns don't
      // exist yet (migration not applied). Let the user know instead of
      // making them think it saved.
      if (result.notesDropped) {
        final messenger = ScaffoldMessenger.maybeOf(context);
        messenger?.showSnackBar(
          const SnackBar(
            content: Text(
              'Task saved. Notes & priority need the latest Supabase migration '
              '— run supabase/migrations/20260701000000_todos_notes_priority.sql.',
            ),
            duration: Duration(seconds: 5),
          ),
        );
      }

      final reminderAt = _reminderDateTime();
      if (reminderAt != null) {
        final task = notifier.consumeLastAddedTask();
        if (task != null) {
          final reminders = ref.read(reminderControllerProvider.notifier);
          await reminders.ensurePermission();
          await reminders.setTaskReminder(
            taskId: task.id,
            at: reminderAt,
            label: text,
          );
        }
      }
    } else {
      // Find the first empty slot — `habitSlots.length` is always 5 (the
      // list size), not the number of empty slots.
      final slots = ref.read(myDayProvider).habitSlots;
      final emptyIndex = slots.indexWhere((h) => h == null);
      if (emptyIndex == -1) {
        if (!mounted) return;
        AppHaptics.blocked();
        setState(() {
          _saving = false;
          _error = 'No empty sprout slots — tend one first.';
        });
        return;
      }
      try {
        await notifier.saveHabit(
          name: text,
          slotIndex: emptyIndex,
          notes: _notesController.text.trim(),
        );
      } catch (e) {
        if (!mounted) return;
        setState(() {
          _saving = false;
          _error = 'Could not save sprout — try again.';
        });
        return;
      }
    }

    AppHaptics.light();
    if (mounted) Navigator.pop(context);
  }

  void _showElementInfo() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => const _ElementInfoSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final isTask = _type == SeedType.task;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 4, 20, 24 + bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded),
                color: AppColors.onSurfaceVariant,
              ),
              Expanded(
                child: Text(
                  isTask ? 'Grow Something' : 'Plant a Sprout',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isTask ? Icons.eco_rounded : Icons.spa_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _SeedTypeToggle(
            value: _type,
            onChanged: (t) => setState(() {
              _type = t;
              _error = null;
            }),
          ),          const SizedBox(height: 18),
          GlassCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GuardianMascot(
                  size: 64,
                  expression: GuardianExpression.happy,
                  withHalo: true,
                  variant: GuardianMascotVariant.koalaBasic,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 280),
                        child: Text(
                          '"${_quote.title}"',
                          key: ValueKey(_quote.title),
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 280),
                        child: Text(
                          _quote.body,
                          key: ValueKey(_quote.body),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          BlueprintLabel(
            isTask ? 'INTENTION NAME' : 'SPROUT NAME',
            color: AppColors.primary,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _nameController,
            maxLength: isTask ? 200 : 80,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: isTask
                  ? 'e.g., Morning Sun Salutation'
                  : 'e.g. Morning Yoga',
              counterText: '',
            ),
            onSubmitted: (_) => _save(),
          ),
          const SizedBox(height: 16),
          if (isTask) ...[
            Row(
              children: [
                Expanded(
                  child: _FieldColumn(
                    label: 'WHEN?',
                    child: GestureDetector(
                      onTap: _pickReminderTime,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              size: 16,
                              color: AppColors.tertiary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _reminderTime.format(context),
                              style: theme.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _FieldColumn(
                    label: 'PRIORITY',
                    child: _PriorityDropdown(
                      value: _priority,
                      onChanged: (p) => setState(() => _priority = p),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ] else ...[
            BlueprintLabel('CADENCE', color: AppColors.primary),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: ['Daily', 'Weekdays', '3x/week', 'Weekly'].map((c) {
                final selected = _cadence == c;
                return ChoiceChip(
                  label: Text(c),
                  selected: selected,
                  onSelected: (_) => setState(() => _cadence = c),
                  selectedColor: AppColors.primaryContainer,
                  backgroundColor: AppColors.surfaceContainerLow,
                  labelStyle: theme.textTheme.labelMedium?.copyWith(
                    color: selected
                        ? AppColors.onPrimaryContainer
                        : AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                  side: BorderSide(
                    color: selected
                        ? AppColors.primary
                        : AppColors.outlineVariant,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
          BlueprintLabel(
            isTask ? 'PREPARATION NOTES' : 'TENDING NOTES',
            color: AppColors.primary,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _notesController,
            maxLines: 3,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: isTask
                  ? 'Any tools or mindset tips for this task?'
                  : 'What does tending this sprout look like?',
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              BlueprintLabel('CHOOSE ELEMENT', color: AppColors.primary),
              const SizedBox(width: 6),
              InkWell(
                onTap: _showElementInfo,
                customBorder: const CircleBorder(),
                child: Tooltip(
                  message: 'What do the elements mean?',
                  child: Container(
                    width: 22,
                    height: 22,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.info_outline_rounded,
                      size: 14,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: HabitElement.values.map((e) {
              return _ElementChoice(
                element: e,
                selected: _element == e,
                onTap: () => setState(() => _element = e),
              );
            }).toList(),
          ),
          if (_error != null) ...[
            const SizedBox(height: 14),
            Text(
              _error!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: CtaPill(
                  label: _saving
                      ? 'Planting…'
                      : isTask
                          ? 'Plant Intention'
                          : 'Plant Sprout',
                  icon: _saving ? null : Icons.auto_awesome_rounded,
                  onPressed: _saving ? null : _save,
                ),
              ),
              const SizedBox(width: 10),
              Material(
                color: AppColors.surfaceContainerHigh,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: _saving
                      ? null
                      : () {
                          setState(() {
                            _nameController.clear();
                            _notesController.clear();
                            _reminderTime = TimeOfDay.now();
                            _priority = TodoPriority.standard;
                            _element = HabitElement.water;
                            _cadence = 'Daily';
                            _error = null;
                          });
                          AppHaptics.light();
                        },
                  child: const Tooltip(
                    message: 'Clear form',
                    child: SizedBox(
                      width: 52,
                      height: 52,
                      child: Icon(
                        Icons.refresh_rounded,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SeedTypeToggle extends StatelessWidget {
  const _SeedTypeToggle({required this.value, required this.onChanged});

  final SeedType value;
  final ValueChanged<SeedType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.outlineVariant, width: 0.5),
      ),
      child: Row(
        children: [
          _ToggleSegment(
            label: 'Task Seed',
            icon: Icons.eco_rounded,
            selected: value == SeedType.task,
            onTap: () => onChanged(SeedType.task),
          ),
          _ToggleSegment(
            label: 'Habit Sprout',
            icon: Icons.spa_rounded,
            selected: value == SeedType.habit,
            onTap: () => onChanged(SeedType.habit),
          ),
        ],
      ),
    );
  }
}

class _ToggleSegment extends StatelessWidget {
  const _ToggleSegment({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(999),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.primaryContainer.withValues(alpha: 0.45)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: selected
                      ? AppColors.primary
                      : AppColors.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: selected
                        ? AppColors.primary
                        : AppColors.onSurfaceVariant,
                    fontWeight:
                        selected ? FontWeight.w800 : FontWeight.w600,
                    letterSpacing: 0.2,
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

class _FieldColumn extends StatelessWidget {
  const _FieldColumn({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlueprintLabel(label, color: AppColors.onSurfaceVariant),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

class _PriorityDropdown extends StatelessWidget {
  const _PriorityDropdown({
    required this.value,
    required this.onChanged,
  });

  final TodoPriority value;
  final ValueChanged<TodoPriority> onChanged;

  Color _swatch(TodoPriority p) => switch (p) {
        TodoPriority.standard => AppColors.outline,
        TodoPriority.vital => AppColors.secondary,
        TodoPriority.spark => AppColors.tertiary,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TodoPriority>(
          isExpanded: true,
          value: value,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.tertiary,
          ),
          selectedItemBuilder: (context) => TodoPriority.values
              .map(
                (p) => Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _swatch(p),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(p.label, style: theme.textTheme.bodyLarge),
                  ],
                ),
              )
              .toList(),
          items: TodoPriority.values
              .map(
                (p) => DropdownMenuItem<TodoPriority>(
                  value: p,
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _swatch(p),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(p.label),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (p) {
            if (p != null) onChanged(p);
          },
        ),
      ),
    );
  }
}

class _ElementChoice extends StatelessWidget {
  const _ElementChoice({
    required this.element,
    required this.selected,
    required this.onTap,
  });

  final HabitElement element;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = element.label.toUpperCase();
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ElementIcon(element: element, size: 52, selected: selected),
          const SizedBox(height: 6),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: selected
                  ? AppColors.onSurface
                  : AppColors.onSurfaceVariant,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              letterSpacing: 0.8,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _ElementInfoSheet extends StatelessWidget {
  const _ElementInfoSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return SafeArea(
          top: false,
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
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
                'Pick the right element',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Each element maps to a different kind of effort. The Guardian grows stronger when you water the right one.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              for (final e in HabitElement.values)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ElementInfoCard(element: e),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ElementInfoCard extends StatelessWidget {
  const _ElementInfoCard({required this.element});
  final HabitElement element;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GlassCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElementIcon(element: element, size: 48, selected: true),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element.label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  element.tagline,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurface,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  element.whenToUse,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
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
