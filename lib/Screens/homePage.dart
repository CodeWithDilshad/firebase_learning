// ignore_for_file: prefer_const_constructors


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/Screens/loginpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logOut(BuildContext context) async {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
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
              logOut(context);
            },
            child: Text("LogOut"),
          ),
        ),
      ),
    );
  }
}
