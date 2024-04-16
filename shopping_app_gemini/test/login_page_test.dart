import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_app_gemini/login_screen.dart';
import 'package:shopping_app_gemini/product_list_screen.dart';

class MockNavigator extends Mock implements Navigator {}

void main() {
  group('LoginPage Test', () {
    test('navigates to next view on successful login', () {
      final mockNavigator = MockNavigator();

      final loginPage = LoginPage();

      // Simulate user input (replace with actual methods for setting username/password)
      loginPage.usernameController.text = 'test_user';
      loginPage.passwordController.text = 'test_password';

      loginPage.onPressed();

      verify(mockNavigator.push(
        any,
        MaterialPageRoute(builder: (context) => ProductListScreen()), // Replace 'NextView' with your next view class
      ));
    });
  });
}
