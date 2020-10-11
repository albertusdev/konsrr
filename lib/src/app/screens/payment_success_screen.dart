import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/controllers/navigation_controller.dart';
import 'package:konsrr/src/app/models/booking.dart';
import 'package:konsrr/src/concerts/screen/view_booking_screen.dart';

import '../constants.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final Booking booking;

  const PaymentSuccessScreen({Key key, this.booking}) : super(key: key);

  void prepareToNavigate(context) {
    Get.find<NavigationController>().changeIndex(2);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Payment Success',
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                prepareToNavigate(context);
                while (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Congrats!\n We have successfully\nreceived your payment.',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
                  child: ElevatedButton(
                    onPressed: () {
                      prepareToNavigate(context);
                      Get.to(BookingDetailScreen(booking: booking,));
                    },
                    child: Text('SEE MY TICKET!'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
