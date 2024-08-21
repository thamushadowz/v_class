import 'package:get/get.dart';
import 'package:v_class/domain/listing/models/classroom_details_model.dart';

import '../../../domain/listing/listing_service.dart';
import '../../../domain/listing/models/class_room_list_model.dart';
import '../../../domain/listing/models/subject_list_model.dart';

class ClassRoomsController extends GetxController {
  ListingService listingService = Get.find();
  List<Classrooms> classrooms = [];
  List<Subjects> subjects = [];
  RxBool isLoading = false.obs;
  ClassroomDetailsModel details = ClassroomDetailsModel();

  @override
  void onInit() {
    super.onInit();
    classrooms = Get.arguments['classrooms'];
    subjects = Get.arguments['subjects'];
  }

  Future<void> getClassroomDetails(int id) async {
    isLoading.value = true;
    try {
      details = await listingService.classRoomDetailsList(id.toString());
    } catch (e) {
      Get.snackbar('Error', 'Failed to load classroom details $e');
    } finally {
      isLoading.value = false;
    }
  }
}
