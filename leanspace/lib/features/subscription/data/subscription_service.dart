import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

/// Product identifiers as defined in the Google Play Console.
abstract final class ProProducts {
  static const monthly = 'leanspace_pro_monthly';
  static const yearly = 'leanspace_pro_yearly';

  static const all = <String>{monthly, yearly};
}

class ProductQueryResult {
  const ProductQueryResult({
    required this.products,
    this.notFoundIds = const [],
    this.errorMessage,
  });

  final List<ProductDetails> products;
  final List<String> notFoundIds;
  final String? errorMessage;

  bool get hasMonthly =>
      products.any((p) => p.id == ProProducts.monthly);
  bool get hasYearly =>
      products.any((p) => p.id == ProProducts.yearly);
}

/// Thin wrapper around [InAppPurchase] so the rest of the app never touches
/// the plugin directly. Verification of receipts is intentionally left to the
/// server-side webhook (see supabase/functions/play-rtdn).
class SubscriptionService {
  SubscriptionService([InAppPurchase? iap])
      : _iap = iap ?? InAppPurchase.instance;

  final InAppPurchase _iap;

  Stream<List<PurchaseDetails>> get purchaseStream => _iap.purchaseStream;

  Future<bool> isAvailable() => _iap.isAvailable();

  Future<ProductQueryResult> loadProducts() async {
    final response = await _iap.queryProductDetails(ProProducts.all);
    return ProductQueryResult(
      products: response.productDetails,
      notFoundIds: response.notFoundIDs.toList(),
      errorMessage: response.error?.message,
    );
  }

  Future<void> buy(ProductDetails product) async {
    final param = PurchaseParam(productDetails: product);
    await _iap.buyNonConsumable(purchaseParam: param);
  }

  Future<void> restore() => _iap.restorePurchases();

  Future<void> complete(PurchaseDetails purchase) async {
    if (purchase.pendingCompletePurchase) {
      await _iap.completePurchase(purchase);
    }
  }
}
