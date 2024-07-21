import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/widgets/app_widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                  "Sign up",
                  style: AppWidgets.semiBoldTextStyle(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Name
              Text(
                "Name",
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
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Email
              Text(
                "Email",
                style: AppWidgets.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Email Input Field
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xfff4f5f9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
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
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Signup Button
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // To go to signin page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ? ",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22.0,
                    ),
                  ),
                  GestureDetector(
                    // Navigating to Login Page
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 22.0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
