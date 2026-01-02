import 'package:get/get.dart';
import '../../controllers/bottom_navigation_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationContoller>(() => BottomNavigationContoller());
  }
}