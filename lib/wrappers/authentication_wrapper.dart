import 'package:flutter/widgets.dart';
import 'package:haikapp/widgets/login/login_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    // User logged in
    if (firebaseUser != null) {
      return const Text("Signed in");
    }

    // User not logged in
    return const LoginPage();
  }
}
