// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: Text("This is the home page"),
        ),
      ),
    );
  }
}