import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/haptics.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/ambient_background.dart';
import '../../providers/my_day_providers.dart';
import '../../../reminders/providers/reminder_providers.dart';

class AddTaskSheet extends ConsumerStatefulWidget {
  const AddTaskSheet({super.key});

  @override
  ConsumerState<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends ConsumerState<AddTaskSheet> {
  final _controller = TextEditingController();
  bool _saving = false;
  String? _error;
  bool _remindMe = false;
  TimeOfDay _reminderTime = TimeOfDay.now();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DateTime? _reminderDateTime() {
    if (!_remindMe) return null;
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
    final text = _controller.text.trim();
    if (text.isEmpty) {
      setState(() => _error = 'Enter a task');
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });

    final notifier = ref.read(myDayProvider.notifier);
    final message = await notifier.addTask(text);

    if (!mounted) return;
    if (message != null) {
      AppHaptics.blocked();
      setState(() {
        _saving = false;
        _error = message;
      });
      return;
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

    AppHaptics.light();
    if (mounted) Navigator.pop(context);
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
            'Add a link to your chain',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'One clear action. Make it count.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            maxLength: 200,
            decoration: const InputDecoration(
              hintText: 'e.g. Ship the landing page',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            onSubmitted: (_) => _save(),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Remind me'),
            subtitle: _remindMe
                ? Text(_reminderTime.format(context))
                : const Text('Optional task alarm'),
            value: _remindMe,
            onChanged: (v) => setState(() => _remindMe = v),
          ),
          if (_remindMe)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: _pickReminderTime,
                child: const Text('Change time'),
              ),
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
                : const Text('Add to chain'),
          ),
        ],
      ),
    );
  }
}
