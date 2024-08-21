import 'package:flutter/cupertino.dart';

import '../../../infrastructure/theme/colors/app_colors.dart';

class RegDetailsWidget extends StatelessWidget {
  const RegDetailsWidget(
      {super.key,
      required this.heading,
      required this.subHeading,
      required this.details,
      required this.rightText});

  final String heading, subHeading, details, rightText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.all(10),
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
                heading,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              Text(
                subHeading,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
              Text(
                details,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Text(
            rightText,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
