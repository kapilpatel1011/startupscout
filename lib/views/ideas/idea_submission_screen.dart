import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startupscout/views/widgets/wg_button.dart';
import 'package:startupscout/views/widgets/wg_header.dart';
import '../../controllers/idea_submission_screen_controller.dart';
import '../../utils/app_constants.dart';

class IdeaSubmissionScreen extends StatelessWidget {
  const IdeaSubmissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final IdeaSubmissionScreenController controller = Get.put(IdeaSubmissionScreenController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WgHeader(
                    title: "Submit your idea",
                    onPrefixTap: () => Get.back(),
                    prefixIcon: Icons.arrow_back,
                  ),

                  Text(
                    "Get AI feedback and community votes in seconds",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    controller: controller.nameController, // Used from controller
                    decoration: const InputDecoration(
                        labelText: "Startup Name",
                        prefixIcon: Icon(Icons.rocket_launch),
                        border: OutlineInputBorder()
                    ),
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: controller.taglineController, // Used from controller
                    decoration: const InputDecoration(
                        labelText: "Tagline (One liner)",
                        prefixIcon: Icon(Icons.short_text),
                        border: OutlineInputBorder()
                    ),
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),
                  SizedBox(height: 15.h),

                  Obx(() => DropdownButtonFormField<String>(
                    initialValue: controller.selectedCategory.value,
                    decoration: const InputDecoration(
                      labelText: "Industry",
                      prefixIcon: Icon(Icons.category),
                      border: OutlineInputBorder(),
                    ),
                    items: controller.categories.map((String category) {
                      return DropdownMenuItem(value: category, child: Text(category));
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        controller.selectedCategory.value = val;
                      }
                    },
                  )),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: controller.descController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                        labelText: "Description",
                        alignLabelWithHint: true,
                        border: OutlineInputBorder()
                    ),
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),
                  SizedBox(height: 30.h),
                  WgButton(
                    onTap: () {
                      controller.submitForm();
                    },
                    text: "Submit Idea",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}