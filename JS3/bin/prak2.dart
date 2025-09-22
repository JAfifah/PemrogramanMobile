void main() {
  int counter = 0;

  // while: cek kondisi sebelum eksekusi
  while (counter < 33) {
    print(counter);
    counter++;
  }

  // do-while: selalu eksekusi minimal 1x, lalu cek kondisi
  do {
    print(counter);
    counter++;
  } while (counter < 77);
}
