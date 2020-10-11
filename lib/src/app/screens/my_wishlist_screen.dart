import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/constants.dart';
import 'package:konsrr/src/app/models/concert.dart';
import 'package:konsrr/src/app/widgets/app_bar_with_branding_title.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';
import 'package:konsrr/src/concerts/repositories/concert_repository.dart';
import 'package:konsrr/src/concerts/widgets/concert_card.dart';

class MyWishlistScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBrandingTitle(),
      body: StreamBuilder(
        stream: authController.userDocument
            .collection('wishlist')
            .snapshots()
            .transform(
          StreamTransformer<QuerySnapshot, List<Concert>>.fromHandlers(
            handleData: (data, sink) async {
              final List<Concert> list = [];
              for (var doc in data.docs) {
                final concert = await ConcertRepository.getConcert(doc.id);
                if (concert != null) list.add(concert);
              }
              sink.add(list);
            },
          ),
        ),
        builder: (ctx, concerts) {
          if (!concerts.hasData || concerts.data.length == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: horizontalMargin),
                  child: Text(
                    'My Wishlist',
                    style: Theme.of(context).primaryTextTheme.headline6,
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "You don't have any concert in wishlist yet."
                      "\nTry tapping love button in any of the concerts!",
                      style: Theme.of(context).accentTextTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            );
          }
          return ListView.builder(
            itemCount: (concerts?.data?.length ?? 0) + 1,
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.only(left: horizontalMargin),
                  child: Text(
                    'My Wishlist',
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                );
              }
              final concert = concerts.data[index - 1];
              return Column(
                children: [
                  SizedBox(height: 8.0),
                  ConcertCard(concert: concert),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
