import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/widgets/title_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          TitleWidget(text: "Main Screen", backgroundColor: AppColors.titleBgColor, textColor: AppColors.white,),
          const Center(
            child: Text('Welcome to the main screen!'),
          ),
        ],
      ),
    );
  }
}
