import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/controllers/navigation_controller.dart';
import 'package:konsrr/src/app/theme.dart';

import '../navigation_items.dart';

class NavigationScreen extends StatelessWidget {
  final NavigationController controller = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Obx(
        () => IndexedStack(
          index: controller.activeIndex.value,
          children: [
            for (var item in navigationItems)
              if (item.featureFlag) item.screen
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: AppColors.lightGrey,
          items: [
            for (var item in navigationItems)
              if (item.featureFlag) item.bottomNavigationBarItem
          ],
          currentIndex: controller.activeIndex.value,
          onTap: controller.changeIndex,
        ),
      ),
    );
  }
}
