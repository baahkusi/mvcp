import '../../models/user-model.dart';

class Api {
  static String? token;
  static bool status = false;
  static String message = '';
  static Map data = {};

  static Future<User> authenticate(String username, String password) async {
    return User(name: username);
  }

  static Future<User> register(String username) async {
    return User(name: username);
  }
}
