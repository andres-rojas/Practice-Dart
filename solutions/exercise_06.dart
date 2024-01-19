/* Ask the user for a string and print out whether this string is a palindrome
 * or not.
 */

import 'dart:io';

String prompt() {
  String? n = null;
  stdout.write('Type ');

  while (n == null || n.isEmpty) {
    stdout.write('anything: ');
    n = stdin.readLineSync();

    if (n == null || n.isEmpty) {
      stdout.write('No really, ');
    }
  }

  return n;
}

extension palindromeStringExtension on String {
  bool isPalindrome() {
    String s = this.toLowerCase();

    for (int i = 0; i < (s.length / 2) - 1; i++) {
      if (s[i] != s[s.length - 1 - i]) return false;
    }
    return true;
  }
}

void main() {
  String s = prompt();

  stdout.write('\n"$s"');
  (s.isPalindrome()) ? stdout.write(' IS ') : stdout.write(' is NOT ');
  print('a palindrome!');
}
