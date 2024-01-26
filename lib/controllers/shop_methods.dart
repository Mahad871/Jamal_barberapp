import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/models/appointments_model.dart';
import 'package:mahad_s_application3/models/shops_models.dart';

class ShopMethods extends ChangeNotifier {
  List<ShopDetails> allShops = [];
  final db = FirebaseFirestore.instance;
  // Firebase CRUD operations
  Future<void> addShop(ShopDetails shop) async {
    // Add shop to Firebase
    await db.collection('shops').add(shop.toJson());
  }

  Future<void> updateShop(ShopDetails shop) async {
    // Update shop in Firebase
    await db.collection('shops').doc(shop.id).update(shop.toJson());
    notifyListeners();
  }

  Future<void> deleteShop(String shopId) async {
    // Delete shop from Firebase
    await db.collection('shops').doc(shopId).delete();
    notifyListeners();
  }

  Future<List<ShopDetails>> getAllShops() async {
    // Retrieve all shops from Firebase
    var snapshot = await db.collection('shops').get();
    allShops =
        snapshot.docs.map((doc) => ShopDetails.fromMap(doc.data())).toList();
    notifyListeners();

    return allShops;
  }

  List<Appointment> createAppointments(DateTime startTime, DateTime endTime) {
    List<Appointment> appointments = [];

    DateTime start = DateTime(startTime.year, startTime.month, startTime.day,
        startTime.hour, startTime.minute);
    DateTime end = DateTime(
        endTime.year, endTime.month, endTime.day, endTime.hour, endTime.minute);

    while (start.isBefore(end)) {
      appointments.add(Appointment(dateTime: start));
      start = start.add(Duration(hours: 1));
    }
    return appointments;
  }
}
