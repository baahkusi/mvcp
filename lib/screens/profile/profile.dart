import 'package:flutter/material.dart';
import '../../providers/user-provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo (Profile)'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, user, _) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        title: Text('Username'),
                        subtitle: Text(user.user.name),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Email'),
                        subtitle: Text(user.user.email ?? ''),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Address'),
                        subtitle: Text(user.user.address ?? ''),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Phone'),
                        subtitle: Text(user.user.phone ?? ''),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile/edit');
                        },
                        child: const Text('Edit Profile'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
