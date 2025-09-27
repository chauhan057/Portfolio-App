import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsView extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Game App',
      'description':
          'A beautiful game app built using Flutter and Flame. This game showcases smooth animations, real-time multiplayer support, and Firebase integration for storing user progress and leaderboards.',
      'link': 'https://github.com/chauhan057/flutter_with_flame_game',
      'image':
          'https://i.pinimg.com/736x/8f/81/aa/8f81aad8fa8b4528f291330af8e579f4.jpg',
      'tech': ['Flutter', 'GetX', 'Firebase', 'Flame'],
      'progress': 90,
    },
    {
      'title': 'Food Panda App',
      'description':
          'A full-stack Flutter e-commerce application with real-time tracking, multiple payment integrations, user authentication, and an admin dashboard to manage orders and customers.',
      'link': 'https://github.com/chauhan057/ApnaFoodPanda',
      'image':
          'https://i.pinimg.com/736x/ab/5b/f0/ab5bf05f7b7b9231a4460607e1e04904.jpg',
      'tech': ['Flutter', 'Kotlin', 'Firebase', 'Stripe', 'GetX'],
      'progress': 100,
    },
  ];

  void _launchURL(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  void _showProjectDetails(BuildContext context, Map<String, dynamic> project) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: project['title'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      project['image'],
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  project['title'],
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  project['description'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  children:
                      project['tech']
                          .map<Widget>(
                            (tech) => Chip(
                              label: Text(tech),
                              backgroundColor: Colors.deepPurple.shade100,
                            ),
                          )
                          .toList(),
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: project['progress'] / 100,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Colors.grey[300],
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () => _launchURL(project['link']),
                  icon: const Icon(Icons.open_in_browser, color: Colors.white),
                  label: const Text(
                    'Visit Project',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('My Projects', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return GestureDetector(
            onTap:
                () => _showProjectDetails(
                  context,
                  project,
                ), // Enabled project details
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: project['title'],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.network(
                        project['image'],
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          project['description'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 6,
                          children:
                              project['tech']
                                  .map<Widget>(
                                    (tech) => Chip(
                                      label: Text(tech),
                                      backgroundColor:
                                          Colors.deepPurple.shade50,
                                    ),
                                  )
                                  .toList(),
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: project['progress'] / 100,
                          minHeight: 8,
                          backgroundColor: Colors.grey[300],
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () => _launchURL(project['link']),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.open_in_new,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Open',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
