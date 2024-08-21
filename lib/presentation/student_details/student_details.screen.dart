import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/common_details_view_widget.dart';
import 'controllers/student_details.controller.dart';

class StudentDetailsScreen extends GetView<StudentDetailsController> {
  const StudentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonDetailsViewWidget(
        heading: 'Student Detail',
        profileImage: 'assets/images/v_class.png',
        mainText: controller.item.name ?? '',
        midText: 'Age : ${controller.item.age}',
        subText: controller.item.email ?? '');
  }
}
