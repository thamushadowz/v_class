import 'package:get/get.dart';

import '../../../../presentation/subjects/controllers/subjects.controller.dart';

class SubjectsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectsController>(
      () => SubjectsController(),
    );
  }
}
