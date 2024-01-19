/*
 * Ask the user for a number. Depending on whether the number is even or odd,
 * print out an appropriate message to the user.
 */

import 'dart:io';

num number() {
  stdout.write("Give me a number: ");

  num? n = null;
  while (n == null) {
    String? input = stdin.readLineSync();

    if (input != null) {
      n = num.tryParse(input);
    }

    if (n == null) {
      stdout.write("No really, any number: ");
    }
  }

  return n;
}

void main() {
  if (number() % 2 == 0) {
    print("\nThat's an even number!");
  } else {
    print("\nThat's an odd number!");
  }
}
