import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../features/subscription/providers/entitlement_provider.dart';
import '../ad_service.dart';

class AdBanner extends ConsumerStatefulWidget {
  const AdBanner({super.key});

  @override
  ConsumerState<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends ConsumerState<AdBanner> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAdIfNeeded();
  }

  void _loadAdIfNeeded() {
    final entitlement = ref.read(entitlementProvider);
    if (!AdService.shouldShowAds(entitlement)) {
      _bannerAd?.dispose();
      _bannerAd = null;
      return;
    }

    if (_bannerAd != null || _isLoaded) return;

    _bannerAd = AdService.createBannerAd(
      listener: AdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _isLoaded = true);
        },
        onAdFailedToLoad: (_, __) {
          _bannerAd = null;
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entitlement = ref.watch(entitlementProvider);

    if (!AdService.shouldShowAds(entitlement)) {
      return const SizedBox.shrink();
    }

    if (_bannerAd == null || !_isLoaded) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}
