import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class AppBarWithBrandingTitle extends AppBar {
  AppBarWithBrandingTitle() : super(
    title: Text('Konsrr.'),
    backgroundColor: Get.isDarkMode ? AppColors.black : AppColors.white,
  );
}
