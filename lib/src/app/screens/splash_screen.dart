import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/controllers/splash_controller.dart';
import 'package:konsrr/src/app/theme.dart';

class SplashScreen extends StatefulWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'konsrr.',
          style: AppThemes.titleTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
