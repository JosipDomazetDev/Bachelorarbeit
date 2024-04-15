import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              key: Key('usernameField'), // Add a key for the username field
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20.0),
            TextField(
              key: Key('passwordField'), // Add a key for the password field
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/productListing');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
