import 'package:flutter/material.dart';

class UserState {
  int _id = 0;
  String _name = '';
  bool _isConnected = false;

  int get id => _id;
  String get name => _name;
  bool get isConnected => _isConnected;

  void login({required int id, required String name}) {
    _id = id;
    _name = name;
    _isConnected = true;
  }

  void logout() {
    _id = 0;
    _name = '';
    _isConnected = false;
  }

  @override
  bool operator ==(Object other) {
    return other is UserState &&
        other.runtimeType == runtimeType &&
        other.id == _id &&
        other.name == _name &&
        other.isConnected == _isConnected;
  }

  @override
  int get hashCode => Object.hash(_id, _name);
}

class UserProvider extends InheritedWidget {
  final UserState state = UserState();

  UserProvider({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant UserProvider oldWidget) {
    return state != oldWidget.state;
  }

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }
}
