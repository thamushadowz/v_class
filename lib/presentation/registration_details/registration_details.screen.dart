import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_class/presentation/registration_details/widgets/reg_details_widget.dart';

import '../../infrastructure/theme/colors/app_colors.dart';
import '../common_widgets/common_app_bar.dart';
import '../common_widgets/common_button_widget.dart';
import 'controllers/registration_details.controller.dart';

class RegistrationDetailsScreen extends GetView<RegistrationDetailsController> {
  const RegistrationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
              child: Column(
                children: [
                  const Text(
                    'Registration',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  RegDetailsWidget(
                      heading: 'Student Details',
                      subHeading: controller.students.name ?? '',
                      details: controller.students.email ?? '',
                      rightText: 'Age : ${controller.students.age}'),
                  RegDetailsWidget(
                      heading: 'Subject Details',
                      subHeading: controller.subjects.name ?? '',
                      details: controller.subjects.teacher ?? '',
                      rightText: '${controller.subjects.credits} Credit'),
                  const Spacer(),
                  CommonButtonWidget(
                      onTap: () {
                        Get.defaultDialog(
                            title: 'Delete',
                            onConfirm: () {
                              controller.deleteRegistration(
                                  controller.registrations.id!.toInt());
                              Get.close(2);
                            },
                            textCancel: 'No',
                            radius: 15,
                            textConfirm: 'Yes',
                            middleText: 'Do you want to delete?');
                      },
                      buttonColor: AppColors.red,
                      buttonText: 'Delete Registration',
                      textColor: AppColors.white)
                ],
              ),
            )),
    );
  }
}
