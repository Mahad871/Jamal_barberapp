import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mahad_s_application3/models/shops_models.dart';

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
  late List<ShopDetails>? myShops = [];
  double longitude = 0.0;
  double latitude = 0.0;

  UserModel(
      {this.uid,
      required this.username,
      required this.email,
      required this.password,
      required this.bookings,
      this.isBarber = false,
      this.isOnline = false,
      this.file,
      this.myShops});

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
        uid: data['uid'],
        username: data['username'],
        email: data['email'],
        password: data['password'],
        bookings: data['followers'],
        isBarber: data['isVendor'],
        isOnline: data['isOnline'],
        file: data['file'],
        myShops: data['my_shops']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'password': password,
      'followers': bookings,
      'isVendor': isBarber,
      'isOnline': isOnline,
      'file': file,
      'my_shops': myShops
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      bookings: map['followers'],
      isBarber: map['isVendor'],
      isOnline: map['isOnline'],
      file: map['file'],
      myShops: map['my_shops'],
    );
  }

  // Existing code...
}
