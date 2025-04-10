import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_course_app/view/course_detail/course_detail_screen.dart';
import 'package:my_course_app/view/course_list/course_list_controller.dart';

class CourseListScreen extends StatelessWidget {
  final controller = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Courses")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.courseList.length,
          itemBuilder: (context, index) {
            var course = controller.courseList[index];
            return InkWell(
              onTap: () {
                Get.to(() =>
                    CourseDetailScreen(courseId: course['id'].toString()));
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Stack(
                        children: [
                          const Center(
                              child: CircularProgressIndicator(strokeWidth: 2)),
                          Positioned.fill(
                            child: FadeInImage.assetNetwork(
                              placeholder:
                                  'assets/images/courseplaceholder.png', // still needed in case image takes time
                              image: course['thumbnail'] ?? '',
                              fit: BoxFit.fitHeight,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/courseplaceholder.png',
                                  fit: BoxFit.scaleDown,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  title: Text(
                    course['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(course['shortDescription']),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
