import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Bind the controller to the view
    Get.put(SplashController());

    return Scaffold(
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
