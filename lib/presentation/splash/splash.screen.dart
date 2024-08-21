import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_class/infrastructure/navigation/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.HOME); // Replace with your home screen
    });

    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/v_class.png'),
      ),
    );
  }
}
