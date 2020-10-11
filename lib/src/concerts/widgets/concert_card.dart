import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/models/concert.dart';
import 'package:konsrr/src/concerts/screen/concert_detail_widget.dart';
import 'package:konsrr/src/concerts/widgets/wishlist_button.dart';

class ConcertCard extends StatelessWidget {
  final Concert concert;

  const ConcertCard({Key key, this.concert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: min(327, Get.width * 0.8),
      height: 250,
      child: InkWell(
        onTap: () => Get.to(ConcertDetailWidget(concert: concert)),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 148.0,
                    decoration: concert.imageUrl != null ? BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(concert.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ) : null,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8.0,
                        right: 8.0,
                      ),
                      child: WishlistButton(concert: concert),
                    ),
                  )
                ],
              ),
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
                        Text(concert.rangeInWIB,
                            style: TextStyle(
                              fontSize:
                                  Theme.of(context).textTheme.caption.fontSize,
                            )),
                      ])
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
