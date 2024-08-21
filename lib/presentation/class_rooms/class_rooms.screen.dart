import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';
import '../common_widgets/common_list_view_widget.dart';
import 'controllers/class_rooms.controller.dart';

class ClassRoomsScreen extends GetView<ClassRoomsController> {
  const ClassRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonListViewWidget(
        onTap: (index, item) async {
          await controller.getClassroomDetails(item.id);
          Get.toNamed(Routes.CLASSROOM_DETAILS, arguments: {
            'details': controller.details,
            'subjects': controller.subjects
          });
        },
        heading: 'Class Rooms',
        itemList: controller.classrooms,
        dataExtractor: (subject) {
          return {
            'mainText': subject.name ?? '',
            'subText': subject.layout ?? '',
            'rightText': '${subject.size?.toString()} Seats',
          };
        },
      ),
    );
  }
}
