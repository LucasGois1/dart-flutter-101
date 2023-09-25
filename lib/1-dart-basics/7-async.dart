// ignore_for_file: avoid_print

// Função assíncrona que retorna um Future<int>
Future<int> minhaFuncaoAssincrona({int? numero}) async {
  // Essa função simula uma operação assíncrona.
  // Pode ser uma chamada de API, acesso a um banco de dados, etc.
  // O retorno é encapsulado em um Future para representar um valor que estará disponível no futuro.
  return Future.value(numero ?? 1);
}

// Função assíncrona que retorna um Future<int>
Future<int> outraFuncaoAssincrona() async {
  // Essa função também simula uma operação assíncrona e retorna um valor constante (2).
  // É importante notar que funções assíncronas não bloqueiam a execução do programa.
  return Future.value(2);
}

// Função assíncrona de exemplo
Future<void> exemploAsync() async {
  print('Início');

  // Aqui, usamos 'await' para esperar que minhaFuncaoAssincrona seja concluída.
  // Isso evita que 'print(Resultado: ...)' seja executado antes que o resultado esteja disponível.
  final resultado = await minhaFuncaoAssincrona();

  print('Resultado: $resultado');
}

// Função assíncrona de exemplo que demonstra o uso de try-catch
Future<int> exemploFuture() async {
  try {
    // Aguarda um atraso de 2 segundos antes de continuar.
    // Isso é apenas uma demonstração de como aguardar um período de tempo.
    // Neste exemplo, não estamos usando o valor retornado por Future.delayed.
    Future.delayed(const Duration(seconds: 2), () => 42);

    // Chama minhaFuncaoAssincrona e espera pelo resultado.
    // Se ocorrer um erro, ele será capturado pelo bloco 'catch'.
    return await minhaFuncaoAssincrona();
    // Qualquer código após 'await' será executado após a conclusão da Future.
  } catch (e) {
    // Captura e imprime qualquer erro que possa ocorrer.
    print('Erro: $e');
  }

  // Retorna um Future com valor 0 em caso de erro.
  return Future.value(0);
}

// Função assíncrona de exemplo que usa Future.wait para aguardar múltiplas Futures
Future<void> exemploComposicao() async {
  // Criamos uma lista de Futures com duas chamadas assíncronas.
  final listaDeFutures = [minhaFuncaoAssincrona(), outraFuncaoAssincrona()];

  // Usamos 'await Future.wait' para esperar a conclusão de todas as Futures na lista.
  // Isso pode melhorar o desempenho ao realizar várias tarefas em paralelo.
  await Future.wait(listaDeFutures);

  // Trabalhamos com os resultados após aguardar a conclusão de todas as tarefas.
}

// Função assíncrona que lida com múltiplas chamadas usando Future.forEach
Future<void> lidarComMultiplasChamadas(List<int> numeros) async {
  // Usamos 'await Future.forEach' para iterar sobre a lista 'numeros'.
  // Cada número é passado para 'minhaFuncaoAssincrona', que é executada de forma assíncrona.
  await Future.forEach(numeros, (numero) async {
    await minhaFuncaoAssincrona(numero: numero);
    // Trabalhamos com o resultado de cada chamada após aguardar a conclusão.
  });
}

// Função geradora assíncrona que produz valores em um Stream
Stream<int> lidarComMultiplasChamadasGenerator(List<int> numeros) async* {
  for (final numero in numeros) {
    // Aqui, usamos 'await' para esperar o resultado de 'minhaFuncaoAssincrona' antes de emitir um valor.
    // Essa função é uma demonstração de como criar um Stream que produz valores sob demanda.
    yield await minhaFuncaoAssincrona(numero: numero);

    // Executamos outras operações após emitir o valor, se necessário.
  }
}
