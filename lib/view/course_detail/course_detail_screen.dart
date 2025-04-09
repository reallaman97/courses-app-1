import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_course_app/view/course_detail/course_detail_controller.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseId;
  final controller = Get.put(CourseDetailController());

  CourseDetailScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    controller.fetchCourseDetail(courseId);

    // Random data generation
    final random = Random();
    final lessonCount = 5 + random.nextInt(16); // 5–20 lessons
    final duration = "${1 + random.nextInt(3)}h ${10 + random.nextInt(50)}m";

    final availableTags = [
      "Beginner",
      "Frontend",
      "Backend",
      "JavaScript",
      "Flutter",
      "React",
      "Dart",
      "Design",
    ];
    final randomTags = List.generate(
      2 + random.nextInt(2),
      (_) => availableTags[random.nextInt(availableTags.length)],
    ).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Course Detail")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final course = controller.courseDetail;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if ((course['thumbnail'] ?? '').isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.assetNetwork(
                    placeholder:
                        'assets/images/courseplaceholder.png', // 👈 Your default placeholder image
                    image: course['thumbnail'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        getPlaceholderForId(
                            courseId), // 👈 Fallback image if network fails
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      );
                    },
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                course['title'] ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                course['shortDescription'] ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.play_circle_outline,
                      size: 20, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text("$lessonCount Lessons",
                      style: const TextStyle(color: Colors.grey)),
                  const SizedBox(width: 16),
                  const Icon(Icons.schedule, size: 20, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(duration, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  randomTags.length,
                  (index) => Chip(
                    label: Text(randomTags[index]),
                    backgroundColor: Colors.deepPurple.shade50,
                    labelStyle: const TextStyle(color: const Color(0xFF0A2A66)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                course['description'] ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                "Content",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                course['content'] ?? '',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.snackbar("🚀 Coming Soon",
                        "Start Course feature will be available soon!");
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Start Course"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: const Color(0xFF0A2A66),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String getPlaceholderForId(String id) {
    switch (id) {
      case '1':
        return 'assets/images/javascript.png';
      case '2':
        return 'assets/images/html.png';
      case '3':
        return 'assets/images/react.png';
      default:
        return 'assets/images/default_placeholder.png';
    }
  }
}
