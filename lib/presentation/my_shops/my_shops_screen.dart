import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mahad_s_application3/controllers/shop_methods.dart';
import 'package:mahad_s_application3/models/shops_model.dart';
import 'package:mahad_s_application3/presentation/my_shops/widgets/my_shop_details_item.dart';

import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/presentation/my_shops/widgets/my_shop_details_screen.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';

class MyShopsScreen extends StatefulWidget {
  const MyShopsScreen({Key? key}) : super(key: key);

  @override
  State<MyShopsScreen> createState() => _MyShopsScreenState();
}

class _MyShopsScreenState extends State<MyShopsScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    ShopMethods shopMethods = sl.get<ShopMethods>();
    // shopMethods.getAllShops();
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(left: 24.h, top: 24.v, right: 24.h),
          child: FutureBuilder<List<ShopModel>>(
            future: shopMethods.getAllShops(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<ShopModel> shops = snapshot.data!;
                return ListView.builder(
                  itemCount: shops.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyShopDetailsScreen(
                                shop: shops[index],
                              ),
                            ));
                      },
                      child: MyShopDetailsItem(
                        shopModel: shops[index],
                      ),
                    );
                  },
                );
              } else {
                return Text('No shops found');
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.addShopScreen);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 24.h),
          onTap: () {
            Navigator.pop(context);
          }),
      centerTitle: true,
      title:
          AppbarSubtitleTwo(text: AppLocalizations.of(context)!.lbl_my_shpos),
    );
  }
}
