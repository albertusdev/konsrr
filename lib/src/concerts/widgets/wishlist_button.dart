import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/models/concert.dart';
import 'package:konsrr/src/app/theme.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';

import '../../app_icons.dart';

DocumentReference wishlistDocument(User user, Concert concert) =>
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('wishlist')
        .doc(concert.id);

class WishlistButton extends StatefulWidget {
  final Concert concert;

  const WishlistButton({Key key, this.concert}) : super(key: key);

  @override
  _WishlistButtonState createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    init();
  }

  bool isWishlisted;

  DocumentReference wishlistDoc;

  Future init() async {
    final user = Get.find<AuthController>().user.value;
    wishlistDoc = wishlistDocument(user, widget.concert);
    bool val = (await wishlistDoc.get()).exists;
    setState(() {
      isWishlisted = val;
    });
    subscription = wishlistDoc.snapshots().listen((document) {
      setState(() {
        isWishlisted = document.exists;
      });
    });
  }

  Future handle() async {
    final result = await wishlistDoc.get();
    if (result.exists) {
      await wishlistDoc.delete();
    } else {
      await wishlistDoc.set({
        'value': true,
      });
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isWishlisted == null) {
      return CircularProgressIndicator();
    }
    return InkWell(
      child: Container(
        child: Container(
          padding: EdgeInsets.only(right: 2.0),
          width: 40.0,
          height: 40.0,
          alignment: Alignment.center,
          child: Icon(
            AppIcons.heart,
            color: isWishlisted ? AppColors.primary2 : AppColors.lightGrey,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 1.0,
                spreadRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      onTap: handle,
    );
  }
}
