import 'package:get/get_navigation/get_navigation.dart';

import '../views/home/HomeScreen.dart';
import 'app_routes.dart';

class AppPages{

  static final pages = [
    GetPage(name: AppRoutes.homescreen, page: () => const HomeScreen()),


  ];



}