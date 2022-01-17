import 'package:haikapp/models/userinformation_model.dart';

class TripModel {
  final String driverId;
  final String passengerId;
  final String from;
  final String to;
  final int kilometers;
  final int price;

  TripModel(
      {required this.driverId,
      required this.passengerId,
      required this.from,
      required this.to,
      required this.kilometers,
      required this.price});

  factory TripModel.fromMap({required Map data}) {
    return TripModel(
      driverId: data["driver"] ?? "",
      passengerId: data["passenger"] ?? "",
      from: data["from"] ?? "",
      to: data["to"] ?? "",
      kilometers: data["kilometers"] ?? 0,
      price: data["price"] ?? 0,
    );
  }

  toString() {
    return "driverId: " +
        driverId +
        ", passengerId: " +
        passengerId +
        ", from: " +
        from +
        ", to: " +
        to +
        ", kilometers: " +
        kilometers.toString() +
        ", price: " +
        price.toString();
  }
}
