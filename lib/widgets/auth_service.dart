// auth_service.dart
class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Dummy data for demonstration purposes
  final _users = [
    User(email: 'michael@gmail.com', password: 'Password'),
  ];

  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<bool> signIn(String email, String password) async {
    final user = _users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => User(email: '', password: ''),
    );

    if (user.email.isNotEmpty) {
      _currentUser = user;
      return true;
    }
    return false;
  }

  Future<bool> signUp(String email, String password) async {
    if (!_users.any((user) => user.email == email)) {
      _users.add(User(email: email, password: password));
      _currentUser = User(email: email, password: password);
      return true;
    }
    return false;
  }

  void signOut() {
    _currentUser = null;
  }
}

class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}
