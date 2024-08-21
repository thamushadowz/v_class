import 'package:get/get.dart';

import '../../../../presentation/student_details/controllers/student_details.controller.dart';

class StudentDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentDetailsController>(
      () => StudentDetailsController(),
    );
  }
}
