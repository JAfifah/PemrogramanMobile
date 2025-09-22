// afifah14

import 'dart:math';

bool isPrime(int n) {
  if (n < 2) return false;
  if (n == 2) return true;
  if (n % 2 == 0) return false;

  int limit = sqrt(n).floor();
  for (int i = 3; i <= limit; i += 2) {
    if (n % i == 0) return false;
  }
  return true;
}
