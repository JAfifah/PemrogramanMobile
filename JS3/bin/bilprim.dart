bool isPrime(int n) {
  if (n < 2) return false;
  if (n == 2) return true;
  if (n % 2 == 0) return false;
  for (int i = 3; i * i <= n; i += 2) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  // GANTI nilai ini sesuai nama lengkap dan NIM Anda
  const String fullName = 'Jamiatul Afifah';
  const String nim = '2341760102';

  for (int n = 0; n <= 201; n++) {
    if (isPrime(n)) {
      print('Prime found: $n  —  Nama: $fullName  NIM: $nim');
    }
  }
}
