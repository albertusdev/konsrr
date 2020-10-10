import 'dart:async';
import 'dart:async';
import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:konsrr/src/app/screens/home_screen.dart';
import 'package:konsrr/src/auth/screens/auth_screen.dart';

class AuthController extends GetxController {
  final google = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  final Rx<User> user = Rx<User>(FirebaseAuth.instance.currentUser);
  final isCurrentlySigningIn = false.obs;

  bool get isSignedIn => user.value != null;
  StreamSubscription _userStreamSubscription;

  AuthController() {
    _userStreamSubscription =
        FirebaseAuth.instance.userChanges().listen((newUser) {
      user.value = newUser;
    });
  }


  dispose() {
    _userStreamSubscription.cancel();
  }

  void _redirectAfterSignedIn() {
    Get.off(HomeScreen());
  }
  
  void redirectBasedOnAuthState() {
    if (isSignedIn) _redirectAfterSignedIn();
    else Get.offAll(AuthScreen());
  }

  Future signInWithGoogle() async {
    if (FirebaseAuth.instance.currentUser != null) {
      _redirectAfterSignedIn();
      return;
    }
    try {
      isCurrentlySigningIn.value = true;
      final account = await google.signIn();
      final googleSignInAuthentication = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      this.user.value = authResult.user;
      _redirectAfterSignedIn();
    } catch (e) {
      this.isCurrentlySigningIn.value = false;
      Get.showSnackbar(GetBar(title: 'Something is wrong. Please try again'));
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(AuthScreen());
  }
}