/// User-configurable reminder schedule.
class ReminderPrefs {
  const ReminderPrefs({
    this.finalCallEnabled = true,
    this.finalCallHour = 23,
    this.finalCallMinute = 0,
    this.eveningNudgeEnabled = false,
    this.eveningNudgeHour = 20,
    this.eveningNudgeMinute = 0,
  });

  final bool finalCallEnabled;
  final int finalCallHour;
  final int finalCallMinute;
  final bool eveningNudgeEnabled;
  final int eveningNudgeHour;
  final int eveningNudgeMinute;

  ReminderPrefs copyWith({
    bool? finalCallEnabled,
    int? finalCallHour,
    int? finalCallMinute,
    bool? eveningNudgeEnabled,
    int? eveningNudgeHour,
    int? eveningNudgeMinute,
  }) {
    return ReminderPrefs(
      finalCallEnabled: finalCallEnabled ?? this.finalCallEnabled,
      finalCallHour: finalCallHour ?? this.finalCallHour,
      finalCallMinute: finalCallMinute ?? this.finalCallMinute,
      eveningNudgeEnabled: eveningNudgeEnabled ?? this.eveningNudgeEnabled,
      eveningNudgeHour: eveningNudgeHour ?? this.eveningNudgeHour,
      eveningNudgeMinute: eveningNudgeMinute ?? this.eveningNudgeMinute,
    );
  }

  Map<String, dynamic> toJson() => {
        'finalCallEnabled': finalCallEnabled,
        'finalCallHour': finalCallHour,
        'finalCallMinute': finalCallMinute,
        'eveningNudgeEnabled': eveningNudgeEnabled,
        'eveningNudgeHour': eveningNudgeHour,
        'eveningNudgeMinute': eveningNudgeMinute,
      };

  factory ReminderPrefs.fromJson(Map<String, dynamic> json) {
    return ReminderPrefs(
      finalCallEnabled: json['finalCallEnabled'] as bool? ?? true,
      finalCallHour: json['finalCallHour'] as int? ?? 23,
      finalCallMinute: json['finalCallMinute'] as int? ?? 0,
      eveningNudgeEnabled: json['eveningNudgeEnabled'] as bool? ?? false,
      eveningNudgeHour: json['eveningNudgeHour'] as int? ?? 20,
      eveningNudgeMinute: json['eveningNudgeMinute'] as int? ?? 0,
    );
  }
}

class TaskReminder {
  const TaskReminder({
    required this.taskId,
    required this.at,
    required this.label,
  });

  final String taskId;
  final DateTime at;
  final String label;
}
