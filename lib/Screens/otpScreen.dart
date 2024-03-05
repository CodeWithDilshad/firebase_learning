// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/Screens/homePage.dart';
import 'package:firebase_series/Screens/phoneauth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  String veriFyId;
  OTPScreen({super.key, required this.veriFyId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter OTP",
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                    verificationId: widget.veriFyId,
                    smsCode: otpController.text.toString(),
                  );
                  FirebaseAuth.instance.signInWithCredential(credential).then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        ),
                      );
                } catch (ex) {
                  print(ex.toString());
                }
              },
              child: Text(
                "OTP",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
