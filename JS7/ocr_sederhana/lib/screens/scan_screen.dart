import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'result_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _cameraAvailable = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() => _cameraAvailable = false);
        return;
      }
      final camera = cameras.first;
      _controller = CameraController(camera, ResolutionPreset.medium);
      _initializeControllerFuture = _controller!.initialize();
      if (mounted) setState(() {});
    } catch (_) {
      if (mounted) {
        setState(() => _cameraAvailable = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Pemindaian Gagal! Periksa Izin Kamera atau coba lagi.'),
          ),
        );
      }
    }
  }

  Future<void> _takePicture() async {
    try {
      if (_controller == null || _initializeControllerFuture == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Pemindaian Gagal! Periksa Izin Kamera atau coba lagi.'),
          ),
        );
        return;
      }

      await _initializeControllerFuture;

      if (!mounted) return;

      if (!_controller!.value.isInitialized) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Pemindaian Gagal! Periksa Izin Kamera atau coba lagi.'),
          ),
        );
        return;
      }

      final XFile image = await _controller!.takePicture();

      // proses OCR dengan ML Kit
      final inputImage = InputImage.fromFilePath(image.path);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      await textRecognizer.close();

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            imagePath: image.path,
            recognizedText: recognizedText.text,
          ),
        ),
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Pemindaian Gagal! Periksa Izin Kamera atau coba lagi.'),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    try {
      _controller?.dispose();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraAvailable) {
      return Scaffold(
        appBar: AppBar(title: const Text('Pindai Teks')),
        body: const Center(
          child: Text('Kamera tidak tersedia. Periksa izin atau perangkat.'),
        ),
      );
    }

    if (_initializeControllerFuture == null) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(color: Colors.yellow),
              SizedBox(height: 16),
              Text(
                'Memuat Kamera... Harap tunggu.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Pindai Teks')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_controller == null) {
              return const Center(child: Text('Kamera tidak tersedia.'));
            }
            return CameraPreview(_controller!);
          } else if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: Colors.grey[900],
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(color: Colors.yellow),
                    SizedBox(height: 16),
                    Text(
                      'Memuat Kamera... Harap tunggu.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.grey[900],
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(color: Colors.yellow),
                    SizedBox(height: 16),
                    Text(
                      'Memuat Kamera... Harap tunggu.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
