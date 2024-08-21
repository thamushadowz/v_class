import 'package:get/get.dart';
import 'package:v_class/domain/listing/models/subject_list_model.dart';

import '../../../domain/listing/listing_service.dart';
import '../../../domain/listing/models/classroom_details_model.dart';

class SubjectsController extends GetxController {
  final ListingService listingService = Get.find();
  List<Subjects> subjects = [];
  bool? isSelectOption = false;
  bool? isRegSelectOption = false;
  int? itemId = 0;
  String subjectItem = '';
  RxBool isLoading = false.obs;
  ClassroomDetailsModel details = ClassroomDetailsModel();
  @override
  void onInit() {
    super.onInit();
    subjects = Get.arguments['subjects'];
    isSelectOption = Get.arguments['isSelectOption'];
    isRegSelectOption = Get.arguments['isRegSelectOption'];
    itemId = Get.arguments['itemId'];
  }

  Future<void> updateClassroomDetails(int id, dynamic subjectId) async {
    isLoading.value = true;
    try {
      details = await listingService.classRoomDetailsUpdate(
          id.toString(), subjectId.toString());
      Get.back(result: details);
    } catch (e) {
      Get.snackbar('Error', 'Failed to update classroom subject details $e');
    } finally {
      isLoading.value = false;
    }
  }
}
