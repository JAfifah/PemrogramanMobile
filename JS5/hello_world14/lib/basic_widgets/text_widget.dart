import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Nama saya Jamiatul Afifah, sedang belajar Pemrograman Mobile",
      style: TextStyle(color: Color.fromARGB(255, 244, 54, 206), fontSize: 14),
      textAlign: TextAlign.center,
    ); // afifah14
  }
}
