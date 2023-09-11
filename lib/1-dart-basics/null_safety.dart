// Explain null safety in dart with examples

// ignore_for_file: avoid_print

import 'dart:math';

class Person {
  String name;
  int age;

  Person({
    required this.name,
    required this.age,
  });

  void speak() {
    print('My name is $name and I am $age years old');
  }
}

void main() {
  // late, dart faz varredura no codigo e verifica se a variavel foi inicializada
  late String name;
  late int age;

  if (Random().nextBool()) {
    name = 'John';
    age = 30;
  }

  print('Name: $name, Age: $age');

  // null safety
  String? name2;
  int? age2;

  if (Random().nextBool()) {
    name2 = 'John';
    age2 = 30;
  }

  print('Name: $name2, Age: $age2');

  Person? person;

  if (Random().nextBool()) {
    person = Person(name: 'John', age: 30);
  }

  // Executa se nao for nulo
  person?.speak();
  if (person != null) {
    // mesma coisa
    person.speak();
  }

  // eu (desenvolvedor) garanto que nao é nulo (tenha realmente certeza de que no ponto em que utilizar o !, a variavel nao é nula, ou vai gerar um erro)
  person!.speak();
}
