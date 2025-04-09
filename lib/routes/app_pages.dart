import 'package:get/get.dart';
import 'package:my_course_app/routes/app_routes.dart';
import 'package:my_course_app/view/login/login_binding.dart';
import 'package:my_course_app/view/login/login_screen.dart';
import 'package:my_course_app/view/splash/splash_binding.dart';
import 'package:my_course_app/view/splash/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    // You can add course list and detail routes later
    /*GetPage(
      name: AppRoutes.courseList,
      page: () => const CourseListScreen(),
      binding: CourseListBinding(),
    ),
    GetPage(
      name: AppRoutes.courseDetail,
      page: () => CourseDetailScreen(),
      binding: CourseDetailBinding(),
    ),*/
  ];
}
