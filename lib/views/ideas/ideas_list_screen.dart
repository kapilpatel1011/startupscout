import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:startupscout/controllers/idea_submission_screen_controller.dart';
import 'package:startupscout/views/widgets/wg_list_tile.dart';

import '../../controllers/bottom_navigation_controller.dart';

class IdeasListScreen extends StatelessWidget {
  IdeasListScreen({super.key});

  final IdeaSubmissionScreenController controller = Get.put(
      IdeaSubmissionScreenController());
  @override
  Widget build(BuildContext context) {
    final BottomNavigationContoller bottomNavController = Get.find();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,result) {
        if(didPop) return;
        bottomNavController.changePage(0);
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Submitted Ideas",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10.h),

                Expanded(
                  child: Obx(() {

                    if (controller.ideas.isEmpty) {
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
                              "No Ideas Yet!",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),
                            ),
                            Text(
                              "Submit your first idea now.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey.shade500
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: controller.ideas.length,
                      itemBuilder: (context, index) {
                        final idea = controller.ideas[index];
                        return WgListTile(
                          title: idea.name,
                          tagline: idea.tagline,
                          description: idea.description,
                          category: idea.category,
                          onTap: () {},
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
