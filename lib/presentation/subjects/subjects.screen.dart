import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';
import '../common_widgets/common_list_view_widget.dart';
import 'controllers/subjects.controller.dart';

class SubjectsScreen extends GetView<SubjectsController> {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonListViewWidget(
      onTap: (index, item) {
        controller.isSelectOption ?? false
            ? controller.updateClassroomDetails(
                controller.itemId!, item.id.toString())
            : controller.isRegSelectOption ?? false
                ? Get.back(result: item)
                : Get.toNamed(Routes.SUBJECT_DETAIL, arguments: item);
      },
      heading: 'Subjects',
      itemList: controller.subjects,
      dataExtractor: (subject) {
        return {
          'mainText': subject.name ?? '',
          'subText': subject.teacher ?? '',
          'rightText': '${subject.credits?.toString()} Credit',
        };
      },
    );
  }
}
