// Take a list, say for example this one:
const List<int> numbers = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
// and write a program that prints out all the elements of the list that are
// less than 5.

void main() {
  for (int number in numbers) {
    if (number < 5) {
      print(number);
    }
  }
}
