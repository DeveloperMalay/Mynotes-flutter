import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/constant/routes.dart';
import 'package:mynotes/servides/auth/auth_service.dart';
import 'package:mynotes/servides/auth/bloc/auth_bloc.dart';
import 'package:mynotes/servides/auth/bloc/auth_event.dart';

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
        child: Column(
          children: [
            const Text(
                "We've sent you an email verifivation.Please oprn it to verify your account "),
            const Text(
                "If you haven't recevied email yet, press the button below"),
            TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        const AuthEventSendEmailVerification(),
                      );
                },
                child: const Text('Send Email Verification')),
            TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(
                      const AuthEventLogOut(),
                    );
              },
              child: const Text('Restart'),
            )
          ],
        ),
      ),
    );
  }
}
