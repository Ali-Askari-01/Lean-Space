import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../domain/reminder_prefs.dart';
import '../providers/reminder_providers.dart';

void showReminderSettingsSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.bgElev,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (_) => const ReminderSettingsSheet(),
  );
}

class ReminderSettingsSheet extends ConsumerStatefulWidget {
  const ReminderSettingsSheet({super.key});

  @override
  ConsumerState<ReminderSettingsSheet> createState() =>
      _ReminderSettingsSheetState();
}

class _ReminderSettingsSheetState extends ConsumerState<ReminderSettingsSheet> {
  late ReminderPrefs _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = ref.read(reminderControllerProvider).prefs;
  }

  Future<void> _pickTime({
    required int hour,
    required int minute,
    required void Function(int h, int m) onPicked,
  }) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: hour, minute: minute),
    );
    if (picked != null) {
      setState(() => onPicked(picked.hour, picked.minute));
    }
  }

  Future<void> _save() async {
    final controller = ref.read(reminderControllerProvider.notifier);
    if (_prefs.finalCallEnabled || _prefs.eveningNudgeEnabled) {
      await controller.ensurePermission();
    }
    await controller.updatePrefs(_prefs);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottom = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 16, 24, 24 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          const SizedBox(height: 20),
          Text(
            'Reminders',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Final Call pings you before midnight if tasks are still open.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Final Call'),
            subtitle: Text(
              _formatTime(_prefs.finalCallHour, _prefs.finalCallMinute),
            ),
            value: _prefs.finalCallEnabled,
            onChanged: (v) => setState(
              () => _prefs = _prefs.copyWith(finalCallEnabled: v),
            ),
          ),
          if (_prefs.finalCallEnabled)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => _pickTime(
                  hour: _prefs.finalCallHour,
                  minute: _prefs.finalCallMinute,
                  onPicked: (h, m) => setState(
                    () => _prefs = _prefs.copyWith(
                      finalCallHour: h,
                      finalCallMinute: m,
                    ),
                  ),
                ),
                child: const Text('Change time'),
              ),
            ),
          const Divider(),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Evening nudge'),
            subtitle: Text(
              _formatTime(_prefs.eveningNudgeHour, _prefs.eveningNudgeMinute),
            ),
            value: _prefs.eveningNudgeEnabled,
            onChanged: (v) => setState(
              () => _prefs = _prefs.copyWith(eveningNudgeEnabled: v),
            ),
          ),
          if (_prefs.eveningNudgeEnabled)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => _pickTime(
                  hour: _prefs.eveningNudgeHour,
                  minute: _prefs.eveningNudgeMinute,
                  onPicked: (h, m) => setState(
                    () => _prefs = _prefs.copyWith(
                      eveningNudgeHour: h,
                      eveningNudgeMinute: m,
                    ),
                  ),
                ),
                child: const Text('Change time'),
              ),
            ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _save,
            child: const Text('Save reminders'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int hour, int minute) {
    final period = hour >= 12 ? 'PM' : 'AM';
    final h = hour % 12 == 0 ? 12 : hour % 12;
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m $period';
  }
}
