import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../features/subscription/providers/entitlement_provider.dart';

class AdService {
  AdService._();

  static const _bannerAdUnitId = 'ca-app-pub-1746519728461243/7778435129';

  static BannerAd createBannerAd({
    required AdListener listener,
  }) {
    return BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('Ad loaded: ${ad.responseInfo}');
          listener.onAdLoaded?.call(ad);
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Ad failed to load: ${error.message}');
          ad.dispose();
          listener.onAdFailedToLoad?.call(ad, error);
        },
        onAdOpened: listener.onAdOpened,
        onAdClosed: listener.onAdClosed,
        onAdImpression: listener.onAdImpression,
        onAdClicked: listener.onAdClicked,
      ),
    );
  }

  static bool shouldShowAds(Entitlement entitlement) {
    return !entitlement.isPro;
  }
}

class AdListener {
  const AdListener({
    this.onAdLoaded,
    this.onAdFailedToLoad,
    this.onAdOpened,
    this.onAdClosed,
    this.onAdImpression,
    this.onAdClicked,
  });

  final void Function(Ad ad)? onAdLoaded;
  final void Function(Ad ad, LoadAdError error)? onAdFailedToLoad;
  final void Function(Ad ad)? onAdOpened;
  final void Function(Ad ad)? onAdClosed;
  final void Function(Ad ad)? onAdImpression;
  final void Function(Ad ad)? onAdClicked;
}
