import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:haikapp/models/userinformation_model.dart';
import 'package:haikapp/providers/database_service.dart';

class UpdateUserInformation extends StatefulWidget {
  UpdateUserInformation({Key? key}) : super(key: key);

  @override
  _UpdateUserInformationState createState() => _UpdateUserInformationState();
}

class _UpdateUserInformationState extends State<UpdateUserInformation> {
  final nameController = TextEditingController();
  DateTime birthday = DateTime.now();

  Future<void> updateUserInformation(
      BuildContext context, User? authUser) async {
    if (authUser == null) return;

    final UserInformationModel userInfo = UserInformationModel(
        name: nameController.text, birthday: birthday.toString());
    await context
        .read<DatabaseService>()
        .updateUserInformation(authUser.uid, userInfo);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: birthday,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != birthday) {
      setState(() {
        birthday = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authUser = context.watch<User?>();
    return Center(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5 < 300
                ? 300
                : MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 50),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16) * 0.5,
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5 < 300
                ? 300
                : MediaQuery.of(context).size.width,
            child: Padding(
                padding:
                    const EdgeInsets.only(right: 8, left: 8, top: 16) * 0.5,
                child: TextButton(
                    child: Text(
                        "Birthday: " + "${birthday.toLocal()}".split(' ')[0]),
                    onPressed: () => _selectDate(context))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5 < 300
                ? 300
                : MediaQuery.of(context).size.width,
            child: Padding(
                padding:
                    const EdgeInsets.only(right: 8, left: 8, top: 16) * 0.5,
                child: TextButton(
                    child: const Text("Update"),
                    onPressed: () => updateUserInformation(context, authUser))),
          ),
        ],
      ),
    );
  }
}
