import 'package:cloud_firestore/cloud_firestore.dart';

enum AppointmentStatus {
  upcoming,
  confirmed,
  cancelled,
}

extension AppointmentStatusExtension on AppointmentStatus {
  String get status {
    switch (this) {
      case AppointmentStatus.upcoming:
        return 'Upcoming';
      case AppointmentStatus.confirmed:
        return 'Confirmed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      default:
        return '';
    }
  }
}

class AppointmentModel {
  late String id; // Added id variable
  late String dateTime;
  late String appointmentDate;
  late String appointmentTime;
  late String serviceId;
  late bool isAvailable;
  late double price;
  late String shopId;
  late String userId;
  late String status; // Added status variable

  AppointmentModel(
      {this.id = '',
      this.dateTime = '',
      this.serviceId = '',
      this.isAvailable = true,
      this.price = 0,
      this.shopId = '',
      this.userId = '',
      this.status = '',
      this.appointmentDate = '',
      this.appointmentTime = '' // Initialize status variable
      });

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include id in the JSON representation
      'dateTime': dateTime,
      'appointmentTime': appointmentTime,
      'appointmentDate': appointmentDate,
      'servicesId': serviceId,
      'isAvailable': isAvailable,
      'price': price,
      'shopId': shopId,
      'userId': userId,
      'status': status, // Include status in the JSON representation
    };
  }

  factory AppointmentModel.fromDoc(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AppointmentModel(
      id: doc.id, // Set id from the document id
      dateTime: data['dateTime'] ?? '',
      appointmentTime: data['appointmentTime'] ?? '',
      appointmentDate: data['appointmentTime'] ?? '',
      serviceId: data['servicesId'] ?? '',
      isAvailable: data['isAvailable'] ?? '',
      price: data['price'] ?? '',
      shopId: data['shopId'] ?? '',
      userId: data['userId'] ?? '',
      status: data['status'] ?? '', // Set status from the document data
    );
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] ?? '', // Set id from the map
      dateTime: map['dateTime'],
      appointmentTime: map['appointmentTime'] ?? '',
      appointmentDate: map['appointmentTime'] ?? '',
      serviceId: map['servicesId'] ?? '',
      isAvailable: map['isAvailable'],
      price: map['price'],
      shopId: map['shopId'],
      userId: map['userId'],
      status: map['status'], // Set status from the map
    );
  }
}
