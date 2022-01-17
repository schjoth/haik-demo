import 'package:flutter/material.dart';
import 'package:haikapp/models/trip_model.dart';
import 'package:provider/provider.dart';

class TripsScreen extends StatelessWidget {
  static const String routeName = "/trips";

  const TripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trips = context.watch<List<TripModel>>();

    return ListView.builder(
        itemCount: trips.length,
        itemBuilder: (contex, index) {
          final trip = trips[index];

          return ListTile(
            title: Text(trip.to),
          );
        });
  }
}
