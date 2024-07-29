import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/admin/admin_login.dart';
import 'package:shopping_app/screens/bottomnav.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/screens/onboarding.dart';
import 'package:shopping_app/screens/product_detail.dart';
import 'package:shopping_app/screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyClZE8KcO-d4Rnxgiq90OusqD-eHis_nl8",
            appId: "1:592088079617:android:159f3d8d080625c04f0f00",
            messagingSenderId: "592088079617",
            projectId: "shopping-app-bb8eb",
          ),
        )
      : Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminLogin(),
    );
  }
}
