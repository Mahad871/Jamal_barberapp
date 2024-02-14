import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahad_s_application3/controllers/firebase/auth_methods.dart';
import 'package:mahad_s_application3/controllers/services_methods.dart';
import 'package:mahad_s_application3/controllers/shop_methods.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/models/appointment_model.dart';
import 'package:mahad_s_application3/models/service_model.dart';
import 'package:mahad_s_application3/models/shops_model.dart';
import 'package:mahad_s_application3/models/user_model.dart';
import 'package:mahad_s_application3/presentation/my_shops/add_services.dart';
import 'package:mahad_s_application3/widgets/Time_pill_container.dart';
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
class AddShopScreen extends StatefulWidget {
  AddShopScreen({Key? key}) : super(key: key);

  @override
  State<AddShopScreen> createState() => _AddShopScreenState();
}

class _AddShopScreenState extends State<AddShopScreen>
    with TickerProviderStateMixin {
  TextEditingController nameEditTextController = TextEditingController();
  TextEditingController descreptionEditTextController = TextEditingController();
  TextEditingController addressEditTextController = TextEditingController();
  TextEditingController shopMobileNumberController =
      TextEditingController(); // Add this line
  TextEditingController serviceNameTextController = TextEditingController();
  TextEditingController servicePriceTextController = TextEditingController();
  // List<String> services = [];

  Map<String, bool> daysOpen = {
    'Monday': true,
    'Tuesday': true,
    'Wednesday': true,
    'Thursday': true,
    'Friday': true,
    'Saturday': true,
    'Sunday': false,
  };

  bool agreeCheckBox = false;
  bool showPassword = false;
  bool isloading = false;
  late TabController tabviewController;
  bool isBarber = false;

  TimeOfDay selectedOpenTime = TimeOfDay.now();
  TimeOfDay selectedCloseTime = TimeOfDay.now();
  List<ServiceModel> servicesList = [
    ServiceModel(
      shopID: '',
      name: 'Haircut',
      price: 20,
    ),
    ServiceModel(
      shopID: '',
      name: 'Shave',
      price: 15,
    ),
    ServiceModel(
      shopID: '',
      name: 'Beard Trim',
      price: 10,
    ),
    ServiceModel(
      shopID: '',
      name: 'Hair Coloring',
      price: 30,
    ),
    ServiceModel(
      shopID: '',
      name: 'Hair Styling',
      price: 25,
    ),
    ServiceModel(
      shopID: '',
      name: 'Facial',
      price: 35,
    ),
  ];

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
                            _buildDescreptionEditText(context),
                            SizedBox(height: 16.v),
                            _buildAddressEditText(context),
                            SizedBox(height: 16.v),
                            _buildMobileNoSection(context),
                            // _buildAgreeCheckBox(context),
                            SizedBox(height: 16.v),
                            _buildServicesSheet(context),
                            SizedBox(height: 16.v),
                            _buildOpenTimePickerSection(context),

                            SizedBox(height: 16.v),

                            _buildCloseTimePickerSection(context),
                            SizedBox(height: 16.v),
                            _buildDaysOpenSection(context),
                            SizedBox(height: 16.v),

                            SizedBox(height: 16.v),
                            // _buildServicesList(),
                            SizedBox(height: 16.v),
                            SizedBox(height: 29.v),
                            _buildAddShopButton(context),
                            SizedBox(height: 26.v),
                            SizedBox(height: 5.v),
                            // InkWell(
                            //   enableFeedback: true,
                            //   child: CustomOutlinedButton(
                            //     text: AppLocalizations.of(context)!
                            //         .sign_up_with_google,
                            //     onPressed: () async {
                            //       if (tabviewController.index == 0) {
                            //         isBarber = false;
                            //       } else if (tabviewController.index == 1) {
                            //         isBarber = true;
                            //       }
                            //       bool condition = await sl
                            //           .get<AuthMethods>()
                            //           .signUpWithGoogle(isBarber: isBarber);
                            //       if (condition) {
                            //         Navigator.pushNamed(
                            //             context, AppRoutes.signUpSuccessScreen);
                            //       } else {
                            //         Fluttertoast.showToast(
                            //           msg: "Sign up failed",
                            //           toastLength: Toast.LENGTH_SHORT,
                            //           gravity: ToastGravity.BOTTOM,
                            //           backgroundColor: Colors.red,
                            //           textColor: Colors.white,
                            //         );
                            //       }

                            //       // print('pressed !!!!!!!!');
                            //     },
                            //     leftIcon: Container(
                            //       margin: EdgeInsets.only(right: 30.h),
                            //       child: CustomImageView(
                            //         imagePath: ImageConstant.imgGoogle,
                            //         height: 20.v,
                            //         width: 19.h,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ]))),
            )));
  }

  Widget _buildOpenTimePickerSection(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          print('object');
          _selectOpenTime(context);
        },
        child: TimePillContainer(
            time: 'Open Time: ${selectedOpenTime.format(context)}'),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 122.v,
          width: 121.h,
          child: Stack(alignment: Alignment.bottomRight, children: [
            CustomImageView(
                imagePath: ImageConstant.imageNotFound,
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

  Widget _buildCloseTimePickerSection(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          print('object');
          _selectCloseTime(context);
        },
        child: TimePillContainer(
            time: 'Close Time: ${selectedCloseTime.format(context)}'),
      ),
    );
  }

  Widget _buildDaysOpenSection(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.v,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                showDragHandle: true,
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setModalState) {
                      return Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Shop Open Days',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              _buildDivider(context),
                              ...daysOpen.keys.map((String day) {
                                return CheckboxListTile(
                                  title: Text(
                                    day,
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  value: daysOpen[day],
                                  onChanged: (bool? value) {
                                    setModalState(() {
                                      daysOpen[day] = value!;
                                    });
                                  },
                                );
                              }).toList(),
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
              child: Text(
                'Availabale Days',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  CustomElevatedButton _buildAddShopButton(BuildContext context) {
    return CustomElevatedButton(
      isLoading: this.isloading,
      text: AppLocalizations.of(context)!.lbl_add_shop,
      onPressed: () async {
        setState(() {
          this.isloading = true;
        });
        List<AppointmentModel> appointmentss = sl
            .get<ShopMethods>()
            .createAppointmentsforShop(
                DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  selectedOpenTime.hour,
                  selectedOpenTime.minute,
                ),
                DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    selectedCloseTime.hour,
                    selectedCloseTime.minute));

        for (AppointmentModel a in appointmentss) {
          print(a.toJson());
        }

        ShopModel shop = ShopModel(
          ownerId: sl.get<AuthMethods>().currentUserData!.uid.toString(),
          shopName: nameEditTextController.text,
          description: descreptionEditTextController.text,
          shopAddress: addressEditTextController.text,
          shopMobileNumber: shopMobileNumberController.text,
          openTime: selectedOpenTime.toString(),
          closeTime: selectedCloseTime.toString(),
          appointments: [],
          daysOpen: daysOpen,
        );
        String shopID = await sl.get<ShopMethods>().addShop(shop);

        for (ServiceModel s in servicesList) {
          s.shopID = shopID;
          sl.get<ServiceMethods>().addService(s);
        }
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddServicesScreen(
            shopID: shopID,
          ),
        ));
        Navigator.of(context).pop();
        // sl.get<ShopMethods>().addShop(shop);
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
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 24.h),
          onTap: () {
            Navigator.pop(context);
          }),
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
                            shopID: '',
                            name: serviceNameTextController.text,
                            price:
                                double.parse(servicePriceTextController.text));
                        servicesList.add(serviceModel);
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
                              itemCount: servicesList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(servicesList[index].name),
                                          Text(servicesList[index]
                                                  .price
                                                  .toString() +
                                              ' \$'),
                                        ],
                                      ),
                                      IconButton.outlined(
                                        onPressed: () {
                                          setModalState(() {
                                            servicesList.removeAt(index);
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
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text('Manage Services', style: TextStyle(color: Colors.white))),
      ),
    );
  }

  Widget _buildServicesList() {
    return ListView.builder(
      itemCount: servicesList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(servicesList[index].name),
          subtitle: Text(servicesList[index].price.toString()),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: nameEditTextController,
        hintText: "Shop name",
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
  Widget _buildDescreptionEditText(BuildContext context) {
    return CustomTextFormField(
        controller: descreptionEditTextController,
        hintText: "Description",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildAddressEditText(BuildContext context) {
    return CustomTextFormField(
        controller: addressEditTextController,
        hintText: 'Address',
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: !showPassword);
  }

  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 46.v,
      width: 335.h,
      decoration: BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(
          8.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.whiteA700,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: theme.colorScheme.onPrimary,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            8.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              AppLocalizations.of(context)!.lbl_User,
            ),
          ),
          Tab(
            child: Text(
              AppLocalizations.of(context)!.lbl_barber,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNoSection(BuildContext context) {
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
  Widget _buildAgreeCheckBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 28.h),
        child: CustomCheckboxButton(
            text: "msg_i_agree_to_the_medidoc",
            isExpandedText: true,
            value: agreeCheckBox,
            onChange: (value) {
              agreeCheckBox = value;
            }));
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
  Widget _buildSocial(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.v),
        // CustomOutlinedButton(
        //   text: "msg_sign_in_with_apple".tr,
        //   leftIcon: Container(
        //     margin: EdgeInsets.only(right: 30.h),
        //     child: CustomImageView(
        //       imagePath: ImageConstant.imgApple,
        //       height: 20.v,
        //       width: 16.h,
        //     ),
        //   ),
        // ),
        // SizedBox(height: 16.v),
        // CustomOutlinedButton(
        //   text: "msg_sign_in_with_facebook".tr,
        //   leftIcon: Container(
        //     padding: EdgeInsets.fromLTRB(7.h, 4.v, 6.h, 4.v),
        //     margin: EdgeInsets.only(right: 30.h),
        //     decoration: BoxDecoration(
        //       color: appTheme.blue600,
        //       borderRadius: BorderRadius.circular(10.h),
        //     ),
        //     child: CustomImageView(
        //       imagePath: ImageConstant.imgFacebook,
        //       height: 11.v,
        //       width: 6.h,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
