import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:mynotes/constant/routes.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('verify Email ')),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
          const Text(
              "We've sent you an email verifivation.Please oprn it to verify your account "),
          const Text("If you haven't recevied email yet, press the button below"),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                devtools.log('Email send');
              },
              child: const Text('Send Email Verification')),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerroute,
                (route) => false,
              );
            },
            child: const Text('Restart'),
          )
        ]),
      ),
    );
  }
}
