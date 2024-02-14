import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/models/appointment_model.dart';
import 'package:mahad_s_application3/models/shops_model.dart';

class ShopMethods extends ChangeNotifier {
  List<ShopModel> allShops = [];
  final db = FirebaseFirestore.instance;
  // Firebase CRUD operations
  Future<String> addShop(ShopModel shop) async {
    try {
      // Add shop to Firebase
      var docRef = await db.collection('shops').add(shop.toJson());
      String shopId = docRef.id;
      shop.id = shopId;
      await docRef.update({'id': shopId});
      allShops.add(shop);
      notifyListeners();

      return shopId; // Return the created shop object
    } catch (e) {
      // Handle error
      print('Error adding shop: $e');
      return 'Error adding shop'; // Return a default shop model or null
    }
  }

  Future<void> updateShop(ShopModel shop) async {
    try {
      // Update shop in Firebase
      await db.collection('shops').doc(shop.id).update(shop.toJson());
      int index = allShops.indexWhere((element) => element.id == shop.id);
      allShops[index] = shop;
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error updating shop: $e');
    }
  }

  Future<void> deleteShop(String shopId) async {
    try {
      // Delete shop from Firebase
      await db.collection('shops').doc(shopId).delete();
      allShops.removeWhere((element) => element.id == shopId);
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error deleting shop: $e');
    }
  }

  Future<ShopModel> getShopById(String shopId) async {
    try {
      // Retrieve shop by id from Firebase
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await db.collection('shops').doc(shopId).get();
      ShopModel shop = ShopModel.fromDocumentSnapshot(snapshot);
      int index = allShops.indexWhere((element) => element.id == shop.id);
      allShops[index] = shop;
      notifyListeners();

      return shop;
    } catch (e) {
      // Handle error
      print('Error getting shop by id: $e');
      return ShopModel(); // Return a default shop model or null
    }
  }

  Future<bool> addServiceToShop(String shopId, String service) async {
    try {
      ShopModel shop = await getShopById(shopId);

      if (shop.services!.contains(service)) {
        return false;
      } else {
        shop.services!.add(service);
        await updateShop(shop);
        notifyListeners();

        return true;
      }
    } catch (e) {
      // Handle error
      print('Error adding service to shop: $e');
      return false;
    }
  }

  Future<bool> removeServiceToShop(String shopId, String service) async {
    try {
      ShopModel shop = await getShopById(shopId);

      if (shop.services!.contains(service)) {
        return false;
      } else {
        shop.services!.remove(service);
        await updateShop(shop);
        notifyListeners();

        return true;
      }
    } catch (e) {
      // Handle error
      print('Error removing service to shop: $e');
      return false;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getShopsStream() {
    return db.collection('shops').snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocumentSnapshots() async {
    return await db.collection('shops').doc().get();
  }

  Future<List<ShopModel>> getAllShops() async {
    allShops.clear();
    try {
      // Retrieve all shops from Firebase
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.collection('shops').get();

      for (DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        // print(doc.data()!);

        ShopModel shop = ShopModel.fromDocumentSnapshot(doc);
        allShops.add(shop);
      }

      notifyListeners();

      return allShops;
    } catch (e) {
      // Handle error
      print('Error getting all shops: $e');
      return []; // Return an empty list or null
    }
  }

  List<AppointmentModel> createAppointmentsforShop(
      DateTime startTime, DateTime endTime) {
    List<AppointmentModel> appointments = [];

    try {
      DateTime start = DateTime(startTime.year, startTime.month, startTime.day,
          startTime.hour, startTime.minute);
      DateTime end = DateTime(endTime.year, endTime.month, endTime.day,
          endTime.hour, endTime.minute);

      while (start.isBefore(end)) {
        appointments.add(AppointmentModel(dateTime: start.toString()));
        start = start.add(Duration(hours: 1));
      }
    } catch (e) {
      // Handle error
      print('Error creating appointments: $e');
    }

    return appointments;
  }
}
// 
