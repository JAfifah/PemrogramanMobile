void main() {
  // Berat (kg) dan tinggi (m) ditentukan dalam variabel
  double berat = 48;
  double tinggi = 1.58;

  // Rumus BMI = berat / (tinggi^2)
  double bmi = berat / (tinggi * tinggi);

  print("=== Program BMI ===");
  print("Berat: ${berat}kg, Tinggi: ${tinggi}m");
  print("BMI Anda adalah: ${bmi.toStringAsFixed(2)}");

  // Kategori BMI menggunakan ternary operator
  String kategori = (bmi < 18.5)
      ? "Berat badan kurang"
      : (bmi < 24.9)
          ? "Normal"
          : (bmi < 29.9)
              ? "Kelebihan berat badan"
              : "Obesitas";

  print("Kategori: $kategori");
}
