import 'package:get/get.dart';

import '../../../../presentation/registration_details/controllers/registration_details.controller.dart';

class RegistrationDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationDetailsController>(
      () => RegistrationDetailsController(),
    );
  }
}
