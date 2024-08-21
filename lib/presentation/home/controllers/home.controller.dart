import 'package:get/get.dart';
import 'package:v_class/domain/listing/models/class_room_list_model.dart';

import '../../../domain/listing/listing_service.dart';
import '../../../domain/listing/models/registrations_model.dart';
import '../../../domain/listing/models/student_list_model.dart';
import '../../../domain/listing/models/subject_list_model.dart';

class HomeController extends GetxController {
  ListingService listingService = Get.find();
  List<Students> students = [];
  List<Subjects> subjects = [];
  List<Classrooms> classrooms = [];
  List<Registrations> registrations = [];
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getStudentList();
    await getSubjectList();
    await getClassroomList();
    await getRegistrationList();
  }

  Future<void> getStudentList() async {
    isLoading.value = true;
    try {
      StudentListModel response = await listingService.studentList();
      if (response.students != null) {
        students.clear();
        students.addAll(response.students ?? []);
      } else {
        await getStudentList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load students');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getSubjectList() async {
    isLoading.value = true;
    try {
      SubjectListModel response = await listingService.subjectList();
      if (response.subjects != null) {
        subjects.clear();
        subjects.addAll(response.subjects ?? []);
      } else {
        await getSubjectList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load subjects');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getClassroomList() async {
    isLoading.value = true;
    try {
      ClassRoomListModel response = await listingService.classRoomList();
      if (response.classrooms != null) {
        classrooms.clear();
        classrooms.addAll(response.classrooms ?? []);
      } else {
        await getClassroomList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load classrooms');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getRegistrationList() async {
    isLoading.value = true;
    try {
      RegistrationsModel response = await listingService.registrationList();
      if (response.registrations != null) {
        registrations.clear();
        registrations.addAll(response.registrations ?? []);
      } else {
        await getRegistrationList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load registrations');
    } finally {
      isLoading.value = false;
    }
  }
}
