import 'package:get/get.dart';

import '../../../../presentation/students/controllers/students.controller.dart';

class StudentsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentsController>(
      () => StudentsController(),
    );
  }
}
