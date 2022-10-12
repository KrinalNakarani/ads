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

  dynamic a;

  @override
  void initState() {
    super.initState();
    BannerAds();
    InterstitialAds();
    RewardAds();
    OpenAdd();
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
                        setState((){
                          a = reward.amount;

                        });
                      },
                    );
                    RewardAds();
                  } else {
                    RewardAds();
                  }
                },
                child: Text("rewardAd")),
            Container(
              child: Text("${a}"),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  if (AppOpenAd != null) {
                    appOpenAd!.show();
                    OpenAdd();
                  } else {
                    OpenAdd();
                  }
                },
                child: Text("interstialAd")),
          ],
        ),
      ),
    );
  }
}
