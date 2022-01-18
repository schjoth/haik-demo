import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haikapp/models/trip_model.dart';
import 'package:haikapp/providers/database_service.dart';
import 'package:provider/provider.dart';

class CreateTrips extends StatefulWidget {
  CreateTrips({Key? key}) : super(key: key);

  @override
  _CreateTripsState createState() => _CreateTripsState();
}

class _CreateTripsState extends State<CreateTrips> {
  DateTime travelTime = DateTime.now();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final kilometersController = TextEditingController();
  final priceController = TextEditingController();

  Future<void> createTrip(BuildContext context, User? authUser) async {
    if (authUser == null) return;

    final TripModel newTrip = TripModel(
        driverId: authUser.uid,
        passengerId: null,
        from: fromController.text,
        to: toController.text,
        date: travelTime,
        kilometers: int.parse(kilometersController.text),
        price: int.parse(priceController.text));

    await context.read<DatabaseService>().createTrip(newTrip);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: travelTime,
        lastDate: DateTime(2100, 8),
        firstDate: DateTime.now());
    if (picked != null && picked != travelTime) {
      setState(() {
        travelTime = picked;
      });
    }
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    kilometersController.dispose();
    priceController.dispose();
    super.dispose();
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
                controller: fromController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'From',
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
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16) * 0.5,
              child: TextFormField(
                controller: toController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'To',
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
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16) * 0.5,
              child: TextFormField(
                controller: kilometersController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Kilometers',
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
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16) * 0.5,
              child: TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Price',
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
                    child: Text("Travel date: " +
                        "${travelTime.toLocal()}".split(' ')[0]),
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
                    child: const Text("Create trip"),
                    onPressed: () => createTrip(context, authUser))),
          ),
        ],
      ),
    );
  }
}
