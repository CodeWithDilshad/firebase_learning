// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/forgotPassword.dart';
import 'package:firebase_series/homePage.dart';
import 'package:firebase_series/signUp.dart';
import 'package:firebase_series/uiHelper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email == "" && password == "") {
      return uiHelpler.customAlertBox(context, "Enter correct credentials");
    } else {
      try {
        UserCredential? userCredential;
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
            );
      } on FirebaseAuthException catch (ex) {
        return uiHelpler.customAlertBox(
          context,
          ex.code.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            uiHelpler.CustomTExtFIels(
              emailController,
              "Email",
              Icons.email,
              false,
            ),
            SizedBox(
              height: 20,
            ),
            uiHelpler.CustomTExtFIels(
              passwordController,
              "Password",
              Icons.password,
              true,
            ),
            SizedBox(
              height: 30,
            ),
            uiHelpler.customButtons(
              () {
                login(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              "Login",
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: Text(
                    "signUp",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Forgot password button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => forgotPassword(),
                  ),
                );
              },
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
