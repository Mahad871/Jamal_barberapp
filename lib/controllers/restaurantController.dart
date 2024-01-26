// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:mahad_s_application3/models/shops_models.dart';

// class RestaurantController extends GetxController {
//   Rx<AllShops> allRestaurants = AllShops().obs;
//   var isLoading = true.obs;

//   @override
//   onInit() {
//     fetchRestaurants();
//     // fetchWishList();
//     // fetchCart();
//     super.onInit();
//   }

//   // fetchWishList() async {
//   //   try {
//   //     isLoading(true);
//   //     var wishList = await RemoteServices.fetchWishList();
//   //     if (wishList != null) {
//   //       allWishListItems.value = wishList;
//   //     }
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   // }

//   fetchRestaurants() async {
//     try {
//       isLoading(true);
//       var restaurants = await RemoteServices.fetchRestaurants();
//       if (restaurants != null) {
//         allRestaurants.value = restaurants;
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   // fetchCart() async {
//   //   try {
//   //     isLoading(true);
//   //     var cart = await RemoteServices.fetchCart();
//   //     if (cart != null) {
//   //       allCartItems.value = cart;
//   //     }
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   // }
// }
