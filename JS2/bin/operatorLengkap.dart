// Program simulasi nilai mahasiswa
void main() {
  print("=== Studi Kasus Operator di Dart ===");

  // -----------------------------
  // 1. Operator Aritmatika
  // -----------------------------
  int tugas = 80;
  int uts = 75;
  int uas = 90;

  double rataRata = (tugas + uts + uas) / 3;
  print("\n[1] Operator Aritmatika");
  print("Nilai Tugas + UTS + UAS = ${tugas + uts + uas}");
  print("Rata-rata = $rataRata");

  // -----------------------------
  // 2. Operator Increment & Decrement
  // -----------------------------
  int presensi = 10;
  print("\n[2] Operator Increment & Decrement");
  print("Presensi awal = $presensi");
  print("Presensi++ = ${presensi++} (setelah itu: $presensi)");
  print("++Presensi = ${++presensi} (sekarang: $presensi)");
  print("Presensi-- = ${presensi--} (setelah itu: $presensi)");

  // -----------------------------
  // 3. Operator Relasional
  // -----------------------------
  print("\n[3] Operator Relasional");
  print("Apakah rata-rata > 75? ${rataRata > 75}");
  print("Apakah UTS == UAS? ${uts == uas}");
  print("Apakah Tugas < UAS? ${tugas < uas}");

  // -----------------------------
  // 4. Operator Logika
  // -----------------------------
  bool aktif = true;
  bool lulus = rataRata >= 70;
  print("\n[4] Operator Logika");
  print("Mahasiswa aktif DAN lulus? ${aktif && lulus}");
  print("Mahasiswa aktif ATAU lulus? ${aktif || lulus}");
  print("Mahasiswa TIDAK aktif? ${!aktif}");

  // -----------------------------
  // 5. Operator Penugasan
  // -----------------------------
  int bonus = 5;
  print("\n[5] Operator Penugasan");
  bonus += 10; // sama dengan bonus = bonus + 10
  print("Bonus setelah += 10 : $bonus");
  bonus *= 2; // sama dengan bonus = bonus * 2
  print("Bonus setelah *= 2 : $bonus");

  // -----------------------------
  // 6. Operator Null-aware
  // -----------------------------
  String? keterangan; // null secara default
  String hasil = keterangan ?? "Belum ada keterangan";
  print("\n[6] Operator Null-aware");
  print("Keterangan: $hasil");

  // -----------------------------
  // 7. Operator Type Test
  // -----------------------------
  print("\n[7] Operator Type Test");
  print("Apakah rataRata bertipe double? ${rataRata is double}");
  print("Apakah uts bukan bertipe String? ${uts is! String}");

  // -----------------------------
  // 8. Operator Kondisional (Ternary)
  // -----------------------------
  print("\n[8] Operator Kondisional (Ternary)");
  String status = (rataRata >= 70) ? "Lulus" : "Tidak Lulus";
  print("Status mahasiswa: $status");

  // -----------------------------
  // 9. Operator Bitwise
  // -----------------------------
  int x = 6; // 0110 (biner)
  int y = 3; // 0011 (biner)
  print("\n[9] Operator Bitwise");
  print("x & y = ${x & y}"); // AND
  print("x | y = ${x | y}"); // OR
  print("x ^ y = ${x ^ y}"); // XOR
  print("~x = ${~x}");       // NOT
  print("x << 1 = ${x << 1}"); // geser kiri
  print("x >> 1 = ${x >> 1}"); // geser kanan

  // -----------------------------
  // 10. Prioritas Operator
  // -----------------------------
  print("\n[10] Prioritas Operator");
  int hasilPrioritas = 2 + 3 * 4; // perkalian lebih dulu
  print("2 + 3 * 4 = $hasilPrioritas");
  hasilPrioritas = (2 + 3) * 4; // kurung lebih prioritas
  print("(2 + 3) * 4 = $hasilPrioritas");
}
