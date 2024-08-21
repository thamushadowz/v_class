import 'package:flutter/cupertino.dart';
import 'package:v_class/infrastructure/theme/colors/app_colors.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.mainText,
    required this.subText,
    required this.rightText,
  });

  final String mainText, subText, rightText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                mainText,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              Text(
                subText,
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Text(
            rightText,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
