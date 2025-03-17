import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsView extends StatelessWidget {
  final List<Map<String, dynamic>> skills = [
    {
      'skill': 'Flutter',
      'level': 0.9,
      'icon': Icons.flutter_dash,
      'description': 'Cross-platform framework for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.'
    },
    {
      'skill': 'Dart',
      'level': 0.85,
      'icon': Icons.code,
      'description': 'Modern, optimized language for building fast apps on any platform. It is the backbone of Flutter development.'
    },
    {
      'skill': 'Kotlin',
      'level': 0.8,
      'icon': Icons.android,
      'description': 'Official language for Android development, known for its concise syntax, null safety, and interoperability with Java.'
    },
    {
      'skill': 'Java',
      'level': 0.75,
      'icon': Icons.coffee,
      'description': 'Robust, object-oriented language used for Android apps, server-side development, and enterprise-level solutions.'
    },
    {
      'skill': 'GetX',
      'level': 0.8,
      'icon': Icons.widgets,
      'description': 'Powerful Flutter package for state management, navigation, and dependency injection, providing minimal boilerplate code and high performance.'
    },
    {
      'skill': 'Firebase',
      'level': 0.9,
      'icon': Icons.storage,
      'description': 'Comprehensive app development platform with tools for authentication, real-time databases, analytics, and cloud functions.'
    },
    {
      'skill': 'Analytics',
      'level': 0.7,
      'icon': Icons.analytics,
      'description': 'Expertise in using Google Analytics and Firebase Analytics to monitor app performance and user engagement.'
    },
    {
      'skill': 'Flame',
      'level': 0.8,
      'icon': Icons.games,
      'description': 'Game engine for Flutter, providing a simple and effective way to develop 2D games with smooth performance and rich features.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'My Skills',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Skill Cards with Descriptions
                Column(
                  children: skills.map((skill) => _buildSkillCard(skill, context)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Skill Card Widget with Expanded Description
  Widget _buildSkillCard(Map<String, dynamic> skill, BuildContext context) {
    return GestureDetector(
      onTap: () => _showSkillDetailDialog(context, skill),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.deepPurple.shade50,
                child: Icon(skill['icon'], color: Colors.deepPurple),
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
                        color: Colors.deepPurple,
                        backgroundColor: Colors.deepPurple.shade100,
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
      ),
    );
  }

  // Skill Detail Dialog
  void _showSkillDetailDialog(BuildContext context, Map<String, dynamic> skill) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(skill['icon'], color: Colors.deepPurple),
            const SizedBox(width: 10),
            Text(skill['skill']),
          ],
        ),
        content: Text(
          skill['description'],
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close', style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}
