import 'package:supabase_flutter/supabase_flutter.dart';

class BuddyState {
  const BuddyState.unpaired()
      : paired = false,
        pairId = null,
        buddyId = null,
        buddyEmail = null,
        sharedStreak = 0,
        youPerfectYesterday = false,
        buddyPerfectYesterday = false,
        buddyMissedYesterday = false;

  const BuddyState.paired({
    required this.pairId,
    required this.buddyId,
    required this.buddyEmail,
    required this.sharedStreak,
    required this.youPerfectYesterday,
    required this.buddyPerfectYesterday,
    required this.buddyMissedYesterday,
  }) : paired = true;

  final bool paired;
  final String? pairId;
  final String? buddyId;
  final String? buddyEmail;
  final int sharedStreak;
  final bool youPerfectYesterday;
  final bool buddyPerfectYesterday;
  final bool buddyMissedYesterday;

  String get buddyDisplayName {
    final email = buddyEmail;
    if (email == null || email.isEmpty) return 'Your buddy';
    final at = email.indexOf('@');
    return at > 0 ? email.substring(0, at) : email;
  }

  factory BuddyState.fromJson(Map<String, dynamic> json) {
    if (json['paired'] != true) return const BuddyState.unpaired();
    return BuddyState.paired(
      pairId: json['pair_id'] as String?,
      buddyId: json['buddy_id'] as String?,
      buddyEmail: json['buddy_email'] as String?,
      sharedStreak: json['shared_streak'] as int? ?? 0,
      youPerfectYesterday: json['you_perfect_yesterday'] as bool? ?? false,
      buddyPerfectYesterday: json['buddy_perfect_yesterday'] as bool? ?? false,
      buddyMissedYesterday: json['buddy_missed_yesterday'] as bool? ?? false,
    );
  }
}

class BuddyRepository {
  BuddyRepository(this._client);

  final SupabaseClient _client;

  Future<BuddyState> fetchState() async {
    final data = await _client.rpc('get_buddy_state');
    if (data is! Map<String, dynamic>) return const BuddyState.unpaired();
    return BuddyState.fromJson(data);
  }

  Future<void> refreshStreak() async {
    await _client.rpc('refresh_buddy_streak');
  }

  Future<String> createInvite() async {
    final jti = await _client.rpc('create_buddy_invite');
    return jti as String;
  }

  Future<void> acceptInvite(String jti) async {
    await _client.rpc('accept_buddy_invite', params: {'p_jti': jti});
  }

  Future<void> unpair() async {
    await _client.rpc('unpair_buddy');
  }

  Future<void> sendNudge() async {
    await _client.rpc('send_buddy_nudge');
  }
}
