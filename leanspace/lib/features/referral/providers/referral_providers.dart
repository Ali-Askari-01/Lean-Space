import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/service_providers.dart';
import '../data/referral_store.dart';

class ReferralStats {
  const ReferralStats({
    this.code = '',
    this.referralCount = 0,
    this.milestone = 5,
    this.progress = 0,
    this.rewardsEarned = 0,
    this.nextRewardAt = 5,
    this.isLoading = true,
    this.error,
  });

  final String code;
  final int referralCount;
  final int milestone;
  final int progress;
  final int rewardsEarned;
  final int nextRewardAt;
  final bool isLoading;
  final String? error;

  int get remainingToReward {
    if (progress == 0 && referralCount > 0) return 0;
    return milestone - progress;
  }

  ReferralStats copyWith({
    String? code,
    int? referralCount,
    int? milestone,
    int? progress,
    int? rewardsEarned,
    int? nextRewardAt,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return ReferralStats(
      code: code ?? this.code,
      referralCount: referralCount ?? this.referralCount,
      milestone: milestone ?? this.milestone,
      progress: progress ?? this.progress,
      rewardsEarned: rewardsEarned ?? this.rewardsEarned,
      nextRewardAt: nextRewardAt ?? this.nextRewardAt,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }

  factory ReferralStats.fromJson(Map<String, dynamic> json) {
    return ReferralStats(
      code: json['code'] as String? ?? '',
      referralCount: json['referral_count'] as int? ?? 0,
      milestone: json['milestone'] as int? ?? 5,
      progress: json['progress'] as int? ?? 0,
      rewardsEarned: json['rewards_earned'] as int? ?? 0,
      nextRewardAt: json['next_reward_at'] as int? ?? 5,
      isLoading: false,
    );
  }
}

class ReferralController extends Notifier<ReferralStats> {
  @override
  ReferralStats build() {
    Future.microtask(refresh);
    return const ReferralStats();
  }

  Future<void> refresh() async {
    final api = ref.read(apiClientProvider);
    final userId = api.currentUserId;
    if (userId == null) {
      state = const ReferralStats(isLoading: false);
      return;
    }

    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final raw = await api.post('/api/referrals/stats');
      final map = Map<String, dynamic>.from(raw as Map);
      state = ReferralStats.fromJson(map);
    } catch (e) {
      debugPrint('referral: refresh failed: $e');
      state = state.copyWith(
        isLoading: false,
        error: 'Could not load referral progress.',
      );
    }
  }

  Future<String?> applyCode(String code) async {
    final api = ref.read(apiClientProvider);
    try {
      await api.post('/api/referrals/apply', {'code': code.trim()});
      await ReferralStore.clearPending();
      return null;
    } catch (e) {
      debugPrint('referral: apply failed: $e');
      final msg = e.toString();
      if (msg.contains('referral_code_not_found')) {
        return 'That referral code was not found.';
      }
      if (msg.contains('cannot_refer_yourself')) {
        return 'You cannot use your own referral code.';
      }
      if (msg.contains('already_referred')) {
        return 'You have already used a referral code.';
      }
      return 'Could not apply referral code. Try again.';
    }
  }

  /// Applies a code saved before sign-in, if any.
  Future<void> applyPendingIfAny() async {
    final pending = await ReferralStore.readPending();
    if (pending == null || pending.isEmpty) return;
    final err = await applyCode(pending);
    if (err == null) {
      await refresh();
    }
  }
}

final referralControllerProvider =
    NotifierProvider<ReferralController, ReferralStats>(
  ReferralController.new,
);
