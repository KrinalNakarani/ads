import 'package:google_mobile_ads/google_mobile_ads.dart';

BannerAd? bannerAd;
InterstitialAd? interstitialAd;
RewardedAd? rewardedAd;

void BannerAds() {
  bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(),
      request: AdRequest());
  bannerAd!.load();
}

void InterstitialAds() {
  InterstitialAd.load(
    adUnitId: "ca-app-pub-3940256099942544/1033173712",
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {}),
  );
}

void RewardAds() {
  RewardedAd.load(adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
          }, onAdFailedToLoad: (error) {})
  );
}
