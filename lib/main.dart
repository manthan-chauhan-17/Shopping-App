import 'package:flutter/material.dart';
import 'package:shopping_app/screens/bottomnav.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/screens/onboarding.dart';
import 'package:shopping_app/screens/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetail(),
    );
  }
}
