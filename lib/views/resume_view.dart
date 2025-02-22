import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeView extends StatefulWidget {
  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView> {
  final String resumeUrl = 'https://drive.google.com/uc?export=download&id=1PWtPhTzZUFEw6ea5_x-aOxIG2nrOSFSX';

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resume', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.network(resumeUrl),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: ElevatedButton.icon(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.deepOrangeAccent,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(16),
          //       ),
          //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          //     ),
          //     onPressed: () => _launchURL("https://drive.google.com/file/d/1PWtPhTzZUFEw6ea5_x-aOxIG2nrOSFSX/view"),
          //     icon: const Icon(Icons.download, color: Colors.white),
          //     label: const Text(
          //       'Download Resume',
          //       style: TextStyle(color: Colors.white, fontSize: 16),
          //     ),
          //   ),
          // ),
        ],

      ),
    );
  }
}
