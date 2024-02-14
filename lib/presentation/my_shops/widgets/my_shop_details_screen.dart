import 'package:flutter/material.dart';
import 'package:mahad_s_application3/controllers/services_methods.dart';
import 'package:mahad_s_application3/controllers/shop_methods.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/models/service_model.dart';
import 'package:mahad_s_application3/models/shops_model.dart';
import 'package:mahad_s_application3/widgets/Time_pill_container.dart';
import 'package:mahad_s_application3/presentation/my_shops/widgets/my_shop_service_card_widget.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_icon_button.dart';
import 'package:mahad_s_application3/widgets/custom_text_form_field.dart';
import 'package:readmore/readmore.dart';

class MyShopDetailsScreen extends StatefulWidget {
  ShopModel shop;

  MyShopDetailsScreen({required this.shop});

  @override
  State<MyShopDetailsScreen> createState() => _MyShopDetailsScreenState();
}

class _MyShopDetailsScreenState extends State<MyShopDetailsScreen> {
  TextEditingController serviceNameTextController = TextEditingController();
  TextEditingController servicePriceTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.v),
          child: Column(children: [
            _buildShopInformation(context),
            SizedBox(height: 31.v),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<List<ServiceModel>>(
                  future: sl
                      .get<ServiceMethods>()
                      .getServicesforShop(widget.shop.id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<ServiceModel> service = snapshot.data!;

                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: service.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(AppRoutes.drugsDetailScreen),
                              child: MyShopServiceCardWidget(
                                  onTapTrash: () {
                                    setState(() {
                                      sl.get<ServiceMethods>().removeService(
                                          service[index].id.toString());
                                    });
                                  },
                                  serviceModel: service[index]),
                            ),
                          );
                        },
                      );
                    } else {
                      return Text('No service available');
                    }
                  },
                ),
              ),
            ),

            // _buildDateTime(context),
            SizedBox(height: 5.v)
          ])),
      // bottomNavigationBar: _buildBookAppointmentButton(context),
    ));
  }

  _buildServicesField(BuildContext context, StateSetter setModalState) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextFormField(
              controller: serviceNameTextController,
              textInputAction: TextInputAction.done,
              hintText: "  Name",
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              contentPadding:
                  EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v)),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomTextFormField(
                    controller: servicePriceTextController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    hintText: "  price",
                    prefixConstraints: BoxConstraints(maxHeight: 56.v),
                    contentPadding:
                        EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v)),
              ),
              SizedBox(width: 16.h),
              Expanded(
                flex: 1,
                child: CustomElevatedButton(
                    text: 'Add',
                    onPressed: () {
                      setModalState(() {
                        ServiceModel serviceModel = ServiceModel(
                            shopID: widget.shop.id.toString(),
                            name: serviceNameTextController.text,
                            price:
                                double.parse(servicePriceTextController.text));
                        sl.get<ServiceMethods>().addService(serviceModel);
                        serviceNameTextController.clear();
                        servicePriceTextController.clear();
                      });
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildServicesSheet(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Services',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<ServiceModel>>(
                            future: sl
                                .get<ServiceMethods>()
                                .getServicesforShop(widget.shop.id.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                List<ServiceModel> service = snapshot.data!;

                                return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: service.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .pushNamed(
                                                AppRoutes.drugsDetailScreen),
                                        child: MyShopServiceCardWidget(
                                            onTapTrash: () {
                                              setState(() {
                                                sl
                                                    .get<ServiceMethods>()
                                                    .removeService(
                                                        service[index]
                                                            .id
                                                            .toString());
                                              });
                                            },
                                            serviceModel: service[index]),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return Text('No service available');
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 16.v),
                        _buildServicesField(context, setModalState),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: CustomImageView(
        imagePath: ImageConstant.imgPlus,
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
      title: AppbarSubtitleOne(text: AppLocalizations.of(context)!.lbl_details),
    );
  }

  /// Section Widget
  Widget _buildShopInformation(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 41.h),
          child: Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imageNotFound,
                height: 111.adaptSize,
                width: 111.adaptSize,
                radius: BorderRadius.circular(8.h)),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 5.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.shop.shopName.toString(),
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 8.v),
                      // Text(AppLocalizations.of(context)!.lbl_chardiologist,
                      //     style: theme.textTheme.labelLarge),
                      SizedBox(height: 8.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgStar,
                            height: 16.adaptSize,
                            width: 16.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                                widget.shop.rating.toString() == ''
                                    ? '0'
                                    : widget.shop.rating.toString(),
                                style: CustomTextStyles.labelLargeAmber500))
                      ]),
                      SizedBox(height: 11.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgLocation,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                            margin: EdgeInsets.only(bottom: 2.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text(widget.shop.shopAddress.toString(),
                                style: theme.textTheme.labelLarge))
                      ])
                    ]))
          ])),
      SizedBox(height: 17.v),
      Text(AppLocalizations.of(context)!.lbl_about,
          style: CustomTextStyles.titleMedium16),
      SizedBox(height: 8.v),
      SizedBox(
          width: 305.h,
          child: ReadMoreText(widget.shop.description.toString(),
              trimLines: 3,
              colorClickableText: theme.colorScheme.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: AppLocalizations.of(context)!.lbl_read_more,
              moreStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50),
              lessStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50))),
      SizedBox(height: 17.v),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Services', style: CustomTextStyles.titleLargeSemiBold),
          _buildServicesSheet(context)
        ],
      ),
      SizedBox(height: 8.v),
    ]);
  }

  /// Section Widget
  Widget _buildDateTime(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildThirtyOne(context,
            dynamicText1: AppLocalizations.of(context)!.lbl_mon,
            dynamicText2: AppLocalizations.of(context)!.lbl_21),
        Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_tue,
                dynamicText2: AppLocalizations.of(context)!.lbl_22)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_wed,
                dynamicText2: AppLocalizations.of(context)!.lbl_23)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_thu,
                dynamicText2: AppLocalizations.of(context)!.lbl_24)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_fri,
                dynamicText2: AppLocalizations.of(context)!.lbl_25)),
        Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_sat,
                dynamicText2: AppLocalizations.of(context)!.lbl_26))
      ]),
      SizedBox(height: 32.v),
      Divider(),
      SizedBox(height: 32.v),
      Wrap(
          runSpacing: 9.v,
          spacing: 9.h,
          children: List<Widget>.generate(
              9,
              (index) => TimePillContainer(
                    time: TimeOfDay.now().toString(),
                  )))
    ]);
  }

  /// Section Widget
  Widget _buildBookAppointmentButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 28.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomElevatedButton(
                  height: 50.v,
                  text: AppLocalizations.of(context)!.lbl_book_apointment,
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1,
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.myCartScreen);
                  }))
        ]));
  }

  /// Common widget
  Widget _buildThirtyOne(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 9.v),
        decoration: AppDecoration.outlineGray300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 5.v),
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(dynamicText1,
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: appTheme.gray500))),
              SizedBox(height: 4.v),
              Text(dynamicText2,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.colorScheme.onPrimary))
            ]));
  }
}
