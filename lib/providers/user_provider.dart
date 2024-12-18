import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mahad_s_application3/controllers/firebase/auth_methods.dart';
import 'package:mahad_s_application3/controllers/firebase/user_api.dart';
import 'package:mahad_s_application3/dependencyInjection/injection_container.dart';
import 'package:mahad_s_application3/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    init();
  }
  List<UserModel> _user = <UserModel>[];
  String _searchText = '';

  void init() async {
    if (_user.isNotEmpty) return;
    _user.addAll(await UserAPI().getAllUsers() as List<UserModel>);
  }

  Future<void> refresh() async {
    _user = await UserAPI().getAllUsers() as List<UserModel>;
    notifyListeners();
  }

  // block(UserModel user) async {
  //   int index = _indexOf(user.uid);
  //   int myIndex = _indexOf(AuthMethods.uid);
  //   if (index < 0 || myIndex < 0) return;
  //   if (_user[index].blockedBy != null ||
  //       (_user[index].blockedBy?.contains(AuthMethods.uid) ?? false)) {
  //     _user[index].blockedBy?.remove(AuthMethods.uid);
  //     _user[myIndex].blockTo?.remove(_user[index].uid);
  //     CustomToast.successToast(message: 'Unblocked');
  //     final UserModel by = _user[index];
  //     final UserModel to = _user[myIndex];
  //     by.blockedBy?.clear();
  //     to.blockTo?.clear();
  //     by.blockedBy?.add(AuthMethods.uid);
  //     to.blockTo?.add(by.uid);
  //     await UserAPI().unblockBy(user: by);
  //     await UserAPI().unblockTo(user: to);
  //   } else {
  //     log('blocking');
  //     _user[index].blockedBy?.add(AuthMethods.uid);
  //     _user[myIndex].blockTo?.add(_user[index].uid);
  //     CustomToast.successToast(message: 'Blocked');
  //     await UserAPI().blockBy(user: _user[index]);
  //     await UserAPI().blockTo(user: _user[myIndex]);
  //   }
  //   await refresh();
  // }

  // report(UserModel user, ReportUser repo) async {
  //   int index = _indexOf(user.uid);
  //   if (index < 0) return;
  //   _user[index].reports?.add(repo);
  //   notifyListeners();
  //   await UserAPI().report(user: _user[index]);
  // }

  // updateProfile(UserModel value) async {
  //   if (value.uid != AuthMethods.uid) return;
  //   int index = _indexOf(value.uid);
  //   if (index < 0) return;
  //   _user[index] = value;
  //   notifyListeners();
  //   await UserAPI().updateProfile(user: _user[index]);
  // }

  List<UserModel> usersFromListOfString({required List<String> uidsList}) {
    List<UserModel> tempList = <UserModel>[];
    for (String element in uidsList) {
      tempList.add(_user[_indexOf(element)]);
    }
    return tempList;
  }

  UserModel userFromUid(String uid) {
    return _user[_indexOf(uid)];
  }

  // List<MyDeviceToken> deviceTokensFromListOfString(
  //     {required List<String> uidsList}) {
  //   List<UserModel> tempList = <UserModel>[];
  //   List<MyDeviceToken> tokens = <MyDeviceToken>[];
  //   for (String element in uidsList) {
  //     tempList.add(_user[_indexOf(element)]);
  //   }

  //   for (UserModel e in tempList) {
  //     if (e.deviceToken != null) {
  //       tokens.add(e.deviceToken![0]);
  //     }
  //   }
  //   return tokens;
  // }

  onSearch(String? value) {
    _searchText = value ?? '';
    notifyListeners();
  }

  List<UserModel> get users => <UserModel>[..._user];

  UserModel user({required String uid}) {
    int index = _indexOf(uid);
    return index < 0 ? _null : _user[index];
  }

  // UserModel? userByPhone({required String value}) {
  //   int index = _user.indexWhere(
  //       (UserModel element) => value.contains(element.phoneNumber.number));
  //   return index < 0 ? null : _user[index];
  // }

  bool usernameExist({required String value}) {
    final int index = _user.indexWhere((UserModel element) =>
        element.username.toLowerCase() == value.toLowerCase());
    if (index < 0) return false;
    if (_user[index].uid == sl.get<AuthMethods>().currentUserData!.uid)
      return false;
    return true;
  }

  int _indexOf(String uid) {
    int index = _user.indexWhere((UserModel element) => element.uid == uid);
    return index;
  }

  static UserModel get _null => UserModel(
        email: 'null',
        username: 'null',
        bookings: [],
        password: '',
        isBarber: false,
        isOnline: false,
        file: null,
      );
}
