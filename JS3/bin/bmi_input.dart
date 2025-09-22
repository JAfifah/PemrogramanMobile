import 'dart:io';

// afifah14
/// Fungsi untuk meminta input tinggi dan berat badan dari user
Map<String, double> getInput() {
stdout.write('Masukkan tinggi badan (cm): ');
double tinggi = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

stdout.write('Masukkan berat badan (kg): ');
double berat = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

return {'tinggi': tinggi, 'berat': berat};
}
