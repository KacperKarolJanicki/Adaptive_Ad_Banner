import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AdaptiveAdBanner extends StatefulWidget {
  final String adUnitId;

  const AdaptiveAdBanner({
    super.key,
    required this.adUnitId
  });

  @override
  State<AdaptiveAdBanner> createState() => _AdaptiveAdBannerState();
}

class _AdaptiveAdBannerState extends State<AdaptiveAdBanner> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      MediaQuery
          .sizeOf(context)
          .width
          .truncate(),
    );

    if (size == null || _bannerAd != null) return;

    _bannerAd = BannerAd(
      adUnitId: widget.adUnitId, // Używamy ID przekazanego w konstruktorze
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          setState(() {
            _bannerAd = null;
            _isAdLoaded = false;
          });
        },
      ),
    )
      ..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded && _bannerAd != null) {
      return Container(
        alignment: Alignment.center,
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    }
    return const SizedBox(height: 50.0);
  }
}