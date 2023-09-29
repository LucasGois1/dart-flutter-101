// ignore_for_file: avoid_print

import 'dart:math';

// Função 'functionExample' simples sem parâmetros ou retorno.
int functionExample() => 1;

// Função 'functionExampleWithParams' com parâmetros.
void functionExampleWithParams(int param1, String param2) {}

// Função 'functionExampleWithOptionalParams' com parâmetros opcionais.
void functionExampleWithOptionalParams([
  int? param1,
  String? param2,
  bool? param3,
]) {
  // Realiza alguma ação com os parâmetros (pode ser vazio).
}

// Função 'functionExampleWithNamedParams' com parâmetros nomeados.
void functionExampleWithNamedParams({
  int? param1,
  String? param2,
  bool? param3,
}) {
  // Realiza alguma ação com os parâmetros nomeados (pode ser vazio).
}
// Função assíncrona 'functionExampleAsync' que retorna um Future<bool>.
Future<bool> functionExampleAsync() async {
  // Retorna um Future imediatamente com o valor 'true'.
  return Future.value(true);
}

// Gerador síncrono 'counterGenerator' que produz uma sequência de inteiros.
Iterable<int> counterGenerator(String name) sync* {
  var i = 0;

  while (true) {
    print('[--$name] produzindo $i'); // Imprime o valor produzido.
    yield i; // Gera o valor.

    i++; // Incrementa o contador.
  }
}

// Stream assíncrono 'counter' que produz uma sequência de inteiros com um atraso aleatório.
Stream<int> counter(String name) async* {
  var i = 0;
  final delay = Duration(
      seconds: Random().nextInt(30) +
          10); // Gera um atraso aleatório entre 10 e 39 segundos.

  while (true) {
    await Future.delayed(delay); // Aguarda o atraso.

    print('[--$name] produzindo $i'); // Imprime o valor produzido.
    yield i; // Gera o valor.

    i++; // Incrementa o contador.
  }
}

void main() {
  // Executa 3 contadores em uma thread separada.
  final consumer1 = counter('stream1');
  final consumer2 = counter('stream2');
  final consumer3 = counter('stream3');

  // Escuta todos os streams.
  consumer1.listen((event) {
    print('[consumer1] consumindo $event\n'); // Imprime o valor consumido.
  });
  consumer2.listen((event) => print('[consumer2] consumindo $event\n'));
  consumer3.listen((event) => print('[consumer3] consumindo $event\n'));
}
