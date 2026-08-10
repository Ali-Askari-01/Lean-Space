import '../../../core/local_date.dart';
import '../../../services/api_client.dart';

class StreakFreezeRepository {
  StreakFreezeRepository(this._api);

  final ApiClient _api;

  Future<List<DateTime>> fetchFrozenDates() async {
    final data = await _api.get('/api/streak-freezes');
    final list = data['results'] as List? ?? data.values.first as List? ?? [];

    return (list as List)
        .map((row) =>
            LocalDate.parseIsoDate(row['frozen_date'] as String?))
        .where((date) => date != null)
        .cast<DateTime>()
        .toList();
  }

  Future<int> freezesUsedThisMonth() async {
    final today = LocalDate.today;
    final monthStart = DateTime(today.year, today.month, 1);
    final monthStartStr = LocalDate.toIsoDate(monthStart);

    final data = await _api.get('/api/streak-freezes');
    final list = data['results'] as List? ?? data.values.first as List? ?? [];
    int count = 0;
    for (final row in list as List) {
      final date = row['frozen_date'] as String?;
      if (date != null && date.compareTo(monthStartStr) >= 0) count++;
    }
    return count;
  }

  Future<void> useFreeze(DateTime date) async {
    await _api.post('/api/streak-freezes/use', {
      'frozen_date': LocalDate.toIsoDate(date),
    });
  }
}
