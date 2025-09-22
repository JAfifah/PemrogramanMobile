import 'dart:io';
import 'factorial.dart';
import 'prime.dart';
import 'guess_game.dart';

void main() {
  while (true) {
    print("\n=== Menu ===");
    print("1. Faktorial");
    print("2. Cek Bilangan Prima");
    print("3. Game Tebak Angka");
    print("4. Keluar");
    stdout.write("Pilih menu: ");

    String? pilihan = stdin.readLineSync();
    if (pilihan == null) continue;

    switch (pilihan) {
      case "1":
        stdout.write("Masukkan angka: ");
        int n = int.parse(stdin.readLineSync()!);
        print("$n! = ${factorial(n)}");
        break;
      case "2":
        stdout.write("Masukkan angka: ");
        int n = int.parse(stdin.readLineSync()!);
        print("$n ${isPrime(n) ? "adalah" : "bukan"} bilangan prima");
        break;
      case "3":
        playGuessGame();
        break;
      case "4":
        print("Keluar program...");
        return;
      default:
        print("Pilihan tidak valid.");
    }
  }
}
