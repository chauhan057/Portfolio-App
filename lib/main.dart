import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyPortfolioApp());
}

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  void toggleTheme() => isDarkMode.value = !isDarkMode.value;
}

class MyPortfolioApp extends StatelessWidget {
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: themeController.isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
      initialRoute: AppRoutes.main,
      getPages: AppRoutes.routes,
    ));
  }
}
