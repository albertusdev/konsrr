import 'package:get/get.dart';
import 'package:konsrr/src/app/http_client.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';

import 'controllers/navigation_controller.dart';

void setUpDependencies() {
  Get.put(AuthController(), permanent: true);
  Get.put(KonsrrApi(), permanent: true);
  Get.put(NavigationController(), permanent: true);
}
