/* Create a program that asks the user for a number and then prints out a list
 * of all the divisors of that number.
 */

import 'dart:io';

int number() {
  stdout.write("Give me a number: ");

  int? n = null;
  while (n == null) {
    String? input = stdin.readLineSync();

    if (input != null) {
      n = int.tryParse(input);
    }

    if (n == null) {
      stdout.write("No really, any number: ");
    }
  }

  return n;
}

void main() {
  int n = number();
  List<int> divisors = [];

  for (int i = 1; i < n / 2; i++) {
    if (n % i == 0) {
      divisors.add(i);
    }
  }

  print('\nHere are the divisors of $n: $divisors');
}
