import 'package:flutter/material.dart';

import '../../infrastructure/theme/colors/app_colors.dart';

class RegistrationSelectItemWidget extends StatelessWidget {
  const RegistrationSelectItemWidget(
      {super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
