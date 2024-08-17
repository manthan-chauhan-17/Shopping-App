import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/admin/home_admin.dart';

import '../widgets/app_widgets.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Signup / login Image
              Image.asset("assets/images/login.png"),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  "Admin Login",
                  style: AppWidgets.semiBoldTextStyle(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Name
              Text(
                "Username",
                style: AppWidgets.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Name Input Field
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xfff4f5f9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  controller: userNameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Password
              Text(
                "Password",
                style: AppWidgets.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Password Input Field
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xfff4f5f9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: userPasswordController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Signup Button
              GestureDetector(
                onTap: () {
                  loginAdmin();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach((result) {
        if (result.data()['username'] != userNameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Your ID is not correct",
              style: TextStyle(fontSize: 20.0),
            ),
          ));
        } else if (result.data()['password'] !=
            userPasswordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Your password is not correct",
              style: TextStyle(fontSize: 20.0),
            ),
          ));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeAdmin()));
        }
      });
    });
  }
}
