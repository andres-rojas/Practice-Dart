/* Write a program (using functions!) that asks the user for a long string
 * containing multiple words. Print back to the user the same string, except
 * with the words in backwards order.
 */

import 'dart:io';

String phrase() {
  String? p = null;

  while (p == null || p.isEmpty) {
    stdout.write('Give me a phrase: ');
    p = stdin.readLineSync();

    if (p == null || !p.trim().contains(' ')) {
      p = null;
      print('\nInvalid input!');
    }
  }

  return p.trim();
}

extension reversePhraseStringExtension on String {
  String reversePhrase() {
    return this.split(' ').reversed.where((word) => word.isNotEmpty).join(' ');
  }
}

void main() {
  print(phrase().reversePhrase());
}
