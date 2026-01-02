import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startupscout/utils/app_constants.dart';
import 'package:startupscout/views/leaderboard/leader_board_screen.dart';
import 'package:startupscout/views/widgets/wg_text.dart';

import '../ideas/idea_submission_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WgText(
                    spans: [
                      TextSpan(
                        text: "Startup",
                        style: GoogleFonts.ubuntu(
                          fontSize: 20.sp,
                          color: AppConstants.primaryBlackColor,
                        ),
                      ),
                      TextSpan(
                        text: "Scout",
                        style: GoogleFonts.ubuntu(
                          fontSize: 20.sp,
                          color: AppConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Explore & upvote startup ideas",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: AppConstants.primaryBlackColor,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Image.asset("assets/images/img.png"),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Trending ideas",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppConstants.primaryBlackColor,
                  ),
                ),
              ),
              SizedBox(height: 10.h),





            ],
          ),
        ),
      ),
     floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.to(() => const IdeaSubmissionScreen()),
          label: Text("New Idea",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14.sp),),
          backgroundColor: AppConstants.primaryColor,
          icon: Icon(Icons.lightbulb,color: AppConstants.primaryWhiteColor,size: 20.sp,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat

    );
  }
}
