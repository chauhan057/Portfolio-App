import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final String githubUrl = 'https://github.com/yourgithub';
  final String linkedinUrl = 'https://linkedin.com/in/yourlinkedin';
  final String youtubeUrl = 'https://youtube.com/yourchannel';
  final String phoneNumber = '+1234567890';
  final String emailAddress = 'youremail@example.com';

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Add your profile image
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your Name',
                  style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 24),
                _buildContactInfo(),
                const SizedBox(height: 24),
                _buildContactForm(context),
                const SizedBox(height: 24),
                _buildSocialMediaSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Card(
      elevation: 4,
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.email, color: Colors.deepPurple),
              title: Text(emailAddress),
              onTap: () => _launchURL('mailto:$emailAddress'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.deepPurple),
              title: Text(phoneNumber),
              onTap: () => _launchURL('tel:$phoneNumber'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildTextField(nameController, 'Name', Icons.person),
            const SizedBox(height: 16),
            _buildTextField(emailController, 'Email', Icons.email),
            const SizedBox(height: 16),
            _buildTextField(messageController, 'Message', Icons.message, maxLines: 4),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text('Send Message'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                if (nameController.text.isEmpty || emailController.text.isEmpty) {
                  Get.snackbar('Error', 'Please fill all fields!',
                      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
                } else {
                  Get.snackbar('Success', 'Message sent successfully!',
                      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
                  nameController.clear();
                  emailController.clear();
                  messageController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildSocialMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Connect with me', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialButton(Icons.code, 'GitHub', githubUrl, Colors.black),
            _buildSocialButton(Icons.business_center, 'LinkedIn', linkedinUrl, Colors.blue),
            _buildSocialButton(Icons.video_library, 'YouTube', youtubeUrl, Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String label, String url, Color color) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: color, size: 32),
          onPressed: () => _launchURL(url),
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
