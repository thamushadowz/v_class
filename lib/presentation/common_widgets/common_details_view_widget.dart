import 'package:flutter/material.dart';

import 'common_app_bar.dart';

class CommonDetailsViewWidget extends StatelessWidget {
  const CommonDetailsViewWidget(
      {super.key,
      required this.heading,
      required this.profileImage,
      required this.mainText,
      required this.midText,
      required this.subText});

  final String heading, profileImage, mainText, midText, subText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              heading,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: Image.asset(
                      profileImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    mainText,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    midText,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    subText,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
