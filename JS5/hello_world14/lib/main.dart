import 'package:flutter/material.dart';
import 'basic_widgets/text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 4 - Widget Dasar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 220, 132, 217),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Text Widget Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(title),
        centerTitle: true,
      ),
      body: const Center(
        // Menampilkan widget Text dari file text_widget.dart
        child: MyTextWidget(),
      ),
    );
  }
}
