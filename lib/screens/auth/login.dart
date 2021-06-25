import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../styles/textform-style.dart';
import '../../components/snackbar.dart';
import '../../models/user-model.dart';
import '../../providers/user-provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  String? _inputNotNull(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required field.';
    }
    return null;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo (Login)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: textFormStyle.copyWith(
                          hintText: 'Username',
                        ),
                        controller: _userNameController,
                        validator: _inputNotNull,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: textFormStyle.copyWith(
                          hintText: 'Password',
                        ),
                        obscureText: _hidePassword,
                        controller: _passwordController,
                        validator: _inputNotNull,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(snackBar('login successfull'));
                              User user = User(name: _userNameController.text);
                              Provider.of<UserProvider>(context, listen: false).user = user;
                              Navigator.pushNamed(context, '/profile');
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
