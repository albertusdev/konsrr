import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/theme.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  final controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/auth_image_asset.png',
                width: Get.width,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'konsrr.',
                        style: AppThemes.titleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.isCurrentlySigningIn.value
                              ? null
                              : controller.signInWithGoogle,
                          child: controller.isCurrentlySigningIn.value
                              ? SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  'Sign in with Google'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
