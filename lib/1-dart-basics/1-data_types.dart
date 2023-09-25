// ignore_for_file: file_names, unused_local_variable

import 'dart:math';

// Declaração de variáveis de diferentes tipos de dados.
int intExample = 1; // Variável inteira
double doubleExample = 1.1; // Variável de ponto flutuante
num numExample =
    1.1; // Variável numérica (pode armazenar inteiros ou números de ponto flutuante)
String stringExample = 'string'; // Variável de texto (string)
bool boolExample = true; // Variável booleana (verdadeiro ou falso)
dynamic anyExample = 1; // Variável dinâmica (pode conter qualquer tipo de dado)

// Coleções (collections)
List listExample = [1, 2, 3]; // Lista (List) contendo números inteiros
Map mapExample = {'key': 'value'}; // Mapa (Map) associando uma chave a um valor
Set setExample = {1, 2, 3}; // Conjunto (Set) contendo números inteiros

// Coleções com uso de genéricos (com generics)
List<dynamic> listExample2 = [
  1,
  '2',
  true
]; // Lista que aceita qualquer tipo de dado
List<int> listExample3 = [1, 2, 3]; // Lista que só aceita números inteiros
Map<String, String> mapExample2 = {
  'key': 'value'
}; // Mapa com chaves e valores do tipo String
Set<int> setExample2 = {1, 2, 3}; // Conjunto que só aceita números inteiros

// Enums
enum EnumExample { value1, value2, value3 }

// Enum com valores associados
enum EnumExample2 {
  // É possivel tambem implementar interfaces
  value1('value1'),
  value2('value2'),
  value3('value3');

  final String value;

  const EnumExample2(this.value);

  String get eachLetterAsAListElement => value.split('').join(',');
}

void main() {
  anyExample = 'string'; // Variável dinâmica pode conter uma string
  anyExample = 1; // Agora pode conter um inteiro
  anyExample = true; // E também pode conter um valor booleano

  const firstClass = 1; // Valores definidos em tempo de compilação (constantes)

  final secondClass = Random().nextInt(
      10); // Valor final definido em tempo de execução (não pode ser constante)

  var thirdClass = Random()
      .nextInt(10); // Variável 'var' pode mudar de tipo durante a execução
  thirdClass = 1; // Agora 'thirdClass' é um inteiro.
}
