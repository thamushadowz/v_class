import 'package:get/get.dart';
import 'package:v_class/domain/listing/models/classroom_details_model.dart';

import '../../../domain/listing/models/subject_list_model.dart';

class ClassroomDetailsController extends GetxController {
  Rx<ClassroomDetailsModel> item = ClassroomDetailsModel().obs;
  List<Subjects> subjects = Get.arguments['subjects'];
  RxBool isLoading = false.obs;
  ClassroomDetailsModel details = ClassroomDetailsModel();

  @override
  void onInit() {
    super.onInit();
    item.value = Get.arguments['details'];
  }

  Subjects? findSubject(String subj) {
    if (subjects.isNotEmpty) {
      for (int i = 0; i < subjects.length; i++) {
        if (subj == subjects[i].id.toString()) {
          return subjects[i];
        }
      }
    }
    return null;
  }
}
