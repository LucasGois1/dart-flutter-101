import 'dart:async';

import 'package:flutter/widgets.dart';

class User {
  int _id = 0;
  String _name = '';
  bool _isConnected = false;

  User(this._id, this._name);

  int get id => _id;
  String get name => _name;
  bool get isConnected => _isConnected;

  void authenticated() {
    _isConnected = true;
  }

  void logout() {
    _id = 0;
    _name = '';
    _isConnected = false;
  }

  @override
  bool operator ==(Object other) {
    return other is User &&
        other.runtimeType == runtimeType &&
        other.id == _id &&
        other.name == _name &&
        other.isConnected == _isConnected;
  }

  @override
  int get hashCode => Object.hash(_id, _name);
}

// Events

abstract class BlocEvent {}

abstract class LoginEvent extends BlocEvent {}

class LoadLoginEvent extends LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final User user;

  DoLoginEvent({required this.user});
}

class DoLoggofEvent extends LoginEvent {}

// State

abstract class BlocState {}

abstract class LoginState extends BlocState {
  late User? user;

  LoginState(this.user);
}

class LoginInitialState extends LoginState {
  LoginInitialState() : super(null);
}

class LoginProcessing extends LoginState {
  LoginProcessing() : super(null);
}

class UserLogged extends LoginState {
  UserLogged(super.user);
}

class UserNotLogged extends LoginState {
  UserNotLogged() : super(null);
}

class LoginError extends LoginState {
  LoginError() : super(null);
}

// Bloc

class AuthenticationUseCase {
  Future auth() async {
    return await Future.delayed(const Duration(seconds: 5));
  }

  Future logoff() async {
    return await Future.delayed(const Duration(seconds: 2));
  }
}

abstract class Bloc<E extends BlocEvent, S extends BlocState> {
  Bloc() {
    _inputController.stream.listen(_mapEventToState);
  }

  final StreamController<E> _inputController = StreamController();

  final StreamController<S> _outputController = StreamController();

  Sink<E> get input => _inputController.sink;
  Stream<S> get output => _outputController.stream;

  void _mapEventToState(E event);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _authUseCase = AuthenticationUseCase();

  LoginBloc() {
    _outputController.add(LoginInitialState());
  }

  @override
  void _mapEventToState(LoginEvent event) async {
    if (event is LoadLoginEvent) {
      _outputController.add(LoginInitialState());
      return;
    }

    if (event is DoLoginEvent) {
      _outputController.add(LoginProcessing());

      await _authUseCase.auth();

      _outputController.add(UserLogged(event.user));
      return;
    }

    if (event is DoLoggofEvent) {
      _outputController.add(LoginProcessing());

      await _authUseCase.logoff();

      _outputController.add(UserNotLogged());
      return;
    }

    _outputController.add(LoginError());
  }
}

class BlocProvider with ChangeNotifier {
  final Bloc bloc;

  BlocProvider({required this.bloc});
}
