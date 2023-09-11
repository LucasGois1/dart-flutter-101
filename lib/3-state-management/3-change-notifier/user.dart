import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
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

    notifyListeners();
  }

  void logout() {
    _id = 0;
    _name = '';
    _isConnected = false;

    notifyListeners();
  }

  @override
  bool operator ==(Object other) {
    return other is UserProvider &&
        other.runtimeType == runtimeType &&
        other.id == _id &&
        other.name == _name &&
        other.isConnected == _isConnected;
  }

  @override
  int get hashCode => Object.hash(_id, _name);
}
