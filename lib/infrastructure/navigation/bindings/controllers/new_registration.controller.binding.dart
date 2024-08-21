import 'package:get/get.dart';

import '../../../../presentation/new_registration/controllers/new_registration.controller.dart';

class NewRegistrationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewRegistrationController>(
      () => NewRegistrationController(),
    );
  }
}
