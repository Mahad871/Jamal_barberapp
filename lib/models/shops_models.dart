import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mahad_s_application3/models/appointments_model.dart';

class ShopModel {
  ShopModel({
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
    this.services,
    this.daysOpen,
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
  List<String>? services = [];
  Map<String, bool>? daysOpen = {
    'Monday': true,
    'Tuesday': true,
    'Wednesday': true,
    'Thursday': true,
    'Friday': true,
    'Saturday': true,
    'Sunday': false,
  };

  factory ShopModel.fromJson(Map<String, dynamic> map) => ShopModel(
        id: map["id"],
        ownerId: map["owner_id"],
        shopName: map["shop_name"],
        shopImage: map["shop_image"],
        shopMobileNumber: map["shop_mobile_number"],
        shopAddress: map["shop_address"],
        lat: map["lat"],
        lon: map["lon"],
        shopOpen: map["shop_open"],
        shopClose: map["shop_close"],
        description: map["description"],
        rating: map["rating"],
        // dateTime: DateTime.parse(json["date_time"]),
        percentageDiscount: map["percentage_discount"],
        openTime: map["open_time"],
        closeTime: map["close_time"],
        quantity: map["quantity"],
        amount: map["amount"],
        discountAmount: map["discount_amount"],
        afterDiscountAmount: map["after_discount_amount"],
        status: map["status"],
        bagsName: map["bags_name"],
        appointments: List<Appointment>.from(
          map['appointments']?.map((dynamic x) => Appointment.fromMap(x)),
        ),
        // services: List<String>.from(map['services']?.map((dynamic x) => x)),
        daysOpen: Map<String, bool>.from(map['daysOpen']), // Add this line
      );

  factory ShopModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;

    return ShopModel(
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
      // // dateTime: DateTime.parse(json["date_time"]),
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
      services: List<String>.from(json['services']?.map((dynamic x) => x)),
      daysOpen: Map<String, bool>.from(json['daysOpen']), // Add this line
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "owner_id": ownerId ?? '',
        "shop_name": shopName ?? '',
        "shop_image": shopImage ?? '',
        "shop_mobile_number": shopMobileNumber ?? '',
        "shop_address": shopAddress ?? '',
        "lat": lat ?? '',
        "lon": lon ?? '',
        "shop_open": shopOpen ?? '',
        "shop_close": shopClose ?? '',
        "description": description ?? '',
        "rating": rating ?? '',
        // "date_time": dateTime?.toIso8601String() ?? '',
        "percentage_discount": percentageDiscount ?? '',
        "open_time": openTime ?? '',
        "close_time": closeTime ?? '',
        "quantity": quantity ?? '',
        "amount": amount ?? '',
        "discount_amount": discountAmount ?? '',
        "after_discount_amount": afterDiscountAmount ?? '',
        "status": status ?? '',
        "bags_name": bagsName ?? '',
        "appointments": appointments == null
            ? []
            : appointments!.map((e) => e.toJson()).toList(),
        "services": services == null ? [] : services,
        'daysOpen': daysOpen,
      };
}
