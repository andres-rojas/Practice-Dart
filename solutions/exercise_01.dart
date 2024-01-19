/* Create a program that asks the user to enter their name and their age.
 * Print out a message that tells how many years they have to be 100 years old.
 */

import 'dart:io';

String name() {
  String? n = null;
  stdout.write('W');

  while (n == null || n.isEmpty) {
    stdout.write('hat is your name? ');
    n = stdin.readLineSync();

    if (n == null || n.isEmpty) {
      stdout.write('No really, w');
    }
  }

  return n;
}

int age() {
  int? a = null;

  while (a == null) {
    stdout.write('how old are you? ');
    String? input = stdin.readLineSync();

    if (input != null) {
      a = int.tryParse(input);
    }

    if (a == null) {
      stdout.write('No really, ');
    }
  }

  return a;
}

void main() {
  stdout.write('Hi ${name()}, ');
  print('\n🎉🎉🎉 Only ${100 - age()} years to 100! 🎉🎉🎉');
}
