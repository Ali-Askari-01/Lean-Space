import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/local_date.dart';

class StreakFreezeRepository {
  StreakFreezeRepository(this._client);

  final SupabaseClient _client;

  Future<List<DateTime>> fetchFrozenDates() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return [];

    final data = await _client
        .from('streak_freeze_uses')
        .select('frozen_date')
        .eq('user_id', userId);

    return (data as List)
        .map((row) =>
            LocalDate.parseIsoDate(row['frozen_date'] as String) ?? LocalDate.today)
        .toList();
  }

  Future<int> freezesUsedThisMonth() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return 0;

    final today = LocalDate.today;
    final monthStart = DateTime(today.year, today.month, 1);

    final data = await _client
        .from('streak_freeze_uses')
        .select('id')
        .eq('user_id', userId)
        .gte('frozen_date', LocalDate.toIsoDate(monthStart));

    return (data as List).length;
  }

  Future<void> useFreeze(DateTime date) async {
    await _client.rpc(
      'use_streak_freeze',
      params: {'p_date': LocalDate.toIsoDate(date)},
    );
  }
}
