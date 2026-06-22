import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

/// Product identifiers as defined in the Google Play Console.
abstract final class ProProducts {
  static const monthly = 'leanspace_pro_monthly';
  static const yearly = 'leanspace_pro_yearly';

  static const all = <String>{monthly, yearly};
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

  Future<List<ProductDetails>> loadProducts() async {
    final response = await _iap.queryProductDetails(ProProducts.all);
    return response.productDetails;
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
