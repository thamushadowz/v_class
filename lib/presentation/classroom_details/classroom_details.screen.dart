import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_class/presentation/classroom_details/widgets/classroom_view_widget.dart';
import 'package:v_class/presentation/classroom_details/widgets/conference_view_widget.dart';
import 'package:v_class/presentation/common_widgets/common_app_bar.dart';
import 'package:v_class/presentation/common_widgets/common_button_widget.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors/app_colors.dart';
import 'controllers/classroom_details.controller.dart';

class ClassroomDetailsScreen extends GetView<ClassroomDetailsController> {
  const ClassroomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Obx(() {
          final item = controller.item.value;

          return Column(
            children: [
              Text(
                item.name ?? "",
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lightGrey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.subject == '' || item.subject == null
                              ? 'Add Subject'
                              : controller
                                      .findSubject(item.subject.toString())
                                      ?.name ??
                                  '',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        item.subject == '' || item.subject == null
                            ? const SizedBox()
                            : Text(
                                controller
                                        .findSubject(item.subject.toString())
                                        ?.teacher ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                      ],
                    ),
                    CommonButtonWidget(
                        onTap: () {
                          Get.toNamed(Routes.SUBJECTS, arguments: {
                            'isSelectOption': true,
                            'itemId': item.id!.toInt(),
                            'subjects': controller.subjects
                          })!
                              .then((result) {
                            if (result != null) {
                              controller.item.value = result;
                            }
                          });
                        },
                        buttonColor: AppColors.lightGreen,
                        buttonText: item.subject == '' || item.subject == null
                            ? 'Add'
                            : 'Change',
                        textColor: AppColors.green)
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: item.layout!.toLowerCase() == 'conference'
                        ? ConferenceViewWidget(classSize: item.size!.toInt())
                        : ClassroomViewWidget(noOfItems: item.size!.toInt()),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
