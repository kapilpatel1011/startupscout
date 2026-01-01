import 'dart:ui';

import 'package:logger/logger.dart';


class AppConstants{
  ///universal logger
  static final logger = Logger();

  static void logInfo(String message){
    logger.i(message);
  }

  ///App Colors
  static const Color primaryColor = Color(0xFF7C3AFA);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color primaryWhiteTextColor = Color(0xFFFFFFFF);
  static const Color primaryWhiteColor = Color(0xFFFFFFFF);
  static const Color primaryTextColor = Color(0xFF000000);
  static const Color primaryBlackColor = Color(0xFF000000);
  static const Color primaryGreyColor = Color(0xFFFFE0E0);
  static const Color secondaryTextColor = Color(0xFF8A8989);


}