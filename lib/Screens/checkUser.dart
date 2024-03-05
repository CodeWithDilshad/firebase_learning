// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/Screens/homePage.dart';
import 'package:firebase_series/Screens/loginpage.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return checkUser();
  }

  checkUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
