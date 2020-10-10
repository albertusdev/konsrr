import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:konsrr/src/app/screens/splash_screen.dart';
import 'package:konsrr/src/app/theme.dart';

class KonsrrApp extends GetMaterialApp {
  KonsrrApp() : super(
    home: SplashScreen(),
    themeMode: ThemeMode.dark,
    darkTheme: AppThemes.create(),
  );
}
