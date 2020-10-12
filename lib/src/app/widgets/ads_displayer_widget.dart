import 'package:carousel_slider/carousel_slider.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:konsrr/src/app/http_client.dart';
import 'package:konsrr/src/app/models/ads.dart';
import 'package:konsrr/src/app/theme.dart';

class AdsDisplayerWidget extends StatefulWidget {
  @override
  _AdsDisplayerWidgetState createState() => _AdsDisplayerWidgetState();
}

class _AdsDisplayerWidgetState extends State<AdsDisplayerWidget> {
  List<Ads> ads;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future fetch() async {
    final now = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final query = FirebaseFirestore.instance
        .collection('ads')
        .where('date', isEqualTo: now);
    final queryResult = await query.get();
    setState(() {
      ads = [for (var snapshot in queryResult.docs) Ads(snapshot: snapshot)];
    });
    if (ads.length > 0) {
      seen[ads[0].id] = true;
      Get.find<KonsrrApi>().incrementAdsView(ads[0].id);
    }
  }

  final Map<String, bool> seen = {};

  @override
  Widget build(BuildContext context) {
    if (ads == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (ads.isEmpty) {
      return Center(
        child: Text('Konsrr.', style: AppThemes.titleTextStyle),
      );
    }
    return CarouselSlider(
      items: ads.map((ad) {
        return InkWell(
            child: Image.network(
              ad.imageURL,
              fit: BoxFit.fitWidth,
              width: Get.width,
            ),
            onTap: () {
              return Get.toNamed('/concert_detail?id=${ad.concert.id}&adsId=${ad.id}');
            });
      }).toList(),
      options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            final id = ads[index].id;
            if (seen.containsKey(id)) {
              return;
            }
            Get.find<KonsrrApi>().incrementAdsView(id);
            seen[id] = true;
          }),
    );
  }
}
