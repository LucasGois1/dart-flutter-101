import 'package:flutter/material.dart';

import 'user.dart';

void main() {
  runApp(const MyAppProvider());
}

// Utilizando nosso proprio provider

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Provider'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = UserProvider.of(context)!;

    List<Widget> getLoggedWidgets() => [
          Text('Seja bem vindo! ${userProvider.state.name}'),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                userProvider.state.logout();
              });
            },
          ),
        ];

    List<Widget> getLogoffWidgets() => [
          const Text('Voce esta desconectado :(\n             Faca o login'),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              setState(() {
                userProvider.state.login(id: 1, name: 'Lucas');
              });
            },
          ),
        ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (userProvider.state.isConnected) ...getLoggedWidgets(),
            if (!userProvider.state.isConnected) ...getLogoffWidgets()
          ],
        ),
      ),
    );
  }
}
