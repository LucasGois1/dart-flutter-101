// ignore_for_file: avoid_print

Future<int> minhaFuncaoAssincrona({int? numero}) async {
  // Código assíncrono aqui
  return Future.value(numero ?? 1);
}

Future<int> outraFuncaoAssincrona() async {
  // Código assíncrono aqui
  return Future.value(2);
}

Future<void> exemploAsync() async {
  print('Início');

  final resultado = await minhaFuncaoAssincrona();

  print('Resultado: $resultado');
}

Future<int> exemploFuture() async {
  try {
    Future.delayed(const Duration(seconds: 2), () => 42);
    return await minhaFuncaoAssincrona();
    // Tratar resultado
  } catch (e) {
    print('Erro: $e');
  }
  return Future.value(0);
}

Future<void> exemploComposicao() async {
  final listaDeFutures = [minhaFuncaoAssincrona(), outraFuncaoAssincrona()];
  await Future.wait(listaDeFutures);
  // Trabalhar com resultados
}

Future<void> lidarComMultiplasChamadas(List<int> numeros) async {
  await Future.forEach(numeros, (numero) async {
    await minhaFuncaoAssincrona(numero: numero);
    // Trabalhar com o resultado
  });
}

Stream<int> lidarComMultiplasChamadasGenerator(List<int> numeros) async* {
  for (final numero in numeros) {
    // Processar antes de produzir

    yield await minhaFuncaoAssincrona(numero: numero);

    // Executar outras operacoes
  }
}
