import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/constants.dart';
import 'package:konsrr/src/app/models/booking.dart';
import 'package:konsrr/src/app/widgets/app_bar_with_branding_title.dart';
import 'package:konsrr/src/app/widgets/utils.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';
import 'package:konsrr/src/concerts/screen/view_booking_screen.dart';

class MyTicketScreen extends StatelessWidget {
  Widget handleNoTicket(context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              'My Purchased Ticket',
              style: Theme.of(context).accentTextTheme.headline6,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "You don't have any purchased ticket yet."
                  "\n Go to Home / your wishlist to buy a concert ticket!",
                  style: Theme.of(context).accentTextTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBrandingTitle(),
      body: StreamBuilder<List<Booking>>(
        stream: authController.userDocument
            .collection('bookings')
            .snapshots()
            .transform(
          StreamTransformer<QuerySnapshot, List<Booking>>.fromHandlers(
            handleData: (data, sink) async {
              final List<Booking> list = [];
              for (var doc in data.docs) {
                list.add(Booking.fromData(doc.data()));
              }
              sink.add(list);
            },
          ),
        ),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData || snapshot.data.isEmpty)
            return handleNoTicket(context);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                padLeft(
                  context,
                  child: Text(
                    'My Purchased Ticket',
                    style: Theme.of(context).accentTextTheme.headline6,
                  ),
                ),
                ...[
                  for (var booking in snapshot.data)
                    BookingCard(
                      booking: booking,
                    )
                ],
                SizedBox(height: 32.0),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({Key key, this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final concert = booking.concert;
    return Center(
      child: Container(
        width: min(327, Get.width * 0.8),
        height: 280,
        padding: EdgeInsets.only(top: 8.0),
        child: InkWell(
          onTap: () => Get.to(BookingDetailScreen(booking: booking)),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Container(
                  height: 148.0,
                  decoration: concert.imageUrl != null
                      ? BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(concert.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
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
                              color: Theme.of(context).accentColor,
                            )),
                      ])
                    ],
                  ),
                ),
                Text(
                  'Rp ${booking.totalPrice}',
                  textAlign: TextAlign.right,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
