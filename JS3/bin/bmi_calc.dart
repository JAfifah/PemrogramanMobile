/// Fungsi untuk menghitung BMI dan mengembalikan kategori
Map<String, dynamic> hitungBMI(double tinggiCm, double beratKg) {
double tinggiM = tinggiCm / 100;
double bmi = beratKg / (tinggiM * tinggiM);
String kategori;
// afifah14

if (bmi < 18.5) {
kategori = "Kurus";
} else if (bmi < 25) {
kategori = "Normal";
} else if (bmi < 30) {
kategori = "Gemuk";
} else {
kategori = "Obesitas";
}


return {
'tinggi': tinggiCm,
'berat': beratKg,
'bmi': bmi,
'kategori': kategori
};
}