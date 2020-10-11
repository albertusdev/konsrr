import 'package:get/get.dart';

class NavigationController extends GetxController {
  final activeIndex = 0.obs;

  void changeIndex(int activeIndex) {
    this.activeIndex.value = activeIndex;
  }
}
