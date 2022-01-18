import 'package:flutter/material.dart';
import 'package:haikapp/widgets/update_user/update_user_information.dart';

class MyPagesScreen extends StatelessWidget {
  static const String routeName = "/my-pages";

  const MyPagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: UpdateUserInformation());
  }
}
