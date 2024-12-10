import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> iconAnimation;
  late Animation<double> textAnimation;

  // Observable values for animation offsets
  var iconOffset = 0.0.obs;
  var textOffset = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    // Initialize the AnimationController
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define the animation for the icon (from top)
    iconAnimation = Tween<double>(begin: -175, end: 10).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    )..addListener(() {
      iconOffset.value = iconAnimation.value;
    });

    // Define the animation for the text (from bottom)
    textAnimation = Tween<double>(begin: 200, end: 100).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInToLinear,
      ),
    )..addListener(() {
      textOffset.value = textAnimation.value;
    });

    // Start the animations
    animationController.forward();

    // Navigate to the next screen after the animation completes
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed('/next');
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
