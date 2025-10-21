import 'dart:io';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String imagePath;
  final String recognizedText;

  const ResultScreen({
    super.key,
    required this.imagePath,
    required this.recognizedText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil OCR')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.file(File(imagePath)),
            const SizedBox(height: 16),
            Text(
              recognizedText.isEmpty
                  ? 'Tidak ada teks terdeteksi.'
                  : recognizedText,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
