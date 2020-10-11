import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/theme.dart';

import '../navigation_items.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: IndexedStack(
        index: activeIndex,
        children: [
          for (var item in navigationItems)
            if (item.featureFlag) item.screen
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: AppColors.lightGrey,
        items: [
          for (var item in navigationItems)
            if (item.featureFlag) item.bottomNavigationBarItem
        ],
        currentIndex: activeIndex,
        onTap: (int newIndex) => setState(() => activeIndex = newIndex),
      ),
    );
  }
}
