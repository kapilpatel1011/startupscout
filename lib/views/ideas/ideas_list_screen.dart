import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startupscout/controllers/idea_submission_screen_controller.dart';
import 'package:startupscout/views/widgets/wg_list_tile.dart';
import '../../utils/app_constants.dart';
import 'idea_submission_screen.dart';

class IdeasListScreen extends StatelessWidget {
  IdeasListScreen({super.key});

  final IdeaSubmissionScreenController controller = Get.put(
    IdeaSubmissionScreenController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Submitted Ideas",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.h),

              Expanded(
                child: Obx(() {
                  if (controller.ideas.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => Get.to(() => const IdeaSubmissionScreen()),
                            borderRadius: BorderRadius.circular(30.r),
                            splashColor: AppConstants.primaryColor,
                            child: Image.asset(
                              "assets/images/img_1.png",
                              height: 150.h,
                              width: 150.w,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "No Ideas Yet!",
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
                    itemCount: controller.ideas.length,
                    itemBuilder: (context, index) {
                      final idea = controller.ideas[index];
                      return Dismissible(
                        key: Key(idea.key.toString()),
                        direction: DismissDirection.horizontal,
                        background: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: AppConstants.primaryColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: const Icon(Icons.share, color: Colors.white),
                        ),
                        secondaryBackground: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            controller.shareIdea(idea.key);
                            return false;
                          } else {
                            bool? canDelete = await Get.dialog<bool>(
                              AlertDialog(
                                title: const Text("Delete Idea?"),
                                content: Text(
                                  "Are you sure you want to remove '${idea.name}'?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Get.back(
                                      result: false,
                                    ),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => Get.back(
                                      result: true,
                                    ),
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            return canDelete ?? false;
                          }
                        },
                        onDismissed: (direction) {
                          controller.deleteIdea(idea.key);
                        },

                        child: WgListTile(
                          title: idea.name,
                          tagline: idea.tagline,
                          description: idea.description,
                          category: idea.category,
                          onThumbUpTap: () {},
                          onTap: () {},
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
