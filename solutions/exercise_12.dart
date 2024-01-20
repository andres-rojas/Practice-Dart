/* Write a program that asks the user how many Fibonacci numbers to generate and
 * then generates them. Take this opportunity to think about how you can use
 * functions.
 */

import 'dart:io';

int count() {
  int? number = null;

  while (number == null) {
    stdout.write('How many Fibonacci numbers? ');
    String? input = stdin.readLineSync();

    if (input != null) {
      number = int.tryParse(input);
    }

    if (number == null) print("\nInvalid input!");
  }

  return number;
}

extension ExtendList<T> on List<T> {
  void extend(int length, T value) {
    assert(length >= 0);

    final delta = length - this.length;
    if (delta <= 0) {
      return;
    }

    this.addAll(List.filled(delta, value));
  }
}

List<int> sequence = [0, 1];
int fibonacci(int n) {
  if (sequence.contains(n))
    return sequence[n];
  else
    sequence.extend(n + 1, 0);

  sequence[n] = fibonacci(n - 1) + fibonacci(n - 2);

  return sequence[n];
}

void main() {
  fibonacci(count());
  print(sequence);
}
