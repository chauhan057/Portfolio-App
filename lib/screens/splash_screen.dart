import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Bind the controller to the view
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.black,
              AppColors.bgColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Obx(
                () => Stack(
              alignment: Alignment.center,
              children: [
                // Animated Icon (slides down into the center)
                Transform.translate(
                  offset: Offset(0, controller.iconOffset.value),
                  child: Icon(
                    Icons.star,
                    color: Color(0xFFD4AF37),
                    size: 100,
                  ),
                ),

                // Animated Text (slides up into the center)
                Transform.translate(
                  offset: Offset(0, controller.textOffset.value),
                  child: Text(
                    AppStrings.userName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD4AF37),
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
