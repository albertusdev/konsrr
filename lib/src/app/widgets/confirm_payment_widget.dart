import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/models/booking.dart';
import 'package:konsrr/src/app/screens/payment_success_screen.dart';
import 'package:konsrr/src/app/widgets/utils.dart';

class ConfirmPaymentWidget extends StatefulWidget {
  final Booking booking;

  const ConfirmPaymentWidget({Key key, this.booking}) : super(key: key);

  @override
  _ConfirmPaymentWidgetState createState() => _ConfirmPaymentWidgetState();
}

class _ConfirmPaymentWidgetState extends State<ConfirmPaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
          ),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              offset: Offset(0.0, -3.0),
            ),
          ],
        ),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 60,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 8.0),
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
            ),
            padLeft(
              context,
              child: SizedBox(
                width: 24,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ),
              color: false,
            ),
            SizedBox(
                height: 250.0,
                width: Get.width,
                child: Stack(children: [
                  Image.asset(
                    'assets/images/payment_confirmation_1.png',
                    height: 250.0,
                  ),
                  Positioned(
                    right: 0.0,
                    top: 16.0,
                    width: Get.width * 0.4,
                    child: Image.asset(
                      'assets/images/payment_confirmation_2.png',
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    right: 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(right: Get.width * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total',
                              style: Theme.of(context).textTheme.caption),
                          Text('Rp${widget.booking.totalPrice}',
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                    ),
                  )
                ])),
            SizedBox(height: 16.0),
            Center(
              child: SizedBox(
                width: Get.width * 0.8,
                child: ElevatedButton(
                  onPressed: handle,
                  child: Text('CONFIRM & PAY'),
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ));
  }

  void handle() {
    Get.to(PaymentSuccessScreen(
      booking: widget.booking,
    ));
  }
}
