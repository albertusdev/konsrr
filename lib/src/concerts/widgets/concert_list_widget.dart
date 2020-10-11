import 'dart:math';

import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/models/concert.dart';
import 'package:konsrr/src/app/theme.dart';

class ConcertsListWidget extends StatefulWidget {
  final Axis scrollDirection;
  final double height;
  final double width;
  final CollectionPaging<Concert> query;

  ConcertsListWidget.horizontal(this.query,
      {Key key, @required this.height, this.width})
      : scrollDirection = Axis.horizontal,
        super(key: key);

  ConcertsListWidget.vertical(this.query,
      {Key key, @required this.width, this.height})
      : scrollDirection = Axis.vertical,
        super(key: key);

  @override
  _ConcertsListWidgetState createState() => _ConcertsListWidgetState();
}

class _ConcertsListWidgetState extends State<ConcertsListWidget> {
  bool isQueryReady = false;
  List<Concert> concerts = [];

  @override
  void initState() {
    super.initState();
    fetchQuery();
  }

  Future fetchQuery() async {
    concerts = await widget.query.load<Concert>();
    setState(() {
      isQueryReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: !isQueryReady
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: widget.scrollDirection,
              itemCount: concerts.length,
              itemBuilder: (context, i) => ConcertCard(concert: concerts[i]),
            ),
    );
  }
}

class ConcertCard extends StatelessWidget {
  final Concert concert;

  const ConcertCard({Key key, this.concert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: min(327, Get.width * 0.8),
      height: 240,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Container(
                height: 148.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(concert.imageUrl),
                  fit: BoxFit.cover,
                ))),
            Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      concert.name,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      'Organized by ${concert.vendor.name}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Divider(),
                    Row(children: [
                      Icon(Icons.calendar_today_outlined, size: 16.0),
                      SizedBox(width: 8.0),
                      Text(concert.rangeInWIB, style: TextStyle(
                        fontSize: Theme.of(context).textTheme.caption.fontSize,
                      )),
                    ])
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
