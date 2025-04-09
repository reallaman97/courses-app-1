// lib/controllers/course_controller.dart
import 'package:get/get.dart';
import 'package:my_course_app/core/network/course_api_service.dart';
import 'package:my_course_app/core/network/course_repository.dart';

class CourseController extends GetxController {
  final CourseRepository _courseRepo = CourseRepository(CourseApiService());

  var isLoading = false.obs;
  var courseList = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  void fetchCourses() async {
    try {
      isLoading.value = true;
      final courses = await _courseRepo.getCourses();
      courseList.assignAll(courses);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
