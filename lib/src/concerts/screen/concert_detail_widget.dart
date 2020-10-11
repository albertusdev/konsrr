import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/constants.dart';
import 'package:konsrr/src/app/constants.dart';
import 'package:konsrr/src/app/http_client.dart';
import 'package:konsrr/src/app/models/booking.dart';
import 'package:konsrr/src/app/models/concert.dart';
import 'package:konsrr/src/app/models/merchandise.dart';
import 'package:konsrr/src/app/theme.dart';
import 'package:konsrr/src/concerts/repositories/concert_repository.dart';
import 'package:konsrr/src/concerts/widgets/wishlist_button.dart';

import 'booking_screen.dart';

class ConcertDetailWidget extends StatefulWidget {
  final Concert concert;

  const ConcertDetailWidget({Key key, this.concert}) : super(key: key);

  @override
  _ConcertDetailWidgetState createState() => _ConcertDetailWidgetState();
}

class _ConcertDetailWidgetState extends State<ConcertDetailWidget> {
  Concert concert;
  bool fromAds = false;
  String adsId;

  Booking booking = Booking();

  @override
  void initState() {
    super.initState();
    fetchConcert();
  }

  Future fetchConcert() async {
    concert = widget.concert;
    if (widget.concert == null) {
      concert = await ConcertRepository.getConcert(Get.parameters['id']);
      adsId = Get.parameters['adsId'];
      fromAds = true;
      setState(() {});
    }
    if (concert != null) {
      booking..concert = concert;
      totalPrice = concert.price.round();
      await Get.find<KonsrrApi>().updateSeenBy(concert);
    }
  }

  int totalPrice;

  @override
  Widget build(BuildContext context) {
    if (concert == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(concert.name,
            style: Theme.of(context).primaryTextTheme.subtitle1),
      ),
      body: Stack(
        children: [
          Container(
              height: Get.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(concert.imageUrl),
                  fit: BoxFit.fitWidth,
                ),
              )),
          CustomScrollView(
            anchor: 0.3,
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 70,
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(32.0),
                            topRight: const Radius.circular(32.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              offset: Offset(0.0, -3.0),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: 60,
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 8.0),
                              height: 4,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColors.neutralGrey,
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: Get.width * 0.1,
                        top: 0.0,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: WishlistButton(
                            concert: concert,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(_buildList(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget padLeft(BuildContext context, {Widget child}) {
    return Container(
      padding: EdgeInsets.only(
        left: horizontalMargin,
        bottom: 2.0,
        top: 2.0,
      ),
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }

  Widget padRight(BuildContext context, {Widget child}) {
    return Container(
      padding: EdgeInsets.only(right: horizontalMargin),
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }

  Widget padLeftRight(BuildContext context,
      {Widget child, double marginTop, double, marginBottom}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin).copyWith(
        top: marginTop,
        bottom: marginBottom,
      ),
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }

  List<Widget> _buildList(BuildContext context) {
    final theme = Theme.of(context);
    return [
      padLeftRight(
        context,
        child: Text(concert.name, style: theme.primaryTextTheme.headline5),
        marginBottom: 16.0,
      ),
      padLeftRight(
        context,
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
            ),
            SizedBox(width: 8.0),
            Text(concert.rangeInWIB,
                style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
        marginBottom: 8.0,
      ),
      padLeftRight(
        context,
        child: Row(
          children: [
            Icon(
              Icons.local_offer_outlined,
            ),
            SizedBox(width: 8.0),
            Text(concert.priceInRP,
                style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
        marginBottom: 16.0,
      ),
      padLeftRight(
        context,
        child: Text(concert.description,
            style: TextStyle(fontSize: 16, color: AppColors.lightGrey)),
      ),
      padLeft(context, child: SizedBox(height: 18.0)),
      padLeftRight(
        context,
        child: Text(
          'Get ${concert.artistName} Special Merchandise',
          style: Theme.of(context).accentTextTheme.subtitle1,
        ),
      ),
      SizedBox(height: 16.0),
      padLeft(
        context,
        child: SizedBox(
          height: 265,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            for (var merchandise in concert.merchandise)
              buildMerchandiseCard(merchandise)
          ]),
        ),
      ),
      SizedBox(height: 18.0),
      padLeftRight(
        context,
        marginTop: 16.0,
        child: ElevatedButton(
          child: Text('BUY NOW  -  Rp${booking.totalPrice}'),
          onPressed: () {
            Get.to(BookingScreen(
              booking: booking
            ));
          },
        ),
        marginBottom: 16.0,
      ),
    ];
  }

  Widget buildMerchandiseCard(Merchandise merchandise) {
    return SizedBox(
      width: Get.width * 0.4,
      child: Center(
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Container(
                height: 150.0,
                decoration: merchandise.imageURL != null
                    ? BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(merchandise.imageURL),
                          fit: BoxFit.cover,
                        ),
                      )
                    : null,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      merchandise.name,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: Theme.of(context).accentTextTheme.subtitle2,
                    ),
                    LayoutBuilder(
                      builder: (_, constraint) => SizedBox(
                        width: constraint.maxWidth,
                        child: booking.hasMerchandise(merchandise)
                            ? ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    booking.removeMerchandise(merchandise);
                                  });
                                  print(booking.hasMerchandise(merchandise));
                                },
                                child: Text(
                                  'Added',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText2,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      Theme.of(context).colorScheme.onSurface,
                                  padding: EdgeInsets.zero,
                                ),
                              )
                            : OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    booking.addMerchandise(merchandise);
                                  });
                                },
                                child:
                                    Text('+ Rp ${merchandise.price.round()}'),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
