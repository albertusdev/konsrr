import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/constants.dart';
import 'package:konsrr/src/app/constants.dart';
import 'package:konsrr/src/app/http_client.dart';
import 'package:konsrr/src/app/models/concert.dart';
import 'package:konsrr/src/app/theme.dart';
import 'package:konsrr/src/concerts/repositories/concert_repository.dart';
import 'package:konsrr/src/concerts/widgets/wishlist_button.dart';

class ConcertDetailWidget extends StatefulWidget {
  final Concert concert;

  const ConcertDetailWidget({Key key, this.concert}) : super(key: key);

  @override
  _ConcertDetailWidgetState createState() => _ConcertDetailWidgetState();
}

class _ConcertDetailWidgetState extends State<ConcertDetailWidget> {
  Concert concert;

  @override
  void initState() {
    super.initState();
    fetchConcert();
  }

  Future fetchConcert() async {
    concert = widget.concert;
    if (widget.concert == null) {
      concert = await ConcertRepository.getConcert(Get.parameters['id']);
      setState(() {});
    }
    totalPrice = concert.price.round();
    await Get.find<KonsrrApi>().updateSeenBy(concert);
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
                        margin: EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(32.0),
                            topRight: const Radius.circular(32.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(0.0, -3.0),
                            ),
                          ],
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
              SliverToBoxAdapter(
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _buildList(context),
                  ),
                ),
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
      padLeftRight(
        context,
        marginTop: 16.0,
        child: ElevatedButton(
          child: Text('BUY NOW  -  Rp${totalPrice}'),
          onPressed: () {},
        ),
        marginBottom: 16.0,
      ),
    ];
  }
}
