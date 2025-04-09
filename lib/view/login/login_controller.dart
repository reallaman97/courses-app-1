// lib/modules/login/login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_course_app/view/course_list/course_list_controller.dart';
import 'package:my_course_app/view/course_list/course_list_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        Get.snackbar("Success", "Login successful");
        // Navigate to home or dashboard here
        Get.off(() => CourseListScreen(), binding: BindingsBuilder(() {
          Get.put(CourseController());
        }));
      });
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
