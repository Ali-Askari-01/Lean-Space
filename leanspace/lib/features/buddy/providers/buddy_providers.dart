import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../router/app_router.dart';
import '../data/buddy_repository.dart';

final buddyRepositoryProvider = Provider<BuddyRepository>((ref) {
  return BuddyRepository(ref.watch(supabaseClientProvider));
});

class BuddyController extends AsyncNotifier<BuddyState> {
  @override
  Future<BuddyState> build() async {
    final repo = ref.watch(buddyRepositoryProvider);
    await repo.refreshStreak();
    return repo.fetchState();
  }

  BuddyRepository get _repo => ref.read(buddyRepositoryProvider);

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.refreshStreak();
      return _repo.fetchState();
    });
  }

  Future<String?> createInvite() async {
    try {
      return await _repo.createInvite();
    } on PostgrestException catch (e) {
      if (e.message.contains('already_paired')) {
        return null;
      }
      rethrow;
    }
  }

  Future<String?> acceptInvite(String code) async {
    try {
      await _repo.acceptInvite(code);
      await refresh();
      return null;
    } on PostgrestException catch (e) {
      return _mapAcceptError(e.message);
    } catch (_) {
      return 'Could not accept invite.';
    }
  }

  Future<String?> unpair() async {
    try {
      await _repo.unpair();
      await refresh();
      return null;
    } catch (_) {
      return 'Could not unpair.';
    }
  }

  Future<String?> sendNudge() async {
    try {
      await _repo.sendNudge();
      return null;
    } on PostgrestException catch (e) {
      if (e.message.contains('nudge_limit')) {
        return 'You already nudged your buddy today.';
      }
      return 'Could not send nudge.';
    } catch (_) {
      return 'Could not send nudge.';
    }
  }

  String _mapAcceptError(String message) {
    if (message.contains('invite_not_found')) return 'Invite not found.';
    if (message.contains('invite_used')) return 'This invite was already used.';
    if (message.contains('invite_expired')) return 'This invite expired.';
    if (message.contains('cannot_pair_self')) return 'You cannot pair with yourself.';
    if (message.contains('already_paired')) {
      return 'You or your buddy is already paired with someone else.';
    }
    return 'Could not accept invite.';
  }
}

final buddyProvider =
    AsyncNotifierProvider<BuddyController, BuddyState>(BuddyController.new);

/// Set when a buddy invite deep link is opened.
final pendingBuddyInviteProvider = StateProvider<String?>((ref) => null);
