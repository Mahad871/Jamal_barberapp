import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mahad_s_application3/models/appointments_model.dart';

class ShopDetails {
  ShopDetails({
    this.id,
    this.ownerId,
    this.shopName,
    this.shopImage,
    this.shopMobileNumber,
    this.shopAddress,
    this.lat,
    this.lon,
    this.shopOpen,
    this.shopClose,
    this.description,
    this.rating,
    this.dateTime,
    this.percentageDiscount,
    this.openTime,
    this.closeTime,
    this.quantity,
    this.amount,
    this.discountAmount,
    this.afterDiscountAmount,
    this.status,
    this.bagsName,
    this.isWishListed,
    this.appointments,
  });

  String? id;
  String? ownerId;
  String? shopName;
  String? shopImage;
  String? shopMobileNumber;
  String? shopAddress;
  String? lat;
  String? lon;
  String? shopOpen;
  String? shopClose;
  String? description;
  String? rating;
  DateTime? dateTime;
  String? percentageDiscount;
  String? openTime;
  String? closeTime;
  String? quantity;
  String? amount;
  String? discountAmount;
  String? afterDiscountAmount;
  String? status;
  String? bagsName;
  bool? isWishListed;

  List<Appointment>? appointments = [];

  factory ShopDetails.fromMap(Map<String, dynamic> json) => ShopDetails(
      id: json["id"],
      ownerId: json["owner_id"],
      shopName: json["shop_name"],
      shopImage: json["shop_image"],
      shopMobileNumber: json["shop_mobile_number"],
      shopAddress: json["shop_address"],
      lat: json["lat"],
      lon: json["lon"],
      shopOpen: json["shop_open"],
      shopClose: json["shop_close"],
      description: json["description"],
      rating: json["rating"],
      dateTime: DateTime.parse(json["date_time"]),
      percentageDiscount: json["percentage_discount"],
      openTime: json["open_time"],
      closeTime: json["close_time"],
      quantity: json["quantity"],
      amount: json["amount"],
      discountAmount: json["discount_amount"],
      afterDiscountAmount: json["after_discount_amount"],
      status: json["status"],
      bagsName: json["bags_name"],
      appointments: List<Appointment>.from(
        json['appointments']?.map((dynamic x) => Appointment.fromMap(x)),
      ));
  factory ShopDetails.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;

    return ShopDetails(
      id: json["id"],
      ownerId: json["owner_id"],
      shopName: json["shop_name"],
      shopImage: json["shop_image"],
      shopMobileNumber: json["shop_mobile_number"],
      shopAddress: json["shop_address"],
      lat: json["lat"],
      lon: json["lon"],
      shopOpen: json["shop_open"],
      shopClose: json["shop_close"],
      description: json["description"],
      rating: json["rating"],
      dateTime: DateTime.parse(json["date_time"]),
      percentageDiscount: json["percentage_discount"],
      openTime: json["open_time"],
      closeTime: json["close_time"],
      quantity: json["quantity"],
      amount: json["amount"],
      discountAmount: json["discount_amount"],
      afterDiscountAmount: json["after_discount_amount"],
      status: json["status"],
      bagsName: json["bags_name"],
      appointments: List<Appointment>.from(
        json['appointments']?.map((dynamic x) => Appointment.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner_id": ownerId,
        "shop_name": shopName,
        "shop_image": shopImage,
        "shop_mobile_number": shopMobileNumber,
        "shop_address": shopAddress,
        "lat": lat,
        "lon": lon,
        "shop_open": shopOpen,
        "shop_close": shopClose,
        "description": description,
        "rating": rating,
        "date_time": dateTime?.toIso8601String(),
        "percentage_discount": percentageDiscount,
        "open_time": openTime,
        "close_time": closeTime,
        "quantity": quantity,
        "amount": amount,
        "discount_amount": discountAmount,
        "after_discount_amount": afterDiscountAmount,
        "status": status,
        "bags_name": bagsName,
        "appointments": appointments == null
            ? []
            : appointments!.map((e) => e.toJson()).toList(),
      };
}
