import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class SplashScreenController extends GetxController {
  final storage = GetStorage();
  final String isFirstTimeKey = 'isFirstTime';

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      checkOnboardingStatus();
    });
  }
  void checkOnboardingStatus() {
    final bool isFirstTime = storage.read(isFirstTimeKey) ?? true;
    if (isFirstTime) {
      Get.offAllNamed(AppRoutes.onboardingscreen);
    } else {
      Get.offAllNamed(AppRoutes.bottomnavigation);
    }
  }
}
