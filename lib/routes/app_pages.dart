import 'package:get/get_navigation/get_navigation.dart';
import 'package:startupscout/views/bottom%20navigation/bottom_navigation_screen.dart';
import 'package:startupscout/views/onboarding/onboarding_screen.dart';
import 'package:startupscout/views/splash%20screen/splash_screen.dart';

import '../bindings/bottom_nav_binding.dart';
import '../views/home/HomeScreen.dart';
import 'app_routes.dart';

class AppPages{

  static final pages = [
    GetPage(name: AppRoutes.splashscreen, page: () => SplashScreen(),),
    GetPage(name: AppRoutes.onboardingscreen, page: () => OnboardingScreen(),),
    GetPage(name: AppRoutes.bottomnavigation, page: () => const BottomNavigationScreen(),binding: BottomNavBinding()),
    GetPage(name: AppRoutes.homescreen, page: () =>  HomeScreen()),
  ];



}