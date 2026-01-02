import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/bottom_navigation_controller.dart';
import '../../utils/app_constants.dart';

class BottomNavigationScreen
 extends StatelessWidget {
  const BottomNavigationScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationContoller controller = Get.put(BottomNavigationContoller());
    return Obx(
          () => PopScope(
            canPop: controller.currentScreenIndex.value == 0,

            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                return;
              }
              controller.changePage(0);
            },


            child: Scaffold(
                    body: IndexedStack(
            index: controller.currentScreenIndex.value,
            children: controller.screens,
                    ),

                    bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: AppConstants.primaryColor,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
                  states,
                  ) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                    color: AppConstants.primaryColor,
                    fontWeight: FontWeight.bold,
                  );
                }
                return const TextStyle(
                  color: AppConstants.primaryBlackColor,
                  fontWeight: FontWeight.w500,
                );
              }),
            ),
            child: NavigationBar(
              backgroundColor: AppConstants.primaryWhiteColor,
              onDestinationSelected: controller.changePage,
              indicatorColor: AppConstants.primaryColor,
              selectedIndex: controller.currentScreenIndex.value,
              destinations: <Widget>[
                const NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home_filled,
                    color: AppConstants.primaryWhiteColor,
                  ),
                  icon: Icon(
                    Icons.home_rounded,
                    color: AppConstants.primaryBlackColor,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.lightbulb,
                    color: AppConstants.primaryWhiteColor,
                  ),
                  icon:  Icon(
                    Icons.lightbulb_outline,
                    color: AppConstants.primaryBlackColor,
                  ),
                  label: 'Ideas',
                ),
                const NavigationDestination(
                  selectedIcon: Icon(
                    Icons.emoji_events,
                    color: AppConstants.primaryWhiteColor,
                  ),
                  icon: Icon(
                    Icons.emoji_events_outlined,
                    color: AppConstants.primaryBlackColor,
                  ),
                  label: 'Leaderboard',
                ),
              ],
            ),
                    ),
                  ),
          ),
    );
  }
}