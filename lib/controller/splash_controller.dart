import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    // Hide the system UI
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/next'); // Navigate to the next screen and remove SplashScreen from the stack
    });
  }

  // @override
  // void onClose() {
  //   // Restore the system UI
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //   super.onClose();
  // }
}
