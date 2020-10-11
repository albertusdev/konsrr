import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/controllers/navigation_controller.dart';
import 'package:konsrr/src/app/models/booking.dart';
import 'package:konsrr/src/app/screens/navigation_screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final Booking booking;

  const PaymentSuccessScreen({Key key, this.booking}) : super(key: key);

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
                Get.find<NavigationController>().changeIndex(2);
                while (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Congrats!\n We have successfully received your payment.',
                  style: Theme.of(context).textTheme.headline5),
              ElevatedButton(onPressed: () {}, child: Text('SEE MY TICKET!')),
            ],
          )),
    );
  }
}
