// Program Konversi Mata Uang
void main() {
  double rupiah = 15000; // contoh uang dalam Rupiah

  // Kurs contoh (bisa diubah sesuai data terbaru)
  double kursUSD = 15500; // 1 USD = 15.500 IDR
  double kursEUR = 16500; // 1 EUR = 16.500 IDR
  double kursJPY = 110;   // 1 JPY = 110 IDR

  double usd = rupiah / kursUSD;
  double eur = rupiah / kursEUR;
  double jpy = rupiah / kursJPY;

  print("=== Konversi Mata Uang ===");
  print("Rp${rupiah.toStringAsFixed(0)} setara dengan:");
  print("- ${usd.toStringAsFixed(2)} USD");
  print("- ${eur.toStringAsFixed(2)} EUR");
  print("- ${jpy.toStringAsFixed(2)} JPY");
}
