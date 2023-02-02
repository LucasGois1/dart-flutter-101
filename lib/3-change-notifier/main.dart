import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/3-change-notifier/user.dart';

void main() {
  runApp(const MyAppChangeNotifier());
}

// Utilizando o ChangeNotifier

class MyAppChangeNotifier extends StatelessWidget {
  const MyAppChangeNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UserProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Change Notifier'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// HOME

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: userProvider.isConnected
            ? const LoggedScreen()
            : const LogoffScreen(),
      ),
    );
  }
}

// Widget convertidos para STATELESS !

// LOGGED

class LoggedScreen extends StatelessWidget {
  const LoggedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Seja bem vindo! ${userProvider.name}'),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            userProvider.logout();
          },
        ),
      ],
    );
  }
}

// LOGGOF

class LogoffScreen extends StatelessWidget {
  const LogoffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Voce esta desconectado :(\n             Faca o login'),

        // Utilizando CONSUMER!
        Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            return IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                userProvider.login(id: 1, name: 'Lucas');
              },
            );
          },
        ),
      ],
    );
  }
}
