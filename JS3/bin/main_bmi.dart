import 'dart:io';
import 'bmi_input.dart';
import 'bmi_calc.dart';
import 'bmi_history.dart';
//afifah14
void main() {
final history = BmiHistory();

while (true) {
print("\n===== Kalkulator BMI =====");
print("1. Hitung BMI");
print("2. Lihat Riwayat");
print("3. Keluar");

stdout.write("Pilih menu: ");
String? pilihan = stdin.readLineSync();

switch (pilihan) {
case '1':
var input = getInput();
var hasil = hitungBMI(input['tinggi']!, input['berat']!);
print("BMI Anda: ${hasil['bmi'].toStringAsFixed(2)} – ${hasil['kategori']}");
history.tambah(hasil);
break;
case '2':
history.tampilkan();
break;
case '3':
print("Terima kasih! Keluar...");
return;
default:
print("Pilihan tidak valid. Silakan coba lagi.");
}
}
}