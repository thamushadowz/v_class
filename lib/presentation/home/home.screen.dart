import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_class/presentation/home/widgets/category_tile_widget.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors/app_colors.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  child: Image.asset(
                    'assets/images/v_class.png',
                  ),
                ),
                Divider(
                  height: 30,
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: AppColors.lightGrey,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    _drawerAndGreetWidget(context),
                    const SizedBox(height: 20),
                    _detailTileWrapWidget(),
                  ],
                ),
              )),
      ),
    );
  }

  Wrap _detailTileWrapWidget() {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        CategoryTileWidget(
          color: AppColors.lightGreen,
          image: 'assets/icons/student.png',
          title: 'Students',
          onTap: () {
            Get.toNamed(Routes.STUDENTS,
                arguments: {'students': controller.students});
          },
        ),
        CategoryTileWidget(
          color: AppColors.lightBlue,
          image: 'assets/icons/subject.png',
          title: 'Subjects',
          onTap: () {
            Get.toNamed(Routes.SUBJECTS,
                arguments: {'subjects': controller.subjects});
          },
        ),
        CategoryTileWidget(
          color: AppColors.lightRed,
          image: 'assets/icons/class.png',
          title: 'Class Rooms',
          onTap: () {
            Get.toNamed(Routes.CLASS_ROOMS, arguments: {
              'classrooms': controller.classrooms,
              'subjects': controller.subjects
            });
          },
        ),
        CategoryTileWidget(
          color: AppColors.lightYellow,
          image: 'assets/icons/registration.png',
          title: 'Registration',
          onTap: () {
            Get.toNamed(Routes.REGISTRATION, arguments: {
              'students': controller.students,
              'subjects': controller.subjects,
              'registrations': controller.registrations
            });
          },
        ),
      ],
    );
  }

  Container _drawerAndGreetWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello,',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Text(
                  'Good Day',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, bottom: 30),
            child: InkWell(
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                child: const Icon((Icons.dehaze_outlined))),
          )
        ],
      ),
    );
  }
}
