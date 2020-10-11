import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/constants.dart';
import 'package:konsrr/src/app/models/booking.dart';
import 'package:konsrr/src/app/models/my_user.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';

class BookingDetailScreen extends StatefulWidget {
  final Booking booking;

  const BookingDetailScreen({Key key, this.booking}) : super(key: key);

  @override
  _BookingDetailScreenState createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Booking',
            style: Theme.of(context).primaryTextTheme.subtitle2),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
          child: Column(
            children: [
              SizedBox(height: 16.0),
              _buildConcertCard(context),
              SizedBox(height: 16.0),
              _buildBookingDetailsCard(context),
              _buildForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConcertCard(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Container(
            height: 120.0,
            decoration: widget.booking.concert.imageUrl != null
                ? BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.booking.concert.imageUrl),
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
                    widget.booking.concert.name,
                    style: Theme.of(context).primaryTextTheme.subtitle2,
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).hintColor,
                  ),
                  Row(children: [
                    Icon(Icons.calendar_today_outlined, size: 16.0),
                    SizedBox(width: 8.0),
                    Text(
                      widget.booking.concert.rangeInWIB,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).primaryTextTheme.caption.fontSize,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ])
                ],
              )),
        ],
      ),
    );
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name;
  String phone;
  String date;
  String address;
  String identificationNumber;

  User get firebaseUser => Get.find<AuthController>().user.value;

  MyUser get myUser => Get.find<AuthController>().myUser.value;

  AuthController get authController => Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    name = myUser?.name ?? firebaseUser.displayName;
    phone = myUser?.phoneNumber ?? "";
    date = myUser?.birthDate ?? "";
    address = myUser?.address ?? "";
    identificationNumber = myUser?.address ?? "";
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Attendance Details',
              style: Theme.of(context).accentTextTheme.bodyText1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.0),
                  Text('Name',
                      style: Theme.of(context).accentTextTheme.bodyText1),
                  Text(
                    name,
                  ),
                  SizedBox(height: 16.0),
                  Text('Identity Number (KTP/SIM/Passport/Student ID)',
                      style: Theme.of(context).accentTextTheme.bodyText1),
                  Text(
                    identificationNumber,
                  ),
                  SizedBox(height: 16.0),
                  Text('Phone Number',
                      style: Theme.of(context).accentTextTheme.bodyText1),
                  Text(
                    phone,
                  ),
                  SizedBox(height: 16.0),
                  Text('Birth Date',
                      style: Theme.of(context).accentTextTheme.bodyText1),
                  Text(
                    date,
                  ),
                  SizedBox(height: 16.0),
                  Text('Address',
                      style: Theme.of(context).accentTextTheme.bodyText1),
                  Text(
                    address,
                    maxLines: 5,
                  ),
                  SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget priceWidget(String title, int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 4,
            child: Text('$title',
                style: Theme.of(context).accentTextTheme.subtitle2)),
        Flexible(
          flex: 1,
          child: Text('Rp$price',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.caption.fontSize,
              )),
        )
      ],
    );
  }

  Widget _buildBookingDetailsCard(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: Theme.of(context).primaryTextTheme.bodyText1.copyWith(
                    fontSize: Theme.of(context).textTheme.caption.fontSize,
                  ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 8.0),
            priceWidget(
              widget.booking.concert.name,
              widget.booking.concert.price.round(),
            ),
            ...[
              for (var merchandise in widget.booking.merchandises)
                priceWidget(merchandise.name, merchandise.price.round()),
            ],
            Divider(
              color: Theme.of(context).hintColor,
              thickness: 2,
            ),
            priceWidget('Total', widget.booking.totalPrice.round()),
          ],
        ),
      ),
    );
  }
}
