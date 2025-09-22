void main() {
  for (int index = 10; index < 27; index++) {
    if (index == 21) break;                // hentikan loop sepenuhnya saat index == 21
    else if (index > 1 && index < 17) continue; // lewati iterasi untuk index < 17
    print(index);
  }
}
