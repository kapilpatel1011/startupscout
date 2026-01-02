import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startupscout/controllers/splash_screen_controller.dart';

import '../../utils/app_constants.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/splash.png",height: 100.h,width: 100.w,),
              Text("Startup Scout",style: GoogleFonts.ubuntu(fontSize: 30.sp,color: AppConstants.primaryWhiteColor),),
            ],
          ),
        ),
      ),
    );
  }
}
