/* Generate a random number between 1 and 100. Ask the user to guess the number,
 * then tell them whether they guessed too low, too high, or exactly right.
 */

import 'dart:io';
import 'dart:math';

int think() {
  print("I'm thinking of a number between 1 and 100...");

  final Random random = Random();
  return random.nextInt(100) + 1;
}

int guess() {
  int? number = null;

  while (number == null) {
    stdout.write('Can you guess which number? ');
    String? input = stdin.readLineSync();

    if (input != null) {
      number = int.tryParse(input);
    }

    if (number == null || number < 1 || number > 100) {
      number = null;
      print("\nInvalid input!");
    }
  }

  return number;
}

void main() {
  int number = think();
  int g = guess();

  if (g < number) {
    print("Too low! The number was $number.");
  } else if (g > number) {
    print("Too high! The number was $number.");
  } else {
    print("You got it exactly right! 🎉");
  }
}
