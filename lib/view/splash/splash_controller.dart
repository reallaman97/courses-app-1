import 'dart:async';
import 'package:get/get.dart';
import 'package:my_course_app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(
          AppRoutes.login); // Use Get.offNamed to prevent going back to splash
    });
  }
}
