import 'package:get/get.dart';

import '../../../../presentation/subject_detail/controllers/subject_detail.controller.dart';

class SubjectDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectDetailController>(
      () => SubjectDetailController(),
    );
  }
}
