import 'package:get/get.dart';

import '../../../../presentation/classroom_details/controllers/classroom_details.controller.dart';

class ClassroomDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassroomDetailsController>(
      () => ClassroomDetailsController(),
    );
  }
}
