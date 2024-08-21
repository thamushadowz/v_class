import 'package:flutter/material.dart';

class CategoryTileWidget extends StatelessWidget {
  const CategoryTileWidget(
      {super.key,
      required this.color,
      required this.image,
      required this.title,
      required this.onTap});

  final Color color;
  final String image;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 35,
              height: 35,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
