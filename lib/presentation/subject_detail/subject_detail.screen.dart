import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/common_details_view_widget.dart';
import 'controllers/subject_detail.controller.dart';

class SubjectDetailScreen extends GetView<SubjectDetailController> {
  const SubjectDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CommonDetailsViewWidget(
        heading: 'Subject Detail',
        profileImage: 'assets/images/v_class.png',
        mainText: controller.item.name ?? '',
        midText: controller.item.teacher ?? '',
        subText: '${controller.item.credits} Credit');
  }
}
