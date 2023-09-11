// ignore_for_file: file_names, unused_local_variable

import 'dart:math';

int intExample = 1;
double doubleExample = 1.1;
num numExample = 1.1;
String stringExample = 'string';
bool boolExample = true;
dynamic anyExample = 1;

// collections
List listExample = [1, 2, 3];
Map mapExample = {'key': 'value'};
Set setExample = {1, 2, 3};

// with generics
List<int> listExample2 = [1, 2, 3];
Map<String, String> mapExample2 = {'key': 'value'};
Set<int> setExample2 = {1, 2, 3};

void main() {
  anyExample = 'string';
  anyExample = 1;
  anyExample = true;

  const firstClass = 1; // Valores definidos em tempo de compilacao
  final secondClass =
      Random().nextInt(10); // Nao pode ser const, valor definido em runtime
  var thirdClass = Random().nextInt(10);
  thirdClass = 1;
}
