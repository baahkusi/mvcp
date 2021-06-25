import 'package:flutter/material.dart';
import '../screens/auth/login.dart';
import '../screens/auth/register.dart';

var authRoutes = <String, WidgetBuilder>{
  '/login': (BuildContext context) => Login(),
  '/': (BuildContext context) => Register(),
};
