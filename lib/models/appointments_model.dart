import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  DateTime dateTime;
  late List<String>? services;
  late bool isAvailable;
  late double price;

  Appointment({
    required this.dateTime,
    this.services,
    this.isAvailable = true,
    this.price = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'dateTime': Timestamp.fromDate(dateTime),
      'services': services,
      'isAvailable': isAvailable,
      'price': price,
    };
  }

  factory Appointment.fromDoc(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Appointment(
      dateTime: data['dateTime'].toDate(),
      services: List<String>.from(data['services']),
      isAvailable: data['isAvailable'],
      price: data['price'],
    );
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      dateTime: map['dateTime'].toDate(),
      services: List<String>.from(map['services']),
      isAvailable: map['isAvailable'],
      price: map['price'],
    );
  }
}
