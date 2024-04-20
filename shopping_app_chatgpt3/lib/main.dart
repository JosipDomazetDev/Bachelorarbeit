import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_chatgpt3/providers/cart_provider.dart';
import 'package:shopping_app_chatgpt3/providers/product_provider.dart';
import 'package:shopping_app_chatgpt3/screens/cart_screen.dart';
import 'package:shopping_app_chatgpt3/screens/login_screen.dart';
import 'package:shopping_app_chatgpt3/screens/product_listing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Your App Name',
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/productListing': (context) => const ProductListingScreen(),
          '/cart': (context) => const CartScreen(),
          // Add the route for the cart screen
        },
      ),
    );
  }
}
