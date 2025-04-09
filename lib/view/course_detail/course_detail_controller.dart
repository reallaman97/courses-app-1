import 'package:get/get.dart';
import 'package:my_course_app/core/network/course_api_service.dart';
import 'package:my_course_app/core/network/course_repository.dart';

class CourseDetailController extends GetxController {
  final CourseRepository _repo = CourseRepository(CourseApiService());

  var isLoading = true.obs;
  var courseDetail = {}.obs;

  Future<void> fetchCourseDetail(String id) async {
    try {
      isLoading(true);
      var detail = await _repo.getCourseById(id);
      courseDetail.value = detail;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
