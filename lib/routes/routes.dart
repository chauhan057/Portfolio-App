import 'package:get/get.dart';
import 'package:portfolio/screens/main_screen.dart';

import '../screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String next = '/next';

  static List<GetPage> pages = [

    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: next, page: () => const MainScreen()),

  ];
}
