/* Write a password generator in Dart. Be creative with how you generate
 * passwords - strong passwords have a mix of lowercase letters, uppercase
 * letters, numbers, and symbols. The passwords should be random, generating a
 * new password every time the user asks for a new password. Include your
 * run-time code in a main method.
 */

import 'dart:convert';
import 'dart:io';
import 'dart:math';

Future<int> strength() async {
  var prompt =
      () => stdout.write('Password strength? [W]eak, [m]edium, [s]trong: ');
  prompt();

  stdin.lineMode = false;
  await for (final key in stdin.transform(const Utf8Decoder())) {
    print('');
    switch (key.toUpperCase()) {
      case 'W':
        stdin.lineMode = true;
        return 8;
      case 'M':
        stdin.lineMode = true;
        return 32;
      case 'S':
        stdin.lineMode = true;
        return 64;
      default:
        prompt();
    }
  }

  throw Exception('Invalid input!');
}

String generate(int length) {
  final random = Random.secure();
  List<int> randomAscii = List.generate(length, (_) => random.nextInt(255));
  List<String> randomChars = base64UrlEncode(randomAscii).split('');
  randomChars.shuffle();
  return randomChars.join('');
}

void main() async {
  print('\n${generate(await strength())}');
}
