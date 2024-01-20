// Write a program that takes a list of numbers for example
List<int> a = [5, 10, 15, 20, 25];
// and makes a new list of only the first and last elements of the given list.
// For practice, write this code inside a function.

List<int> ends(List<int> list) {
  return [list.first, list.last];
}

void main() {
  print(ends(a));
}
