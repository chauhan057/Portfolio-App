import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ResumeView extends StatefulWidget {
  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView> {
  final String resumeUrl = 'https://drive.google.com/uc?export=download&id=1fsFcbvAw4S2j5HOfzKFptZVFr8cGdEgb';
  bool isDownloading = false;

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;

    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      status = await Permission.storage.request();
    }

    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Storage permission is required to download.")),
      );
      return;
    }

    downloadFile();
  }

  Future<void> downloadFile() async {
    setState(() {
      isDownloading = true;
    });

    try {
      // Get directory to save the file
      final dir = await getExternalStorageDirectory();  // For Android 10+
      String filePath = '${dir!.path}/Resume.pdf';

      // Download the file
      Dio dio = Dio();
      await dio.download(resumeUrl, filePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Downloaded to: $filePath")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to download: $e")),
      );
    } finally {
      setState(() {
        isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resume', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.network(resumeUrl),
          ),
        ],
      ),
    );
  }
}
