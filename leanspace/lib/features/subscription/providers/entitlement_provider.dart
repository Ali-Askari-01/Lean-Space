import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/feature_flags.dart';
import '../../../router/app_router.dart';

enum Tier { free, pro }

class Entitlement {
  const Entitlement({
    this.tier = Tier.free,
    this.isLoading = true,
    this.proUntil,
  });

  final Tier tier;
  final bool isLoading;
  final DateTime? proUntil;

  bool get isPro => FeatureFlags.unlockAllFeatures || tier == Tier.pro;

  /// How many habit slots are usable on this tier. Free sees 3 of the 5 slots.
  int get habitSlotLimit => isPro ? 5 : 3;

  /// History window (in days) for Left Behind and insights. Free is capped.
  int? get historyWindowDays => isPro ? null : 7;

  Entitlement copyWith({Tier? tier, bool? isLoading, DateTime? proUntil}) {
    return Entitlement(
      tier: tier ?? this.tier,
      isLoading: isLoading ?? this.isLoading,
      proUntil: proUntil ?? this.proUntil,
    );
  }
}

class EntitlementNotifier extends StateNotifier<Entitlement> {
  EntitlementNotifier(this._client) : super(const Entitlement()) {
    refresh();
  }

  final SupabaseClient _client;

  Future<void> refresh() async {
    if (FeatureFlags.unlockAllFeatures) {
      state = const Entitlement(tier: Tier.pro, isLoading: false);
      return;
    }

    final userId = _client.auth.currentUser?.id;
    if (userId == null) {
      state = const Entitlement(tier: Tier.free, isLoading: false);
      return;
    }

    try {
      final row = await _client
          .from('users')
          .select('tier, pro_until')
          .eq('id', userId)
          .maybeSingle();

      final tierStr = row?['tier'] as String? ?? 'free';
      final proUntilStr = row?['pro_until'] as String?;
      state = Entitlement(
        tier: tierStr == 'pro' ? Tier.pro : Tier.free,
        isLoading: false,
        proUntil: proUntilStr != null ? DateTime.tryParse(proUntilStr) : null,
      );
    } catch (e) {
      debugPrint('entitlement: refresh failed: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  /// Optimistically flips local tier after a verified purchase. The server
  /// webhook remains the source of truth and will reconcile on next refresh.
  void setProOptimistic({DateTime? until}) {
    state = state.copyWith(tier: Tier.pro, isLoading: false, proUntil: until);
  }
}

final entitlementProvider =
    StateNotifierProvider<EntitlementNotifier, Entitlement>((ref) {
  return EntitlementNotifier(ref.watch(supabaseClientProvider));
});
