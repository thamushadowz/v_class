import 'package:flutter/material.dart';
import 'package:v_class/infrastructure/theme/colors/app_colors.dart';

class ConferenceViewWidget extends StatelessWidget {
  const ConferenceViewWidget({super.key, required this.classSize});

  final int classSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(classSize ~/ 2,
                (index) => _iconWidget(image: 'assets/icons/sitting_ltr.png')),
          ),
          Container(
            width: 200,
            height: (classSize ~/ 2) * 55,
            color: AppColors.lightGrey, // Center container
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                classSize % 2 == 0 ? (classSize ~/ 2) : ((classSize ~/ 2) + 1),
                (index) => _iconWidget(image: 'assets/icons/sitting_rtl.png')),
          ),
        ],
      ),
    );
  }

  Widget _iconWidget({required String image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Image.asset(
        image,
        width: 30,
        height: 30,
      ),
    );
  }
}
