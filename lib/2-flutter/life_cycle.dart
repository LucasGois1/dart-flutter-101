import 'package:flutter/material.dart';

class HomeLifeCycle extends StatefulWidget {
  const HomeLifeCycle({super.key});

  @override
  State<HomeLifeCycle> createState() => _HomeLifeCycleState();
}

class _HomeLifeCycleState extends State<HomeLifeCycle> {
  bool clear = false;

  _clearScreen() => setState(() => clear = !clear);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Life Cycle')),
        floatingActionButton: FloatingActionButton(
          onPressed: _clearScreen,
          child: const Icon(Icons.clear),
        ),
        body: Center(
          child: clear
              ? const Text("Tudo limpo!")
              : const Column(
                  children: [
                    First(),
                    Second(),
                  ],
                ),
        ),
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    print('BUILD - First is stateless');
    return const Text('Hello there!');
  }
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class Third extends StatelessWidget {
  final String title;

  const Third({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    print('BUILD - Third $key is stateless');
    return Text(title);
  }
}

class _SecondState extends State<Second> {
  late int counter;

  @override
  void initState() {
    counter = 0;
    super.initState();
    print('INIT - Second is stateful');
  }

  @override
  void dispose() {
    print(
      'DISPOSE - Second is stateful',
    ); // Chamado apenas quando o widget sai de tela,
    // quando o valor é alterado isso não acontece
    super.dispose();
  }

  _plusOne() => setState(() => counter++);

  @override
  Widget build(BuildContext context) {
    print('BUILD - Second is stateful');
    return Column(
      children: [
        const Text("contando..."),
        Text("$counter"),
        IconButton(
          onPressed:
              _plusOne, // Chama o setState, marca como sujo, verifica se precisa atualizar, chama o build
          icon: const Icon(Icons.add),
        ),
        const SizedBox(height: 20),
        const Third(
          key: ValueKey("With const!"),
          title: "I'm optimized!",
        ),
        Third(
          key: const ValueKey("Without const :("),
          title: counter < 5 ? 'This is a...' : '...Stateless Widget',
        ),
        // Third(
        //   key: const ValueKey("Without const :("),
        //   title: counter > 5 ? 'This is a...' : '...Stateless Widget',  // DUPLICATED KEY
        // ),
      ],
    );
  }
}
