import 'package:haikapp/models/userinformation_model.dart';

class TripModel {
  final String driverId;
  final String? passengerId;
  final String from;
  final String to;
  final DateTime date;
  final int kilometers;
  final int price;

  TripModel(
      {required this.driverId,
      this.passengerId,
      required this.from,
      required this.to,
      required this.date,
      required this.kilometers,
      required this.price});

  factory TripModel.fromMap({required Map data}) {
    final dateFromFirestore = data["date"] != null
        ? DateTime.parse(data["date"].toDate().toString())
        : DateTime.now();
    return TripModel(
      driverId: data["driver"] ?? "",
      passengerId: data["passenger"],
      from: data["from"] ?? "",
      to: data["to"] ?? "",
      date: dateFromFirestore,
      kilometers: data["kilometers"] ?? 0,
      price: data["price"] ?? 0,
    );
  }

  toString() {
    return "driverId: " +
        driverId +
        ", from: " +
        from +
        ", to: " +
        to +
        ", kilometers: " +
        kilometers.toString() +
        ", price: " +
        price.toString();
  }

  Map<String, Object?> toJson() {
    return {
      "driver": driverId,
      "passenger": passengerId,
      "from": from,
      "to": to,
      "date": date.toLocal(),
      "kilometers": kilometers,
      "price": price
    };
  }
}
