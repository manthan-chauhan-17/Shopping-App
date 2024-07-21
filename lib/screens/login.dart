import 'package:flutter/material.dart';
import 'package:shopping_app/screens/signup.dart';
import 'package:shopping_app/widgets/app_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Signup/Login Image
              Image.asset("assets/images/login.png"),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  "Sign in",
                  style: AppWidgets.semiBoldTextStyle(),
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
                height: 5.0,
              ),
              // Forgot Password ?
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password ?",
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Login Button
              Container(
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
              const SizedBox(
                height: 20.0,
              ),
              // To go to signup page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ? ",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22.0,
                    ),
                  ),
                  GestureDetector(
                    // Navigating to Signup page
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: const Text(
                      "Sign up",
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
