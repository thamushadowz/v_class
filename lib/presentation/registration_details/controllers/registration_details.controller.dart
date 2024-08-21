import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:v_class/domain/listing/models/delete_registration_model.dart';
import 'package:v_class/domain/listing/models/registrations_model.dart';
import 'package:v_class/domain/listing/models/student_list_model.dart';
import 'package:v_class/domain/listing/models/subject_list_model.dart';
import 'package:v_class/infrastructure/theme/colors/app_colors.dart';

import '../../../domain/listing/listing_service.dart';

class RegistrationDetailsController extends GetxController {
  Students students = Get.arguments['students'];
  Subjects subjects = Get.arguments['subjects'];
  Registrations registrations = Get.arguments['registrations'];
  final ListingService listingService = Get.find();
  RxBool isLoading = false.obs;
  DeleteRegistrationModel deleteModel = DeleteRegistrationModel();

  Future<void> deleteRegistration(int id) async {
    isLoading.value = true;
    try {
      deleteModel = await listingService.deleteRegistration(id);
      Get.snackbar('Success', '',
          backgroundColor: AppColors.green,
          colorText: AppColors.white,
          messageText: Text(
            deleteModel.message ?? '',
            style: TextStyle(color: AppColors.white),
          ));
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete registration details $e');
    } finally {
      isLoading.value = false;
    }
  }
}
