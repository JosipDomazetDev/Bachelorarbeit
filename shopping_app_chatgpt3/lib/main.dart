import 'package:flutter/material.dart';
import 'package:shopping_app_chatgpt3/screens/login_screen.dart';
import 'package:shopping_app_chatgpt3/screens/product_listing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/productListing': (context) => ProductListingScreen(),
      },
    );
  }
}
