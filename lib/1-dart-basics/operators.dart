// ignore_for_file: dead_code, avoid_print, unused_local_variable

void main() {
  int intExample;
  double doubleExample = 1.1;
  num numExample = 1.1;
  String stringExample = 'string';
  bool boolExample = true;

// Operators
  intExample = 1 + 1;
  intExample = 1 - 1;
  intExample = 1 * 1;
  doubleExample = 1 / 1;
  intExample = 1 % 1;
  intExample = 1 ~/ 1;

// Bitwise operators // 1 == 0b0000_0001
  intExample = 1 << 1; //    0b0000_0010
  intExample = 1 >> 1; //    0b0000_0000
  intExample = 1 & 2; //    0b0000_0000
  intExample = 1 | 2; //    0b0000_0011
  intExample = 1 ^ 1; //    0b0000_0000

// Logical operators
  boolExample = true && true;
  boolExample = false || true;
  boolExample = !true;

// Conditional expressions
  intExample = boolExample ? 1 : 2;

  List? deadList;

  var aList = deadList ?? [10];

  if (deadList != null) {
    // Mesma coisa que a linha acima
    aList = deadList;
  } else {
    aList = [10];
  }

  print(aList); // prints 10
}
