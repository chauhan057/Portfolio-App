import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/routes/routes.dart';
import 'package:portfolio/screens/main_screen.dart';
import 'package:portfolio/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
      // home: SplashScreen(),
      // initialRoute: '/splash',
      // getPages: [
      //   GetPage(name: '/splash', page: () => const SplashScreen()),
      //   GetPage(name: '/next', page: () => const MainScreen()),
      // ],
    );
  }
}