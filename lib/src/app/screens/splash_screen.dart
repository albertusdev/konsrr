import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) => Get.off(HomeScreen()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Konsrr')
    );
  }
}