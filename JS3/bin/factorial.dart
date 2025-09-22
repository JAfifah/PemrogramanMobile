// Fungsi untuk menghitung faktorial menggunakan perulangan `for`.
// afifah14

BigInt factorial(int n) {
if (n < 0) {
throw ArgumentError('Factorial tidak didefinisikan untuk bilangan negatif');
}
BigInt result = BigInt.one;
for (int i = 2; i <= n; i++) {
result *= BigInt.from(i);
}
return result;
}