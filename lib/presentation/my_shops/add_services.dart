import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahad_s_application3/controllers/firebase/auth_methods.dart';
import 'package:mahad_s_application3/controllers/shop_methods.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/models/appointments_model.dart';
import 'package:mahad_s_application3/models/services_model.dart';
import 'package:mahad_s_application3/models/shops_models.dart';
import 'package:mahad_s_application3/models/user_model.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_checkbox_button.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_icon_button.dart';
import 'package:mahad_s_application3/widgets/custom_outlined_button.dart';
import 'package:mahad_s_application3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: must_be_immutable
class AddServicesScreen extends StatefulWidget {
  AddServicesScreen({Key? key, required this.shopID}) : super(key: key);
  String? shopID;
  @override
  State<AddServicesScreen> createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends State<AddServicesScreen>
    with TickerProviderStateMixin {
  TextEditingController nameEditTextController = TextEditingController();
  TextEditingController descreptionEditTextController = TextEditingController();
  TextEditingController addressEditTextController = TextEditingController();
  TextEditingController shopMobileNumberController =
      TextEditingController(); // Add this line
  TextEditingController servicesEditTextController = TextEditingController();
  List<ServiceModel> services = [];

  bool agreeCheckBox = false;
  bool showPassword = false;
  bool isloading = false;
  late TabController tabviewController;
  bool isBarber = false;

  TimeOfDay selectedOpenTime = TimeOfDay.now();
  TimeOfDay selectedCloseTime = TimeOfDay.now();

  Future<void> _selectOpenTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedOpenTime = pickedTime;
      });
    }
  }

  Future<void> _selectCloseTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedCloseTime = pickedTime;
      });
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    tabviewController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.h, vertical: 40.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildProfileSection(context),

                            // _buildTabview(context),
                            SizedBox(height: 25.v),
                            _buildNameEditText(context),
                            SizedBox(height: 16.v),
                            // _buildDescreptionEditText(context),
                            SizedBox(height: 16.v),
                            // _buildAddressEditText(context),
                            SizedBox(height: 16.v),
                            _buildPriceSection(context),
                            // _buildAgreeCheckBox(context),
                            SizedBox(height: 16.v),

                            // _buildOpenTimePickerSection(context),

                            SizedBox(height: 16.v),

                            // _buildCloseTimePickerSection(context),
                            SizedBox(height: 16.v),
                            // _buildDaysOpenSection(context),
                            SizedBox(height: 16.v),

                            _buildServicesSheet(context),

                            SizedBox(height: 16.v),
                            // _buildServicesList(),
                            SizedBox(height: 16.v),
                            SizedBox(height: 29.v),
                            _buildAddServiceButton(context),
                            SizedBox(height: 26.v),
                            SizedBox(height: 5.v),
                          ]))),
            )));
  }

  Widget _buildProfileSection(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 122.v,
          width: 121.h,
          child: Stack(alignment: Alignment.bottomRight, children: [
            CustomImageView(
                imagePath: ImageConstant.appLogo,
                height: 200.adaptSize,
                width: 200.adaptSize,
                radius: BorderRadius.circular(40.h),
                alignment: Alignment.center),
            CustomIconButton(
                onTap: () {},
                height: 34.adaptSize,
                width: 34.adaptSize,
                padding: EdgeInsets.all(4.h),
                decoration: IconButtonStyleHelper.fillWhiteA,
                alignment: Alignment.bottomRight,
                child: CustomImageView(imagePath: ImageConstant.imgCamera))
          ])),
    ]);
  }

  CustomElevatedButton _buildAddServiceButton(BuildContext context) {
    return CustomElevatedButton(
      isLoading: this.isloading,
      text: AppLocalizations.of(context)!.lbl_add_shop,
      onPressed: () async {
        setState(() {
          this.isloading = true;
        });

        setState(() {
          this.isloading = false;
        });
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      // leading: AppbarLeadingImage(
      //     imagePath: ImageConstant.imgArrowLeft,
      //     margin: EdgeInsets.only(left: 24.h),
      //     onTap: () {
      //       Navigator.pop(context);
      //     }),
      centerTitle: true,
      title:
          AppbarSubtitleTwo(text: AppLocalizations.of(context)!.lbl_add_shop),
    );
  }

  _buildServicesField(BuildContext context, StateSetter setModalState) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomTextFormField(
                    controller: servicesEditTextController,
                    hintText: "  Services",
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
                        // services.add(servicesEditTextController.text);
                        // servicesEditTextController.clear();
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
    return Container(
      height: 50.v,
      child: ElevatedButton(
        onPressed: () {
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
                            child: ListView.builder(
                              itemCount: services.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(services[index].name),
                                      IconButton.outlined(
                                        onPressed: () {
                                          setModalState(() {
                                            services.removeAt(index);
                                          });
                                        },
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 16.v),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Add Services', style: TextStyle(color: Colors.white))),
      ),
    );
  }

  Widget _buildServicesList() {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(services[index].name),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: nameEditTextController,
        hintText: "Service name",
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget

  Widget _buildPriceSection(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
          controller: shopMobileNumberController,
          hintText: AppLocalizations.of(context)!.lbl_1234567890,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.phone,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgCall,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          contentPadding:
              EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v)),
    ]);
  }

  /// Section Widget

  Widget _buildDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
          child: SizedBox(width: 137.h, child: Divider()),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
          child: SizedBox(width: 137.h, child: Divider()),
        ),
      ],
    );
  }

  /// Section Widget
}
