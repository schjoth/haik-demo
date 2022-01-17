import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haikapp/models/trip_model.dart';
import 'package:haikapp/models/userinformation_model.dart';

class DatabaseService {
  final FirebaseFirestore _db;

  DatabaseService(this._db);

  // user information

  Future<UserInformationModel?> getUserInformation(String id) async {
    try {
      var snap = await _db.collection("userInformation").doc(id).get();
      return UserInformationModel.fromMap(snap.data()!);
    } catch (e) {
      return null;
    }
  }

  // trips
  Stream<List<TripModel>> streamTrips() {
    return _db
        .collection('trips')
        .snapshots()
        .map((list) => list.docs.map((doc) {
              return TripModel.fromMap(data: doc.data());
            }).toList());
  }
}
