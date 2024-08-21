import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget(
      {super.key,
      required this.onTap,
      required this.buttonColor,
      required this.buttonText,
      required this.textColor});

  final String buttonText;
  final Color buttonColor, textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: buttonColor),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
