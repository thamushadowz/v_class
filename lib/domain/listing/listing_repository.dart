import 'package:get/get.dart';
import 'package:v_class/domain/listing/listing_service.dart';
import 'package:v_class/domain/listing/models/class_room_list_model.dart';
import 'package:v_class/domain/listing/models/classroom_details_model.dart';
import 'package:v_class/domain/listing/models/delete_registration_model.dart';
import 'package:v_class/domain/listing/models/registrations_model.dart';
import 'package:v_class/domain/listing/models/student_list_model.dart';
import 'package:v_class/domain/listing/models/subject_list_model.dart';

import '../../infrastructure/dal/services/api_service.dart';

class ListingRepository implements ListingService {
  ApiService apiService = Get.find();

  @override
  Future<StudentListModel> studentList() async {
    StudentListModel studentListModel;
    final response = await apiService
        .reqst(url: 'students/', queryParams: {'api_key': '0A901'});
    try {
      studentListModel = StudentListModel.fromJson(response.body);
      return studentListModel;
    } catch (e) {
      return StudentListModel();
    }
  }

  @override
  Future<SubjectListModel> subjectList() async {
    SubjectListModel subjectListModel;
    final response = await apiService
        .reqst(url: 'subjects/', queryParams: {'api_key': '0A901'});
    try {
      subjectListModel = SubjectListModel.fromJson(response.body);
      return subjectListModel;
    } catch (e) {
      return SubjectListModel();
    }
  }

  @override
  Future<ClassRoomListModel> classRoomList() async {
    ClassRoomListModel classRoomListModel;
    final response = await apiService
        .reqst(url: 'classrooms/', queryParams: {'api_key': '0A901'});
    try {
      classRoomListModel = ClassRoomListModel.fromJson(response.body);
      return classRoomListModel;
    } catch (e) {
      return ClassRoomListModel();
    }
  }

  @override
  Future<ClassroomDetailsModel> classRoomDetailsList(String id) async {
    ClassroomDetailsModel classroomDetailsModel;
    final response = await apiService
        .reqst(url: 'classrooms/$id', queryParams: {'api_key': '0A901'});
    try {
      classroomDetailsModel = ClassroomDetailsModel.fromJson(response.body);
      return classroomDetailsModel;
    } catch (e) {
      return ClassroomDetailsModel();
    }
  }

  @override
  Future<ClassroomDetailsModel> classRoomDetailsUpdate(
      String id, dynamic subjectId) async {
    ClassroomDetailsModel classroomDetailsModel;
    final response = await apiService.reqst(
        url: 'classrooms/$id',
        queryParams: {'api_key': '0A901'},
        params: {'subject': subjectId.toString()},
        method: Method.PATCH);
    try {
      classroomDetailsModel = ClassroomDetailsModel.fromJson(response.body);
      return classroomDetailsModel;
    } catch (e) {
      return ClassroomDetailsModel();
    }
  }

  @override
  Future<RegistrationsModel> registrationList() async {
    RegistrationsModel registrationsModel;
    final response = await apiService
        .reqst(url: 'registration/', queryParams: {'api_key': '0A901'});
    try {
      registrationsModel = RegistrationsModel.fromJson(response.body);
      return registrationsModel;
    } catch (e) {
      return RegistrationsModel();
    }
  }

  @override
  Future<DeleteRegistrationModel> deleteRegistration(int id) async {
    DeleteRegistrationModel deleteRegistrationModel;
    final response = await apiService.reqst(
        url: 'registration/$id',
        queryParams: {'api_key': '0A901'},
        params: {'id': id.toString()},
        method: Method.DELETE);
    try {
      deleteRegistrationModel = DeleteRegistrationModel.fromJson(response.body);
      return deleteRegistrationModel;
    } catch (e) {
      return DeleteRegistrationModel();
    }
  }

  @override
  Future<RegistrationsModel> newRegistration(
      String subjectId, String studentId) async {
    RegistrationsModel registrationsModel;
    final response = await apiService.reqst(
        url: 'registration/',
        queryParams: {'api_key': '0A901'},
        params: {
          'subject': subjectId.toString(),
          'student': studentId.toString()
        },
        method: Method.POST);
    try {
      registrationsModel = RegistrationsModel.fromJson(response.body);
      return registrationsModel;
    } catch (e) {
      return RegistrationsModel();
    }
  }
}
