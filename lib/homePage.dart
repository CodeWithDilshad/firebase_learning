// ignore_for_file: prefer_const_constructors

import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_series/loginpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  
  logOut() async {
    FirebaseAuth.instance.signOut().then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page "),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.green,
          child: TextButton(
            onPressed: () {
              logOut();
            },
            child: Text("LogOut"),
          ),
        ),
      ),
    );
  }
}
