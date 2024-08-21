import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_class/infrastructure/navigation/routes.dart';

import '../common_widgets/common_list_view_widget.dart';
import 'controllers/students.controller.dart';

class StudentsScreen extends GetView<StudentsController> {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonListViewWidget(
        onTap: (index, item) {
          controller.isSelectOption ?? false
              ? Get.back(result: item)
              : Get.toNamed(Routes.STUDENT_DETAILS, arguments: item);
        },
        itemList: controller.students,
        heading: 'Students',
        dataExtractor: (student) {
          return {
            'mainText': student.name ?? '',
            'subText': student.email ?? '',
            'rightText': 'Age : ${student.age?.toString()}',
          };
        },
      ),
    );
  }
}
