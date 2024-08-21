import 'package:get/get.dart';

import '../../../domain/listing/models/student_list_model.dart';

class StudentsController extends GetxController {
  List<Students> students = [];
  bool? isSelectOption = false;

  @override
  void onInit() {
    super.onInit();
    students = Get.arguments['students'];
    isSelectOption = Get.arguments['isSelectOption'];
  }
}
