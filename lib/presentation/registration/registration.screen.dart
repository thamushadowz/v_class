import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_class/infrastructure/navigation/routes.dart';

import '../../infrastructure/theme/colors/app_colors.dart';
import '../common_widgets/common_app_bar.dart';
import '../common_widgets/common_button_widget.dart';
import '../common_widgets/registration_select_item_widget.dart';
import 'controllers/registration.controller.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
        child: Column(
          children: [
            const Text(
              'Registration',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.registrations.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Text(
                          'No Data',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.registrations.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RegistrationSelectItemWidget(
                            title:
                                'Registration ID : #${controller.registrations[index].id}',
                            onTap: () {
                              Get.toNamed(Routes.REGISTRATION_DETAILS,
                                  arguments: {
                                    'students': controller.findStudentDetails(
                                        controller.registrations[index].student!
                                            .toInt()),
                                    'subjects': controller.findSubjectDetails(
                                        controller.registrations[index].subject!
                                            .toInt()),
                                    'registrations':
                                        controller.registrations[index]
                                  })?.then((result) async {
                                await controller.getRegistrationList();
                              });
                            });
                      },
                    ),
            ),
            const Spacer(),
            CommonButtonWidget(
                onTap: () {
                  Get.toNamed(Routes.NEW_REGISTRATION, arguments: {
                    'students': controller.students,
                    'subjects': controller.subjects,
                  })!
                      .then((result) async {
                    await controller.getRegistrationList();
                  });
                },
                buttonColor: AppColors.transparentBlue,
                buttonText: 'New Registration',
                textColor: AppColors.blue)
          ],
        ),
      ),
    );
  }
}
