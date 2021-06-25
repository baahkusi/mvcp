import 'package:flutter/material.dart';
import 'package:mvcp/providers/user-provider.dart';
import 'package:mvcp/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MVCP());
}

class MVCP extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        routes: appRoutes,
      ),
    );
  }
}
