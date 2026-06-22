import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../router/app_router.dart';
import '../data/streak_freeze_repository.dart';

final streakFreezeRepositoryProvider = Provider<StreakFreezeRepository>((ref) {
  return StreakFreezeRepository(ref.watch(supabaseClientProvider));
});

class StreakFreezeState {
  const StreakFreezeState({
    this.frozenDates = const [],
    this.freezesUsedThisMonth = 0,
    this.isLoading = true,
  });

  final List<DateTime> frozenDates;
  final int freezesUsedThisMonth;
  final bool isLoading;

  bool get canUseFreeze => freezesUsedThisMonth < 1;

  StreakFreezeState copyWith({
    List<DateTime>? frozenDates,
    int? freezesUsedThisMonth,
    bool? isLoading,
  }) {
    return StreakFreezeState(
      frozenDates: frozenDates ?? this.frozenDates,
      freezesUsedThisMonth: freezesUsedThisMonth ?? this.freezesUsedThisMonth,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class StreakFreezeController extends StateNotifier<StreakFreezeState> {
  StreakFreezeController(this._repo) : super(const StreakFreezeState()) {
    refresh();
  }

  final StreakFreezeRepository _repo;

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true);
    try {
      final results = await Future.wait([
        _repo.fetchFrozenDates(),
        _repo.freezesUsedThisMonth(),
      ]);
      state = StreakFreezeState(
        frozenDates: results[0] as List<DateTime>,
        freezesUsedThisMonth: results[1] as int,
        isLoading: false,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<String?> freezeDate(DateTime date) async {
    try {
      await _repo.useFreeze(date);
      await refresh();
      return null;
    } on PostgrestException catch (e) {
      return _mapError(e.message);
    } catch (_) {
      return 'Could not use streak freeze.';
    }
  }

  String _mapError(String message) {
    if (message.contains('freeze_limit_reached')) {
      return 'You already used your freeze this month.';
    }
    if (message.contains('no_missed_tasks')) {
      return 'No missed tasks on that day to freeze.';
    }
    if (message.contains('freeze_future_date')) {
      return 'You can only freeze a past day.';
    }
    return 'Could not use streak freeze.';
  }
}

final streakFreezeProvider =
    StateNotifierProvider<StreakFreezeController, StreakFreezeState>((ref) {
  return StreakFreezeController(ref.watch(streakFreezeRepositoryProvider));
});
