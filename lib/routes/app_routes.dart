import 'package:get/get.dart';
import 'package:portfolio/views/main_screen.dart';
import '../views/contact_screen.dart';
import '../views/home_screen.dart';
import '../views/projects_screen.dart';
import '../views/resume_view.dart';
import '../views/skills_view.dart';

class AppRoutes {
  static const main = '/';
  static const home = '/home';
  static const projects = '/projects';
  static const skills = '/skills';
  static const resume = '/resume';
  static const contact = '/contact';

  static final routes = [
    GetPage(name: main, page: () => MainScreen()),
    GetPage(name: home, page: () => HomeView()),
    GetPage(name: projects, page: () => ProjectsView()),
    GetPage(name: skills, page: () => SkillsView()),
    GetPage(name: resume, page: () => ResumeView()),
    GetPage(name: contact, page: () => ContactView()),
  ];
}
