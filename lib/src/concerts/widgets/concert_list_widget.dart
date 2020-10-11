import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:konsrr/src/app/models/concert.dart';

import 'concert_card.dart';

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
