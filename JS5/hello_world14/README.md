# 🧩 Praktikum 4: Menerapkan Widget Dasar

## 👩‍💻 Langkah 1: Text Widget
Menampilkan teks sederhana menggunakan widget `Text()` pada Flutter.

### 📜 Kode:
```dart
import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Nama saya Jamiatul Afifah, sedang belajar Pemrograman Mobile",
      style: TextStyle(color: Colors.red, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}

![Hasil Text Widget](https://raw.githubusercontent.com/JAfifah/PemrogramanMobile/main/JS5/hello_world14/screenshots/text_widget_result.png)
