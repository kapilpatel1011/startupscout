import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:startupscout/utils/app_constants.dart';
import 'package:startupscout/views/ideas/ideas_list_screen.dart';

import '../models/idea_model.dart';
import '../views/bottom navigation/bottom_navigation_screen.dart';
import '../views/ideas/idea_submission_screen.dart';

class IdeaSubmissionScreenController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController taglineController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  var selectedCategory = "Tech".obs;

  final List<String> categories = ["Tech", "Health", "Finance", "Education"];

  var ideas = <IdeaModel>[].obs;
  var isLoading = false.obs;

  final String ideasKey = "ideas";
  final storage = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadIdeas();
  }

  void loadIdeas() {
    List<dynamic>? storedIdeas = storage.read(ideasKey);
    if (storedIdeas != null) {
      ideas.assignAll(storedIdeas.map((e) => IdeaModel.fromJson(e)).toList());
    }
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      final int uniqueId = DateTime.now().millisecondsSinceEpoch;
      final newIdea = IdeaModel(
        key: uniqueId,
        name: nameController.text,
        tagline: taglineController.text,
        category: selectedCategory.value,
        description: descController.text,
      );

      ideas.add(newIdea);
      storage.write(ideasKey, ideas.map((e) => e.toJson()).toList());

      Get.snackbar(
        "Success!",
        "${nameController.text} has been submitted for AI review.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(() => BottomNavigationScreen());
      nameController.clear();
      taglineController.clear();
      descController.clear();
      selectedCategory.value = "Tech";
    }
  }

  void deleteIdea(int id) {
    ideas.removeWhere((idea) => idea.key == id);
    storage.write(ideasKey, ideas.map((e) => e.toJson()).toList());
    Get.snackbar("Deleted!", "Idea has been deleted.");
  }

  void shareIdea(int id) {
    var idea = ideas.firstWhere((element) => element.key == id);
    String message =
        "🚀 Check out this startup idea!\n\n"
        "🔹 Name: ${idea.name}\n"
        "🏷 Tagline: ${idea.tagline}\n"
        "📂 Category: ${idea.category}\n\n"
        "📝 Description:\n${idea.description}\n\n"
        "Shared via Startup Scout App";

    SharePlus.instance.share(
      ShareParams(subject: "Startup Idea", text: message),
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    taglineController.dispose();
    descController.dispose();
    super.onClose();
  }
}
