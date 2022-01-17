import 'package:flutter/material.dart';

class TripsScreen extends StatelessWidget {
  static const String routeName = "/trips";

  const TripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Trips"),
    );
  }
}
