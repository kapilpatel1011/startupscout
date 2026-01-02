import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startupscout/utils/app_constants.dart';
import 'package:startupscout/views/widgets/wg_text.dart';
import '../../controllers/home_screen_controller.dart';
import '../ideas/idea_submission_screen.dart';
import '../widgets/wg_list_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                   Icons.light_mode
                    ),
                  )
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
              Expanded(
                child: Obx(() {
                  if (controller.trendingIdeas.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/img_1.png",
                            height: 150.h,
                            width: 150.w,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "No Ideas Trending Yet!",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Submit your first idea now.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.trendingIdeas.length,
                    itemBuilder: (context, index) {
                      final trendingIdea = controller.trendingIdeas[index];
                      return WgListTile(
                        title: trendingIdea.name,
                        tagline: trendingIdea.tagline,
                        description: trendingIdea.description,
                        isLiked: trendingIdea.isUpvoted,
                        onThumbUpTap: () {
                          controller.toggleUpvote(index);
                        },
                        onTap: () {},
                        rating: trendingIdea.rating.toDouble(),
                        upvotes: trendingIdea.upvotes,
                        category: trendingIdea.category,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => const IdeaSubmissionScreen()),
        label: Text(
          "New Idea",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.sp),
        ),
        backgroundColor: AppConstants.primaryColor,
        icon: Icon(
          Icons.lightbulb,
          color: AppConstants.primaryWhiteColor,
          size: 20.sp,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
