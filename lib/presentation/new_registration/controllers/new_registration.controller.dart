import 'package:get/get.dart';

import '../../../domain/listing/listing_service.dart';
import '../../../domain/listing/models/student_list_model.dart';
import '../../../domain/listing/models/subject_list_model.dart';

class NewRegistrationController extends GetxController {
  final ListingService listingService = Get.find();
  List<Students> students = Get.arguments['students'];
  List<Subjects> subjects = Get.arguments['subjects'];
  RxString selectStudent = 'Select a student'.obs;
  RxString studentId = ''.obs;
  RxString selectSubject = 'Select a subject'.obs;
  RxString subjectId = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> registerNew(dynamic subjectId, dynamic studentId) async {
    isLoading.value = true;
    try {
      final registrationsModel = await listingService.newRegistration(
          subjectId.toString(), studentId.toString());
      Get.back(result: registrationsModel);
    } catch (e) {
      Get.snackbar('Error', 'Failed to register $e');
    } finally {
      isLoading.value = false;
    }
  }
}
