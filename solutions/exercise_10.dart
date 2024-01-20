// Ask the user for a number and determine whether the number is prime or not.

import 'dart:io';

num number() {
  num? n = null;

  while (n == null) {
    stdout.write('Give me a number: ');
    String? input = stdin.readLineSync();

    if (input != null) {
      n = num.tryParse(input);
    }

    if (n == null) print("\nInvalid input!");
  }

  return n;
}

bool prime(num n) {
  if (n <= 3) return n > 1;
  if (n % 1 != 0 || n % 2 == 0 || n % 3 == 0) return false;
  for (int i = 5; i * i <= n; i += 6) {
    if (n % i == 0 || n % (i + 2) == 0) return false;
  }
  return true;
}

void main() {
  num n = number();

  stdout.write("\nThat's ");
  if (!prime(n)) stdout.write('NOT ');
  print('a prime number!');
}
