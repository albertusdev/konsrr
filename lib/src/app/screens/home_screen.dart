import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';
import 'package:konsrr/src/auth/screens/auth_screen.dart';
import 'package:konsrr/src/search/screens/search_screen.dart';

import '../theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Builder(
        builder: (context) => DefaultTextStyle(
          style:
              AppThemes.createTextTheme(Theme.of(context).textTheme).bodyText1,
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  height: Get.height * 0.5,
                  width: double.infinity,
                  color: Colors.green,
                ),
                CustomScrollView(
                  anchor: 0.4,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(20.0),
                                  topRight: const Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        _buildList(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final authController = Get.find<AuthController>();

  User get user => authController.user.value;

  static double leftMargin = Get.width * 0.05;

  Widget padLeft(Widget widget) {
    return Padding(
      padding: EdgeInsets.only(left: leftMargin),
      child: widget,
    );
  }

  List<Widget> _buildList(context) {
    return [
      Container(
        color: Colors.white,
        child: padLeft(
          Text(
            'Welcome, ${user.displayName}! 👋',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
      ),
      Container(
        color: Colors.white,
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: leftMargin).copyWith(top: 8.0),
          child: InkWell(
            onTap: () => Get.to(SearchScreen(), transition: Transition.downToUp),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(width: 1.0, color: Color(0xFFD1D0D1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Find your favorite concerts here...',
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            ),
          ),
        ),
      ),
      Container(color: Colors.white, height: Get.height),
    ];
  }
}
