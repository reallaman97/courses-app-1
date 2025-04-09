import 'package:my_course_app/core/network/api_client.dart';
import 'package:my_course_app/core/network/api_service.dart';

class CourseApiService {
  final ApiClient apiClient = ApiClient(baseUrl: ApiService.baseUrl);

  Future<List<dynamic>> fetchCourses() async {
    return await apiClient.get(ApiService.getCourses);
  }

  Future<Map<String, dynamic>> fetchCourseDetails(String id) async {
    return await apiClient.get("/courses/$id");
  }
}
