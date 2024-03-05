// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_series/Screens/loginpage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase before running the app
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyD4A0AHgboBwEYkAWYFz_pEIjWf433tcjU",
            appId: "1:605306836867:android:db91564c9b55db9a7a08b6",
            messagingSenderId: "605306836867",
            projectId: "fir-series-ed3f8",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // Use fromSwatch for simplicity
        ),
      ),
      home: LoginPage(),
    );
  }
}
