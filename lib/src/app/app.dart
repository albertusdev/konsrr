import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:konsrr/src/app/screens/splash_screen.dart';
import 'package:konsrr/src/app/theme.dart';
import 'package:konsrr/src/concerts/screen/concert_detail_widget.dart';

class KonsrrApp extends GetMaterialApp {
  KonsrrApp() : super(
    themeMode: ThemeMode.dark,
    theme: AppThemes.light,
    darkTheme: AppThemes.dark,
    initialRoute: '/splash',
    getPages: [
      GetPage(
        name: '/splash',
        page: () => SplashScreen(),
      ),
      GetPage(
        name: '/concert_detail',
        page: () => ConcertDetailWidget(),
      )
    ]
  );
}
