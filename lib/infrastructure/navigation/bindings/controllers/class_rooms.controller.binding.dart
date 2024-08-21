import 'package:get/get.dart';

import '../../../../presentation/class_rooms/controllers/class_rooms.controller.dart';

class ClassRoomsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassRoomsController>(
      () => ClassRoomsController(),
    );
  }
}
