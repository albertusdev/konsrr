import 'package:flutter/material.dart';
import 'package:konsrr/src/app/constants.dart';
import 'package:konsrr/src/app/widgets/app_bar_with_branding_title.dart';

class MyTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithBrandingTitle(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                Text('My Purchased Ticket', style: Theme
                    .of(context)
                    .accentTextTheme
                    .headline6,),
              ],
            ),
          ),
        ),
    );
  }
}
