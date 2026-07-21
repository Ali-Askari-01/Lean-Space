import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';
import '../../domain/habit.dart';
import '../../providers/my_day_providers.dart';

class AddHabitSheet extends ConsumerStatefulWidget {
  const AddHabitSheet({
    super.key,
    required this.slotIndex,
    this.habit,
  });

  final int slotIndex;
  final Habit? habit;

  @override
  ConsumerState<AddHabitSheet> createState() => _AddHabitSheetState();
}

class _AddHabitSheetState extends ConsumerState<AddHabitSheet> {
  late final TextEditingController _controller;
  late final TextEditingController _notesController;
  bool _saving = false;
  String? _error;
  HabitElement _element = HabitElement.water;
  String _cadence = 'Daily';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.habit?.name ?? '');
    _notesController = TextEditingController(text: widget.habit?.notes ?? '');
    if (widget.habit != null) {
      _cadence = widget.habit!.cadenceLabel;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      setState(() => _error = AppLocalizations.of(context).addTaskNameSproutError);
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });

    try {
      await ref.read(myDayProvider.notifier).saveHabit(
            name: name,
            slotIndex: widget.slotIndex,
            existingId: widget.habit?.id,
            notes: _notesController.text.trim(),
          );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      setState(() => _error = AppLocalizations.of(context).addTaskSaveSproutError);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _delete() async {
    final habit = widget.habit;
    if (habit == null) return;

    setState(() => _saving = true);
    try {
      await ref.read(myDayProvider.notifier).deleteHabit(habit.id);
      if (mounted) Navigator.pop(context);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final bottom = MediaQuery.viewInsetsOf(context).bottom;

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
                  widget.habit == null
                      ? l10n.addHabitTitleNew
                      : l10n.addHabitTitleEdit,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          BlueprintLabel(l10n.addTaskSproutName, color: AppColors.primary),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            maxLength: 80,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: l10n.addTaskHintHabit,
              counterText: '',
            ),
          ),
          const SizedBox(height: 18),
          BlueprintLabel(l10n.addTaskCadenceLabel, color: AppColors.primary),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              l10n.addTaskCadenceDaily,
              l10n.addTaskCadenceWeekdays,
              l10n.addTaskCadence3x,
              l10n.addTaskCadenceWeekly,
            ].map((c) {
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
          const SizedBox(height: 18),
          BlueprintLabel(l10n.addTaskTendingNotes, color: AppColors.primary),
          const SizedBox(height: 8),
          TextField(
            controller: _notesController,
            maxLines: 3,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: l10n.addTaskNotesHintHabit,
            ),
          ),
          const SizedBox(height: 18),
          BlueprintLabel(l10n.addTaskChooseElement, color: AppColors.primary),
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
                  label: _saving ? l10n.addTaskPlanting : l10n.addTaskPlantSproutCta,
                  icon: _saving ? null : Icons.eco_rounded,
                  onPressed: _saving ? null : _save,
                ),
              ),
              if (widget.habit != null) ...[
                const SizedBox(width: 12),
                Material(
                  color: AppColors.surfaceContainerHigh,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: _saving ? null : _delete,
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
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
    final l10n = AppLocalizations.of(context);
    final label = switch (element) {
      HabitElement.water => l10n.addTaskElementWater,
      HabitElement.light => l10n.addTaskElementLight,
      HabitElement.soil => l10n.addTaskElementSoil,
      HabitElement.breeze => l10n.addTaskElementBreeze,
    };
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ElementIcon(element: element, size: 48, selected: selected),
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
