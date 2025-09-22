/// Menyimpan dan menampilkan riwayat BMI
class BmiHistory {
final List<Map<String, dynamic>> _riwayat = [];

void tambah(Map<String, dynamic> data) {
_riwayat.add(data);
}

void tampilkan() {
if (_riwayat.isEmpty) {
print("Belum ada riwayat perhitungan.");
return;
}
//afifah14
print("\n===== Riwayat Perhitungan BMI =====");
for (var i = 0; i < _riwayat.length; i++) {
var r = _riwayat[i];
print(
"${i + 1}. Tinggi: ${r['tinggi']} cm, Berat: ${r['berat']} kg, BMI: ${r['bmi'].toStringAsFixed(2)}, Kategori: ${r['kategori']}");
}
}
}