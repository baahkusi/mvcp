import 'package:flutter/material.dart';
import 'package:mvcp/models/user-model.dart';

class UserProvider extends ChangeNotifier {
  /// Internal, private state of the user.
  late User _user;

  /// unmodifiable get user
  User get user => _user;

  /// Sets [user] within the app
  set user(user) {
    _user = user;
    notifyListeners();
  }
}
