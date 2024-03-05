// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/Screens/otpScreen.dart';
import 'package:flutter/material.dart';

class phoneAuth extends StatefulWidget {
  const phoneAuth({super.key});

  @override
  State<phoneAuth> createState() => _phoneAuthState();
}

class _phoneAuthState extends State<phoneAuth> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Authentication"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Phone Number",
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationid, int? sendToken) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OTPScreen(veriFyId: verificationid),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (String VerificationId) {},
                  phoneNumber: phoneController.text.toString(),
                );
              },
              child: Text("Verify OTP"),
            )
          ],
        ),
      ),
    );
  }
}
