import 'package:flutter/material.dart';
import 'package:shopping_app/admin/admin_login.dart';
import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/screens/signup.dart';

class AdminOrUser extends StatelessWidget {
  const AdminOrUser({super.key});

  @override
  Widget build(BuildContext context) {
    ButtonStyle? elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminLogin(),
                    ),
                  );
                },
                style: elevatedButtonStyle,
                child: const Text(
                  "Login as Admin",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                style: elevatedButtonStyle,
                child: const Text(
                  "Login as User",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
    );
  }
}
