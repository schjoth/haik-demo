import 'package:flutter/material.dart';

class MyPagesScreen extends StatelessWidget {
  static const String routeName = "/my-pages";

  const MyPagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My pages"),
    );
  }
}
