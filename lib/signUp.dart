// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/homePage.dart';
import 'package:firebase_series/uiHelper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email, String password) async {
    if (email == "" && password == "") {
      return uiHelpler.customAlertBox(context, "Please Enter required fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
            );
      } on FirebaseAuthException catch (ex) {
        return uiHelpler.customAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            uiHelpler.CustomTExtFIels(
              emailController,
              "Email",
              Icons.mail,
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
                signUp(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              "SignUp",
            )
          ],
        ),
      ),
    );
  }
}
