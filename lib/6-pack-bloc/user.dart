import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _authUseCase = AuthenticationUseCase();

  LoginBloc() : super(LoginInitialState()) {
    on<LoadLoginEvent>((event, emit) => emit(LoginInitialState()));
    on<DoLoginEvent>((event, emit) async {
      emit(LoginProcessing());

      try {
        await _authUseCase.auth();
      } catch (e) {
        emit(LoginError());
      }

      emit(UserLogged(event.user));
    });
    on<DoLoggofEvent>((event, emit) async {
      emit(LoginProcessing());

      try {
        await _authUseCase.logoff();
      } catch (e) {
        emit(LoginError());
      }

      emit(UserNotLogged());
    });
  }
}

class BloCProvider with ChangeNotifier {
  final Bloc bloc;

  BloCProvider({required this.bloc});
}
