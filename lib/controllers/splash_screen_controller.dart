import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class SplashScreenController extends GetxController {
  final storage = GetStorage();
  final String isFirstTimeKey = 'isFirstTime';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      checkOnboardingStatus();
    });
  }
  void checkOnboardingStatus() {
    var isFirstTime = storage.read(isFirstTimeKey) ?? true;
    if (isFirstTime) {
      Get.offAllNamed(AppRoutes.onboardingscreen);
      storage.write(isFirstTimeKey, false);
    } else {
      Get.offAllNamed(AppRoutes.bottomnavigation);
    }
  }
}
