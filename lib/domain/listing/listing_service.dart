import 'package:v_class/domain/listing/models/class_room_list_model.dart';
import 'package:v_class/domain/listing/models/delete_registration_model.dart';
import 'package:v_class/domain/listing/models/registrations_model.dart';

import 'models/classroom_details_model.dart';
import 'models/student_list_model.dart';
import 'models/subject_list_model.dart';

abstract class ListingService {
  Future<StudentListModel> studentList();
  Future<SubjectListModel> subjectList();
  Future<ClassRoomListModel> classRoomList();
  Future<ClassroomDetailsModel> classRoomDetailsList(String id);
  Future<ClassroomDetailsModel> classRoomDetailsUpdate(
      String id, String subjectId);
  Future<RegistrationsModel> registrationList();
  Future<DeleteRegistrationModel> deleteRegistration(int id);
  Future<dynamic> newRegistration(String subjectId, String studentId);
}
