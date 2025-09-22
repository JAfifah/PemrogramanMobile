// afifah14

import 'dart:io';
import 'dart:math';

void playGuessGame() {
  final rnd = Random();
  final int secret = rnd.nextInt(100) + 1;
  int attempts = 0;

  print("\n=== Game Tebak Angka ===");
  print("Saya sudah memilih angka 1-100. Coba tebak!");

  while (true) {
    stdout.write("Masukkan tebakan (q untuk keluar): ");
    String? input = stdin.readLineSync();
    if (input == null) continue;

    if (input.toLowerCase() == "q") {
      print("Kamu keluar. Jawabannya: $secret");
      break;
    }

    int guess;
    try {
      guess = int.parse(input);
    } catch (_) {
      print("Masukkan harus berupa angka!");
      continue;
    }

    attempts++;
    if (guess == secret) {
      print("Benar! Kamu butuh $attempts percobaan.");
      break;
    } else if (guess < secret) {
      print("Terlalu kecil!");
    } else {
      print("Terlalu besar!");
    }
  }
}
