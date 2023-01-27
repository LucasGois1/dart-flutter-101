import 'package:flutter/material.dart';
import 'package:state/1-child/user.dart';

void main() {
  runApp(const MyApp());
}

// Utilizando nosso proprio provider

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  final user = User();

  _login() {
    setState(() {
      user.login(id: 123, name: 'Lucas');
    });
  }

  _logout() {
    setState(() {
      user.logout();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: user.isConnected
          ? LoggedScreen(
              onLogoff: _logout,
              user: user,
            )
          : LogoffScreen(
              onLogin: _login,
            ),
    );
  }
}

class LoggedScreen extends StatelessWidget {
  final User user;
  final VoidCallback onLogoff;

  const LoggedScreen({super.key, required this.onLogoff, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Seja bem vindo! ${user.name}'),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              onLogoff();
            },
          ),
        ],
      ),
    );
  }
}

// LOGGOF

class LogoffScreen extends StatelessWidget {
  final VoidCallback onLogin;
  const LogoffScreen({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Voce esta desconectado :(\n             Faca o login'),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              onLogin();
            },
          )
        ],
      ),
    );
  }
}
