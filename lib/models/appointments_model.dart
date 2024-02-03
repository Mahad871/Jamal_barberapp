import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  DateTime dateTime;
  late List<String>? services = [];
  late bool isAvailable;
  late double price;
  late String shopId;
  late String userId;

  Appointment({
    required this.dateTime,
    this.services,
    this.isAvailable = true,
    this.price = 0,
    this.shopId = '',
    this.userId = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'dateTime': Timestamp.fromDate(dateTime),
      'services': services ?? [],
      'isAvailable': isAvailable,
      'price': price,
      'shopId': shopId,
      'userId': userId,
    };
  }

  factory Appointment.fromDoc(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Appointment(
      dateTime: data['dateTime'].toDate() ?? '',
      services: List<String>.from(data['services'] ?? []),
      isAvailable: data['isAvailable'] ?? '',
      price: data['price'] ?? '',
      shopId: data['shopId'] ?? '',
      userId: data['userId'] ?? '',
    );
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      dateTime: map['dateTime'].toDate(),
      services: List<String>.from(map['services'] ?? []),
      isAvailable: map['isAvailable'],
      price: map['price'],
      shopId: map['shopId'],
      userId: map['userId'],
    );
  }
}
