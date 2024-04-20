import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              key: Key('usernameField'), // Add a key for the username field
              decoration: InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 20.0),
            const TextField(
              key: Key('passwordField'), // Add a key for the password field
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/productListing');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
