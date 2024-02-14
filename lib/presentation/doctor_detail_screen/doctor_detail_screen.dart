import 'package:mahad_s_application3/controllers/services_methods.dart';
import 'package:mahad_s_application3/models/service_model.dart';
import 'package:mahad_s_application3/models/shops_model.dart';
import 'package:mahad_s_application3/presentation/doctor_detail_screen/widgets/service_card_widget.dart';
import 'package:mahad_s_application3/presentation/service_detail_screen/service_detail_screen.dart';
import 'package:mahad_s_application3/widgets/date_day_container.dart';

import '../../widgets/Time_pill_container.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';

class DoctorDetailScreen extends StatefulWidget {
  DoctorDetailScreen({Key? key, required this.shop}) : super(key: key);
  ShopModel shop;

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.v),
          child: Column(children: [
            _buildDoctorInformation(context),
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
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ServiceDetailScreen(
                                    service: service[index]),
                              )),
                              child: ServiceCardWidget(
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
            SizedBox(height: 5.v),
            // _buildDateTime(context),
            SizedBox(height: 5.v)
          ])),
      // bottomNavigationBar: _buildBookAppointmentButton(context),
    ));
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
            AppbarSubtitleOne(text: AppLocalizations.of(context)!.lbl_details),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h),
              onTap: () {
                // onTapOverflowMenu(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildDoctorInformation(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 41.h),
          child: Row(children: [
            CustomImageView(
                imagePath: widget.shop.shopImage.toString() == ''
                    ? ImageConstant.imageNotFound
                    : widget.shop.shopImage.toString(),
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
                      Text(widget.shop.id.toString(),
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 8.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgStar,
                            height: 16.adaptSize,
                            width: 16.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(AppLocalizations.of(context)!.lbl_4_7,
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
                          child: Text(
                            widget.shop.shopAddress.toString(),
                          ),
                        )
                      ])
                    ]))
          ])),
      SizedBox(height: 17.v),
      Text(AppLocalizations.of(context)!.lbl_about,
          style: CustomTextStyles.titleMedium16),
      SizedBox(height: 8.v),
      SizedBox(
          width: 305.h,
          child: ReadMoreText(
              widget.shop.description == ''
                  ? 'No Details'
                  : widget.shop.description.toString(),
              trimLines: 3,
              colorClickableText: theme.colorScheme.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: AppLocalizations.of(context)!.lbl_read_more,
              moreStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50),
              lessStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50)))
    ]);
  }

  /// Section Widget
  Widget _buildDateTime(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        DateDayContainer(
            day: AppLocalizations.of(context)!.lbl_mon,
            date: AppLocalizations.of(context)!.lbl_21),
        Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: DateDayContainer(
                day: AppLocalizations.of(context)!.lbl_tue,
                date: AppLocalizations.of(context)!.lbl_22)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: DateDayContainer(
                day: AppLocalizations.of(context)!.lbl_wed,
                date: AppLocalizations.of(context)!.lbl_23)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: DateDayContainer(
                day: AppLocalizations.of(context)!.lbl_thu,
                date: AppLocalizations.of(context)!.lbl_24)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: DateDayContainer(
                day: AppLocalizations.of(context)!.lbl_fri,
                date: AppLocalizations.of(context)!.lbl_25)),
        Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: DateDayContainer(
                day: AppLocalizations.of(context)!.lbl_sat,
                date: AppLocalizations.of(context)!.lbl_26))
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
                    time: '9;00 AM',
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
                  margin: EdgeInsets.only(left: 16.h),
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.bookingDoctorScreen);
                  }))
        ]));
  }

  /// Common widget
}
