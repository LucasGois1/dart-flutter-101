class User {
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
    return other is User &&
        other.runtimeType == runtimeType &&
        other.id == _id &&
        other.name == _name &&
        other.isConnected == _isConnected;
  }

  @override
  int get hashCode => Object.hash(_id, _name);
}
