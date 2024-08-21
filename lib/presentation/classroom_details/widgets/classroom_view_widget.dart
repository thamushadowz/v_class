import 'package:flutter/material.dart';

import '../../../infrastructure/theme/colors/app_colors.dart';

class ClassroomViewWidget extends StatelessWidget {
  const ClassroomViewWidget({super.key, required this.noOfItems});
  final int noOfItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1,
            ),
            itemCount: noOfItems,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                ),
                child: Image.asset(
                  'assets/icons/sitting_ltr.png',
                  width: 30,
                  height: 30,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
