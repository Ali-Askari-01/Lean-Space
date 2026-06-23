import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../router/app_router.dart';
import '../data/subscription_service.dart';
import 'entitlement_provider.dart';

final subscriptionServiceProvider = Provider<SubscriptionService>((ref) {
  return SubscriptionService();
});

class SubscriptionState {
  const SubscriptionState({
    this.available = false,
    this.loading = true,
    this.purchasePending = false,
    this.products = const [],
    this.error,
  });

  final bool available;
  final bool loading;
  final bool purchasePending;
  final List<ProductDetails> products;
  final String? error;

  ProductDetails? get monthly => _byId(ProProducts.monthly);
  ProductDetails? get yearly => _byId(ProProducts.yearly);

  ProductDetails? _byId(String id) {
    for (final p in products) {
      if (p.id == id) return p;
    }
    return null;
  }

  SubscriptionState copyWith({
    bool? available,
    bool? loading,
    bool? purchasePending,
    List<ProductDetails>? products,
    String? error,
    bool clearError = false,
  }) {
    return SubscriptionState(
      available: available ?? this.available,
      loading: loading ?? this.loading,
      purchasePending: purchasePending ?? this.purchasePending,
      products: products ?? this.products,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class SubscriptionController extends Notifier<SubscriptionState> {
  StreamSubscription<List<PurchaseDetails>>? _sub;

  @override
  SubscriptionState build() {
    final service = ref.watch(subscriptionServiceProvider);
    _sub?.cancel();
    _sub = service.purchaseStream.listen(
      _onPurchaseUpdates,
      onError: (Object e) =>
          state = state.copyWith(error: 'Purchase failed. Try again.'),
    );
    ref.onDispose(() => _sub?.cancel());
    Future.microtask(_init);
    return const SubscriptionState();
  }

  SubscriptionService get _service => ref.read(subscriptionServiceProvider);

  Future<void> _init() async {
    try {
      final available = await _service.isAvailable();
      if (!available) {
        state = state.copyWith(
          available: false,
          loading: false,
          error: 'In-app purchases are unavailable on this device.',
        );
        return;
      }
      final products = await _service.loadProducts();
      state = state.copyWith(
        available: true,
        loading: false,
        products: products,
      );
    } catch (e) {
      debugPrint('subscription: init failed: $e');
      state = state.copyWith(
        loading: false,
        available: false,
        error: 'Could not load subscription options.',
      );
    }
  }

  Future<void> buy(ProductDetails product) async {
    state = state.copyWith(purchasePending: true, clearError: true);
    try {
      await _service.buy(product);
    } catch (e) {
      state = state.copyWith(
        purchasePending: false,
        error: 'Could not start checkout.',
      );
    }
  }

  Future<void> restore() async {
    state = state.copyWith(purchasePending: true, clearError: true);
    try {
      await _service.restore();
    } catch (_) {
      state = state.copyWith(purchasePending: false);
    }
  }

  Future<void> _onPurchaseUpdates(List<PurchaseDetails> purchases) async {
    for (final purchase in purchases) {
      switch (purchase.status) {
        case PurchaseStatus.pending:
          state = state.copyWith(purchasePending: true);
        case PurchaseStatus.error:
          state = state.copyWith(
            purchasePending: false,
            error: purchase.error?.message ?? 'Purchase failed.',
          );
          await _service.complete(purchase);
        case PurchaseStatus.canceled:
          state = state.copyWith(purchasePending: false);
          await _service.complete(purchase);
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          await _deliver(purchase);
          await _service.complete(purchase);
          state = state.copyWith(purchasePending: false, clearError: true);
      }
    }
  }

  /// Records the purchase so the backend can reconcile, and optimistically
  /// unlocks Pro locally. The Play webhook (server) remains the source of truth.
  Future<void> _deliver(PurchaseDetails purchase) async {
    final client = ref.read(supabaseClientProvider);
    try {
      await client.rpc('record_pro_purchase', params: {
        'p_product_id': purchase.productID,
        'p_purchase_token':
            purchase.verificationData.serverVerificationData,
      });
    } catch (e) {
      debugPrint('subscription: record_pro_purchase failed: $e');
    }
    ref.read(entitlementProvider.notifier).setProOptimistic();
    await ref.read(entitlementProvider.notifier).refresh();
  }
}

final subscriptionControllerProvider =
    NotifierProvider<SubscriptionController, SubscriptionState>(
  SubscriptionController.new,
);
