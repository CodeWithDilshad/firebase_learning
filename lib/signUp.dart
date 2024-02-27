// ignore_for_file: prefer_const_constructors


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15,),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
            uiHelpler.CustomTExtFIels(emailController, "Email", Icons.mail, false,),
            SizedBox(height: 20,),
            uiHelpler.CustomTExtFIels(passwordController, "Password", Icons.password, true,),
            SizedBox(
              height: 30,
            ),
            uiHelpler.customButtons(() { }, "SignUp",)
          ],
        ),
      ),
    );
  }
}
