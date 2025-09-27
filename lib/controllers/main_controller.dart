import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/views/skills_view.dart';
import 'package:portfolio/views/resume_view.dart';

import '../views/home_screen.dart';
import '../views/projects_screen.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [
    HomeView(),
    ProjectsView(),
    SkillsView(),
    ResumeView(),
    // ContactView(),
  ];

  void changePage(int index) {
    if (index >= 0 && index < pages.length) {
      currentIndex.value = index;
    }
  }
}
