import 'package:flutter/material.dart';
import 'package:haikapp/providers/autentication_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text("Sign out"),
        onPressed: () => context.read<AutenticationService>().signOut(),
      ),
    );
  }
}
