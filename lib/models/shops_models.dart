// To parse this JSON data, do
//
//     final allRestaurants = allRestaurantsFromJson(jsonString);

import 'dart:convert';

AllShops allRestaurantsFromJson(String str) =>
    AllShops.fromJson(json.decode(str));

String allShopsToJson(AllShops data) => json.encode(data.toJson());

class AllShops {
  AllShops({
    required this.result,
    this.message,
    this.status,
  });

  List<ShopDetails> result;
  String? message;
  String? status;

  factory AllShops.fromJson(Map<String, dynamic> json) => AllShops(
        result: List<ShopDetails>.from(
            json["result"].map((x) => ShopDetails.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

// To parse this JSON data, do
//
//     final restaurantDetails = restaurantDetailsFromJson(jsonString);

class ShopDetails {
  ShopDetails({
    this.id,
    this.restaurantName,
    this.restaurantImage,
    this.restaurantMobileNumber,
    this.restaurantAddress,
    this.lat,
    this.lon,
    this.shopOpen,
    this.shopClose,
    this.description,
    this.rating,
    this.dateTime,
    this.percentageDiscount,
    this.startTime,
    this.endTime,
    this.quantity,
    this.amount,
    this.discountAmount,
    this.afterDiscountAmount,
    this.status,
    this.bagsName,
    this.isWishListed,
  });

  String? id;
  String? restaurantName;
  String? restaurantImage;
  String? restaurantMobileNumber;
  String? restaurantAddress;
  String? lat;
  String? lon;
  String? shopOpen;
  String? shopClose;
  String? description;
  String? rating;
  DateTime? dateTime;
  String? percentageDiscount;
  String? startTime;
  String? endTime;
  String? quantity;
  String? amount;
  String? discountAmount;
  String? afterDiscountAmount;
  String? status;
  String? bagsName;
  bool? isWishListed;

  factory ShopDetails.fromJson(Map<String, dynamic> json) => ShopDetails(
        id: json["id"],
        restaurantName: json["shop_name"],
        restaurantImage: json["shop_image"],
        restaurantMobileNumber: json["shop_mobile_number"],
        restaurantAddress: json["shop_address"],
        lat: json["lat"],
        lon: json["lon"],
        shopOpen: json["shop_open"],
        shopClose: json["shop_close"],
        description: json["description"],
        rating: json["rating"],
        dateTime: DateTime.parse(json["date_time"]),
        percentageDiscount: json["percentage_discount"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        quantity: json["quantity"],
        amount: json["amount"],
        discountAmount: json["discount_amount"],
        afterDiscountAmount: json["after_discount_amount"],
        status: json["status"],
        bagsName: json["bags_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_name": restaurantName,
        "shop_image": restaurantImage,
        "shop_mobile_number": restaurantMobileNumber,
        "shop_address": restaurantAddress,
        "lat": lat,
        "lon": lon,
        "shop_open": shopOpen,
        "shop_close": shopClose,
        "description": description,
        "rating": rating,
        "date_time": dateTime?.toIso8601String(),
        "percentage_discount": percentageDiscount,
        "start_time": startTime,
        "end_time": endTime,
        "quantity": quantity,
        "amount": amount,
        "discount_amount": discountAmount,
        "after_discount_amount": afterDiscountAmount,
        "status": status,
        "bags_name": bagsName,
      };
}
