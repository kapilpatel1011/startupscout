import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:startupscout/utils/app_constants.dart';

import '../models/idea_model.dart';

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
      final newIdea = IdeaModel(
        name: nameController.text,
        tagline: taglineController.text,
        category: selectedCategory.value,
        description: descController.text,
      );

      ideas.add(newIdea);
      storage.write(ideasKey, ideas.map((e) => e.toJson()).toList());

      nameController.clear();
      taglineController.clear();
      descController.clear();
      selectedCategory.value = "Tech";

      Get.snackbar(
        "Success!",
        "${nameController.text} has been submitted for AI review.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    taglineController.dispose();
    descController.dispose();
    super.onClose();
  }
}
