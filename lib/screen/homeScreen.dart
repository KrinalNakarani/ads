import 'package:ads/utills/admobadd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BannerAds();
    InterstitialAds();
    RewardAds();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ads"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              child: AdWidget(
                ad: bannerAd!,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  if (InterstitialAd != null) {
                    interstitialAd!.show();
                    InterstitialAds();
                  } else {
                    InterstitialAds();
                  }
                },
                child: Text("interstialAd")),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  if (InterstitialAd != null) {
                    rewardedAd!.show(
                      onUserEarnedReward: (ad, reward) {
                        Container(
                          child: Text("${reward.amount}"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${reward.amount}"),
                          ),
                        );
                      },
                    );
                    RewardAds();
                  } else {
                    RewardAds();
                  }
                },
                child: Text("rewardAd")),
            // GestureDetector(
            //   onTap: () {
            //     if (InterstitialAd != null) {
            //       rewardedAd!.show(
            //         onUserEarnedReward: (ad, reward) {
            //           Container(
            //             child: Text("${reward.amount}"),
            //           );
            //         },
            //       );
            //       RewardAds();
            //     } else {
            //       RewardAds();
            //     }
            //   },
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     color: Colors.blue,
            //     child: Text("${reward.}"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
