import 'package:flutter/material.dart';
import 'package:mvcp/models/user-model.dart';
import '../../providers/user-provider.dart';
import 'package:provider/provider.dart';
import '../../styles/textform-style.dart';
import '../../components/snackbar.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  late UserProvider _userProvider;

  String? _inputNotNull(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required field.';
    }
    return null;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    _userNameController.text = _userProvider.user.name;
    _phoneController.text = _userProvider.user.phone ?? '';
    _addressController.text = _userProvider.user.address ?? '';
    _emailController.text = _userProvider.user.email ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo (Edit Profile)'),
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
                          hintText: 'Email',
                        ),
                        controller: _emailController,
                        validator: _inputNotNull,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: textFormStyle.copyWith(
                          hintText: 'Address',
                        ),
                        controller: _addressController,
                        validator: _inputNotNull,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: textFormStyle.copyWith(
                          hintText: 'Phone',
                        ),
                        controller: _phoneController,
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
                              ScaffoldMessenger.of(context).showSnackBar(snackBar('ProfileEdit successfull'));
                              User user = User(
                                name: _userNameController.text,
                                email: _emailController.text,
                                address: _addressController.text,
                                phone: _phoneController.text,
                              );
                              Provider.of<UserProvider>(context, listen: false).user = user;
                              Navigator.pushNamed(context, '/profile');
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    )
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
