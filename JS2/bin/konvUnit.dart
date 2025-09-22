// Aplikasi Konversi Unit dengan Map
void main() {
  print("=== Aplikasi Konversi Unit ===");

  // --------------------------
  // 1. Konversi Panjang
  // --------------------------
  double panjang = 20.5; // meter
  Map<String, double> panjangMap = {
    "meter": 1.0,
    "kilometer": 0.001,
    "sentimeter": 100.0,
    "milimeter": 1000.0,
    "inci": 39.37
  };

  print("\n[Konversi Panjang]");
  panjang = (panjang < 0) ? 0 : panjang; // validasi pakai ternary
  panjangMap.forEach((unit, faktor) {
    print("- ${(panjang * faktor).toStringAsFixed(2)} $unit");
  });

  // --------------------------
  // 2. Konversi Massa
  // --------------------------
  double massa = 50.0; // kilogram
  Map<String, double> massaMap = {
    "kilogram": 1.0,
    "gram": 1000.0,
    "miligram": 1000000.0,
    "pon": 2.20462,
    "ons": 10.0
  };

  print("\n[Konversi Massa]");
  massa = (massa < 0) ? 0 : massa;
  massaMap.forEach((unit, faktor) {
    print("- ${(massa * faktor).toStringAsFixed(2)} $unit");
  });

  // --------------------------
  // 3. Konversi Volume
  // --------------------------
  double volume = 30.0; // liter
  Map<String, double> volumeMap = {
    "liter": 1.0,
    "mililiter": 1000.0,
    "meter kubik": 0.001,
    "gallon": 0.264172,
    "cc": 1000.0
  };

  print("\n[Konversi Volume]");
  volume = (volume < 0) ? 0 : volume;
  volumeMap.forEach((unit, faktor) {
    print("- ${(volume * faktor).toStringAsFixed(2)} $unit");
  });

  // --------------------------
  // 4. Konversi Suhu
  // --------------------------
  double celcius = 250.0;
  print("\n[Konversi Suhu]");
  celcius = (celcius < -273.15) ? -273.15 : celcius; // tidak boleh di bawah 0 Kelvin
  print("- Celcius: ${celcius.toStringAsFixed(2)} °C");
  print("- Fahrenheit: ${(celcius * 9 / 5 + 32).toStringAsFixed(2)} °F");
  print("- Kelvin: ${(celcius + 273.15).toStringAsFixed(2)} K");
  print("- Reamur: ${(celcius * 4 / 5).toStringAsFixed(2)} °Re");
  print("- Rankine: ${((celcius + 273.15) * 9 / 5).toStringAsFixed(2)} °R");

  // --------------------------
  // 5. Konversi Waktu
  // --------------------------
  double detik = 3600.0; // detik
  Map<String, double> waktuMap = {
    "detik": 1.0,
    "menit": 1 / 60,
    "jam": 1 / 3600,
    "hari": 1 / 86400,
    "minggu": 1 / 604800
  };

  print("\n[Konversi Waktu]");
  detik = (detik < 0) ? 0 : detik;
  waktuMap.forEach((unit, faktor) {
    print("- ${(detik * faktor).toStringAsFixed(4)} $unit");
  });
}
