import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/constant/routes.dart';
import 'package:mynotes/servides/auth/auth_exception.dart';
import 'package:mynotes/servides/auth/auth_service.dart';
import 'package:mynotes/servides/auth/bloc/auth_bloc.dart';
import 'package:mynotes/servides/auth/bloc/auth_event.dart';
import 'package:mynotes/utilities/dialogs/error_dialog.dart';

class Login_View extends StatefulWidget {
  const Login_View({Key? key}) : super(key: key);

  @override
  State<Login_View> createState() => _Login_ViewState();
}

class _Login_ViewState extends State<Login_View> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: 'Enter your email here'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Enter your password here'),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  context.read<AuthBloc>().add(
                        AuthEventLogIn(
                          email,
                          password,
                        ),
                      );
                } on UesrNotFoundAuthException {
                  await showErrorDialog(
                    context,
                    'User not found',
                  );
                } on WrongPasswordAuthException {
                  await showErrorDialog(
                    context,
                    'wrong password',
                  );
                } on GenericAuthException {
                  await showErrorDialog(
                    context,
                    'Authentication Error',
                  );
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(registerroute, (route) => false);
                },
                child: const Text("Don,t have a account? Register here "))
          ],
        ),
      ),
    );
  }
}
