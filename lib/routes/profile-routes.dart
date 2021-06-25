import 'package:flutter/material.dart';
import '../screens/profile/profile.dart';
import '../screens/profile/profile-edit.dart';

var profileRoutes = <String, WidgetBuilder>{
  '/profile': (BuildContext context) => Profile(),
  '/profile/edit': (BuildContext context) => ProfileEdit(),
};
