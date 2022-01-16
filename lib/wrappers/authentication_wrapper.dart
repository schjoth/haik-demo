import 'package:flutter/material.dart';
import 'package:haikapp/providers/autentication_service.dart';
import 'package:haikapp/widgets/login/login_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationWrapper extends StatelessWidget {
  final Widget child;

  const AuthenticationWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    // User logged in
    if (firebaseUser != null) {
      return TextButton(
        child: const Text("Sign out"),
        onPressed: () => context.read<AutenticationService>().signOut(),
      );
    }

    // User not logged in
    return const LoginPage();
  }
}
