class User {
  const User(this.userId);

  final int userId;
}

class Auth {
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<User?> signIn() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = const User(1);
    return _currentUser;
  }

  Future<bool> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
