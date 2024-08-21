import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/listing/listing_service.dart';
import '../../../domain/listing/models/registrations_model.dart';
import '../../../domain/listing/models/student_list_model.dart';
import '../../../domain/listing/models/subject_list_model.dart';

class RegistrationController extends GetxController
    with WidgetsBindingObserver {
  ListingService listingService = Get.find();
  RxList<Registrations> registrations = RxList([]);
  List<Students> students = [];
  List<Subjects> subjects = [];
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    students = Get.arguments['students'];
    subjects = Get.arguments['subjects'];
    registrations.value = Get.arguments['registrations'];

    await getRegistrationList();
    super.onInit();
  }

  Students? findStudentDetails(int studentId) {
    if (students.isNotEmpty) {
      for (int i = 0; i < students.length; i++) {
        if (studentId.toString() == students[i].id.toString()) {
          return students[i];
        }
      }
    }
    return null;
  }

  Subjects? findSubjectDetails(int subjectId) {
    if (subjects.isNotEmpty) {
      for (int i = 0; i < subjects.length; i++) {
        if (subjectId.toString() == subjects[i].id.toString()) {
          return subjects[i];
        }
      }
    }
    return null;
  }

  Future<void> getRegistrationList() async {
    isLoading.value = true;
    try {
      RegistrationsModel response = await listingService.registrationList();
      print('asdfg :  ${response.registrations}');
      if (response.registrations != null) {
        registrations.clear();
        registrations.value.addAll(response.registrations ?? []);
      } else {
        //await getRegistrationList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load registrations');
    } finally {
      isLoading.value = false;
    }
  }
}
