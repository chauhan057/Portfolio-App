import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsView extends StatelessWidget {
  final List<Map<String, dynamic>> skills = [
    {'skill': 'Flutter', 'level': 0.9, 'icon': Icons.flutter_dash},
    {'skill': 'Dart', 'level': 0.85, 'icon': Icons.code},
    {'skill': 'Kotlin', 'level': 0.8, 'icon': Icons.android},
    {'skill': 'Java', 'level': 0.75, 'icon': Icons.coffee},
    {'skill': 'GetX', 'level': 0.8, 'icon': Icons.widgets},
    {'skill': 'Firebase', 'level': 0.9, 'icon': Icons.storage},
    {'skill': 'Analytics', 'level': 0.7, 'icon': Icons.analytics},
    {'skill': 'Flame', 'level': 0.8, 'icon': Icons.games},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('My Skills',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
height: Get.height,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // Skill Cards
                Column(
                  children: skills.map((skill) => _buildSkillCard(skill)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Skill Card Widget
  Widget _buildSkillCard(Map<String, dynamic> skill) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade50,
              child: Icon(skill['icon'], color: Colors.blue),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill['skill'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(seconds: 1),
                    tween: Tween(begin: 0, end: skill['level']),
                    builder: (context, value, _) => LinearProgressIndicator(
                      value: value,
                      color: Colors.blue,
                      backgroundColor: Colors.blue.shade100,
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text('${(skill['level'] * 100).toInt()}%'),
          ],
        ),
      ),
    );
  }
}
