import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/ambient_background.dart';
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
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.habit?.name ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      setState(() => _error = 'Enter a habit name');
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
          );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      setState(() => _error = 'Could not save habit');
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
    final bottom = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SheetHandle(),
          Text(
            widget.habit == null ? 'New daily habit' : 'Edit habit',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'One tap a day keeps the chain alive.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            maxLength: 80,
            decoration: const InputDecoration(
              hintText: 'e.g. Read 10 pages',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
          if (widget.habit != null) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: _saving ? null : _delete,
              child: const Text('Delete habit'),
            ),
          ],
        ],
      ),
    );
  }
}
