import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? uid;
  late String? photoUrl;
  final String username;
  final String email;
  final String password;
  late List<dynamic> bookings = [];
  late bool isBarber;
  late bool isOnline;
  final Uint8List? file;
  late int noOfFollowers;
  double longitude = 0.0;
  double latitude = 0.0;

  UserModel({
    this.uid,
    required this.username,
    required this.email,
    required this.password,
    required this.bookings,
    this.isBarber = false,
    this.isOnline = false,
    this.file,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      username: data['username'],
      email: data['email'],
      password: data['password'],
      bookings: data['followers'],
      isBarber: data['isVendor'],
      isOnline: data['isOnline'],
      file: data['file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'followers': bookings,
      'isVendor': isBarber,
      'isOnline': isOnline,
      'file': file,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      password: map['password'],
      bookings: map['followers'],
      isBarber: map['isVendor'],
      isOnline: map['isOnline'],
      file: map['file'],
    );
  }

  // Existing code...
}
