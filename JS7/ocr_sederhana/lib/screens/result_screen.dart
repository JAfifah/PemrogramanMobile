// lib/screens/result_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final String imagePath;
  final String recognizedText;

  const ResultScreen({
    super.key,
    required this.imagePath,
    required this.recognizedText,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late FlutterTts _flutterTts;
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _flutterTts = FlutterTts();
    _initTts();
  }

  Future<void> _initTts() async {
    try {
      await _flutterTts.setLanguage('id-ID');
      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.setPitch(1.0);
    } catch (e) {
      debugPrint("Gagal inisialisasi TTS: $e");
    }
  }

  Future<void> _speak() async {
    if (widget.recognizedText.trim().isEmpty) return;
    try {
      setState(() => _isSpeaking = true);
      await _flutterTts.speak(widget.recognizedText);
    } catch (e) {
      debugPrint("Gagal membacakan teks: $e");
    } finally {
      setState(() => _isSpeaking = false);
    }
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  void _goHomeAndClearStack() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil OCR'),
        backgroundColor: Color.fromARGB(255, 234, 147, 248),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.imagePath.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(File(widget.imagePath)),
              ),
            const SizedBox(height: 16),
            Text(
              widget.recognizedText.isEmpty
                  ? 'Tidak ada teks terdeteksi.'
                  : widget.recognizedText,
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'tts_btn',
            onPressed: _isSpeaking ? null : _speak,
            tooltip: 'Bacakan Teks',
            backgroundColor: const Color.fromARGB(255, 234, 147, 248),
            child: const Icon(Icons.volume_up),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'home_btn',
            onPressed: _goHomeAndClearStack,
            tooltip: 'Kembali ke Home',
            backgroundColor: Color.fromARGB(255, 234, 147, 248),
            child: const Icon(Icons.home),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
