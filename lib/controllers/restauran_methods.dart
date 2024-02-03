// import 'package:flutter/material.dart';
// import 'package:mahad_s_application3/models/shops_models.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ShopMethods extends ChangeNotifier {
//   final CollectionReference _shopsCollection =
//       FirebaseFirestore.instance.collection('shops');

//   List<ShopDetails> shopList = [];

//   Future<void> addShop(ShopDetails shop) async {
//     try {
//       await _shopsCollection.add(shop.toJson());
//     } catch (e) {
//       // Handle error
//     }
//     notifyListeners();
//   }

//   Future<void> updateShop(String id, ShopDetails shop) async {
//     try {
//       await _shopsCollection.doc(id).update(shop.toJson());
//     } catch (e) {
//       // Handle error
//     }
//     notifyListeners();
//   }

//   Future<void> deleteShop(String id) async {
//     try {
//       await _shopsCollection.doc(id).delete();
//     } catch (e) {
//       // Handle error
//     }
//     notifyListeners();
//   }

//   Stream<List<ShopDetails>> getShops() {
//     return _shopsCollection.snapshots().map((snapshot) {
//       shopList = snapshot.docs
//           .map(
//               (doc) => ShopDetails.fromJson(doc.data() as Map<String, dynamic>))
//           .toList();
//       return shopList;
//     });
//   }
// }
