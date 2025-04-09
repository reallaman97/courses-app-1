import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_course_app/routes/app_pages.dart';
import 'package:my_course_app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Course App',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    );
  }
}
