import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String id;
  String shopID;
  String name;
  double price;

  // Add other necessary variables here

  ServiceModel({
    this.id='',
    required this.shopID,
    required this.name,
    required this.price,
    // Add other necessary variables here
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shopID': shopID,
      'price': price,
      'name': name,
      // Add other necessary variables here
    };
  }

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      shopID: json['shopID'],
      price: json['price'],
      name: json['name'],
      // Add other necessary variables here
    );
  }

  factory ServiceModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ServiceModel.fromJson(data);
  }
}
