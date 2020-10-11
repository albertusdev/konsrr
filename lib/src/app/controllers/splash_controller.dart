import 'package:firebase_core/firebase_core.dart';
import 'package:flamingo/flamingo.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/global_dependencies.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';

Future<Duration> runAndGetDuration(Function function) async {
  final before = DateTime.now();
  await function();
  final elapsed = DateTime.now().difference(before);
  return elapsed;
}

class SplashController extends GetxController {
  Future initialize() async {
    final elapsed = await runAndGetDuration(() async {
      await Firebase.initializeApp();
      await Flamingo.initializeApp();
    });
    final diffForSmoothSplash = Duration(seconds: 1) - elapsed;
    await Future.delayed(diffForSmoothSplash);
    setUpDependencies();
    Get.find<AuthController>().redirectBasedOnAuthState();
  }
}
