
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/home/HomeScreen.dart';
import '../views/ideas/idea_submission_screen.dart';
import '../views/ideas/ideas_list_screen.dart';
import '../views/leaderboard/leader_board_screen.dart';


class BottomNavigationContoller extends GetxController{

  var currentScreenIndex = 0.obs;
  final List<Widget> screens = [
    HomeScreen(),
    IdeasListScreen(),
    LeaderBoardScreen(),
  ];

  void changePage(int index) {
    currentScreenIndex.value = index;
  }
}


