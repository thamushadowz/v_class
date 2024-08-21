import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.STUDENTS,
      page: () => const StudentsScreen(),
      binding: StudentsControllerBinding(),
    ),
    GetPage(
      name: Routes.STUDENT_DETAILS,
      page: () => const StudentDetailsScreen(),
      binding: StudentDetailsControllerBinding(),
    ),
    GetPage(
      name: Routes.SUBJECTS,
      page: () => const SubjectsScreen(),
      binding: SubjectsControllerBinding(),
    ),
    GetPage(
      name: Routes.SUBJECT_DETAIL,
      page: () => const SubjectDetailScreen(),
      binding: SubjectDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.CLASS_ROOMS,
      page: () => const ClassRoomsScreen(),
      binding: ClassRoomsControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTRATION,
      page: () => const RegistrationScreen(),
      binding: RegistrationControllerBinding(),
    ),
    GetPage(
      name: Routes.NEW_REGISTRATION,
      page: () => const NewRegistrationScreen(),
      binding: NewRegistrationControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTRATION_DETAILS,
      page: () => const RegistrationDetailsScreen(),
      binding: RegistrationDetailsControllerBinding(),
    ),
    GetPage(
      name: Routes.CLASSROOM_DETAILS,
      page: () => const ClassroomDetailsScreen(),
      binding: ClassroomDetailsControllerBinding(),
    ),
  ];
}
