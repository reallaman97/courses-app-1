import 'package:my_course_app/core/network/course_api_service.dart';

class CourseRepository {
  final CourseApiService _apiService;

  CourseRepository(this._apiService);

  Future<List<dynamic>> getCourses() async {
    return await _apiService.fetchCourses();
  }

  Future<Map<String, dynamic>> getCourseById(String id) async {
    return await _apiService.fetchCourseDetails(id);
  }
}
