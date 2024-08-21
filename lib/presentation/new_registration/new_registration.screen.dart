import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors/app_colors.dart';
import '../common_widgets/common_app_bar.dart';
import '../common_widgets/common_button_widget.dart';
import '../common_widgets/registration_select_item_widget.dart';
import 'controllers/new_registration.controller.dart';

class NewRegistrationScreen extends GetView<NewRegistrationController> {
  const NewRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
        child: Column(
          children: [
            const Text(
              'New Registration',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Obx(
              () => RegistrationSelectItemWidget(
                  title: controller.selectStudent.value,
                  onTap: () {
                    Get.toNamed(Routes.STUDENTS, arguments: {
                      'isSelectOption': true,
                      'students': controller.students,
                    })!
                        .then((result) {
                      print('student : ${result.id} - ${result.name}');
                      controller.selectStudent.value = result.name;
                      controller.studentId.value = result.id.toString();
                    });
                  }),
            ),
            Obx(
              () => RegistrationSelectItemWidget(
                  title: controller.selectSubject.value,
                  onTap: () {
                    Get.toNamed(Routes.SUBJECTS, arguments: {
                      'isRegSelectOption': true,
                      'subjects': controller.subjects,
                    })!
                        .then((result) {
                      print('subjecttt : ${result.id} - ${result.name}');
                      controller.selectSubject.value = result.name;
                      controller.subjectId.value = result.id.toString();
                    });
                  }),
            ),
            const SizedBox(height: 20),
            CommonButtonWidget(
                onTap: () {
                  controller.registerNew(
                      controller.subjectId.value, controller.studentId.value);
                },
                buttonColor: AppColors.green,
                buttonText: 'Register',
                textColor: AppColors.white)
          ],
        ),
      ),
    );
  }
}
