import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../5-custom-bloc/user.dart';

void main() {
  runApp(const MyAppMyBlock());
}

// Utilizando a lib BloC

class MyAppMyBlock extends StatelessWidget {
  const MyAppMyBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BlocProvider(bloc: LoginBloc()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'My Bloc'),
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
    final loginBloc = Provider.of<BlocProvider>(context).bloc as LoginBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<LoginState>(
          stream: loginBloc.output,
          builder: (context, snapshot) {
            final LoginState state =
                snapshot.data != null ? snapshot.data! : LoginInitialState();

            if (state is UserLogged) {
              return LoggedScreen(user: state.user!);
            } else if (state is UserNotLogged || state is LoginInitialState) {
              return const LogoffScreen();
            } else if (state is LoginProcessing) {
              return const CircularProgressIndicator();
            }

            return const Text('Estado desconhecido');
          },
        ),
      ),
    );
  }
}

class LoggedScreen extends StatelessWidget {
  final User user;

  const LoggedScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of<BlocProvider>(context).bloc as LoginBloc;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Seja bem vindo! ${user.name}'),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            loginBloc.input.add(DoLoggofEvent());
          },
        ),
      ],
    );
  }
}

class LogoffScreen extends StatelessWidget {
  const LogoffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Voce esta desconectado :(\n             Faca o login'),

        // Utilizando CONSUMER!
        Consumer<BlocProvider>(
          builder: (context, blocProvider, _) {
            return IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                final user = User(123, 'Lucas');

                blocProvider.bloc.input.add(DoLoginEvent(user: user));
              },
            );
          },
        ),
      ],
    );
  }
}
