// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_series/uiHelper.dart';
import 'package:flutter/material.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController emailController = TextEditingController();

  forgotpass(String email) async {
    if (email == "") {
      return uiHelpler.customAlertBox(
        context,
        "Please Enter email to reset Password.",
      );
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
            uiHelpler.customButtons(
              () {
                forgotpass(emailController.text.toString());
              },
              "Reset Password?",
            ),
          ],
        ),
      ),
    );
  }
}
