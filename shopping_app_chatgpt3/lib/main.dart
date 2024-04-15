import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_chatgpt3/providers/product_provider.dart';
import 'package:shopping_app_chatgpt3/screens/login_screen.dart';
import 'package:shopping_app_chatgpt3/screens/product_listing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'Your App Name',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/productListing': (context) => ProductListingScreen(),
        },
      ),
    );
  }
}
