/* Write a program (function) that takes a list and returns a new list that
 * contains all the elements of the first list minus all the duplicates.
 */

List a = [0, 'a', 1.0, 2, 'b', 2, 'a'];

List removeDuplicates(List list) {
  return list.toSet().toList();
}

void main() {
  print(removeDuplicates(a));
}
