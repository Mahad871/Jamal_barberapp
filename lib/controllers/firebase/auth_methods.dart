import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahad_s_application3/controllers/firebase/user_api.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/dependencyInjection/injection_container.dart';
import 'package:mahad_s_application3/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mahad_s_application3/providers/user_provider.dart';

class AuthMethods extends ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final _storage = GetStorage();

  UserCredential? currentUser;
  UserModel? currentUserData;

  Future<bool> createUser(UserModel user) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      user.uid = credential.user!.uid;
      await db.collection('users').doc(credential.user!.uid).set(user.toJson());
    } catch (e) {
      print(e);
      return false;
    }
    currentUserData=user;
    notifyListeners();
    return true;
  }

  Future<bool> signUpWithGoogle({bool isBarber = false}) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await auth.signInWithCredential(credential);

      final UserModel? userModel =
          await UserAPI().user(uid: authResult.user!.uid);

      if (userModel == null) {
        UserModel user = UserModel(
          uid: authResult.user!.uid,
          username: authResult.user!.displayName!,
          email: authResult.user!.email!,
          password: authResult.user!.uid,
          isBarber: isBarber,
          isOnline: false,
          bookings: [],
        );
        await db
            .collection('users')
            .doc(authResult.user!.uid)
            .set(user.toJson());
        currentUserData = user;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<int> verifyOTP(String verificationId, String otp) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      final UserCredential authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        final UserModel? userModel =
            await UserAPI().user(uid: authCredential.user!.uid);
        if (userModel == null) return 0; // User is New on App
        return 1; // User Already Exist NO new info needed
      }
      return -1; // ERROR while Entering OTP
    } catch (ex) {
      // ...

      Fluttertoast.showToast(
          msg: ex.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      return -1;
    }
  }

  Future<void> deleteAccount() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserData!.uid)
        .delete();
    final QuerySnapshot<Map<String, dynamic>> products = await FirebaseFirestore
        .instance
        .collection('products')
        .where('uid', isEqualTo: currentUserData!.uid)
        .get();
    if (products.docs.isNotEmpty) {
      for (DocumentSnapshot<Map<String, dynamic>> doc in products.docs) {
        await FirebaseFirestore.instance
            .collection('products')
            .doc(doc.data()?['pid'])
            .delete();
      }
      await FirebaseStorage.instance
          .ref('products/${currentUserData?.uid}')
          .delete();
    }
    await auth.currentUser!.delete();
  }

  Future<String> signinUser(
      {required String email, required String password}) async {
    try {
      UserCredential cred = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (auth.currentUser == null) {
        return "failed";
      }
      currentUser = cred;
      await getCurrentUserData(email);
      // await sl.get<LocationApi>().determinePosition();
      // currentUserData?.longitude =
      //     sl.get<LocationApi>().currentPosistion.longitude;
      // currentUserData?.latitude =
      //     sl.get<LocationApi>().currentPosistion.latitude;
      // await updateUserLocation();
    } catch (e) {
      print(e);
      return e.toString();
    }

    notifyListeners();

    return "success";
  }

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          UserModel? userModel =
              await UserAPI().user(uid: userCredential.user!.uid);
          if (userModel != null) {
            signinUser(
                email: userCredential.user!.email!,
                password: userCredential.user!.email!);
            currentUser = userCredential;
            currentUserData = userModel;
            return "success";
          }
          //sign out user from google with app

          // Fluttertoast.showToast(
          //     msg: "Welcome " + userCredential.user!.displayName.toString(),
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.white,
          //     textColor: Colors.black);
        }
      }
      // Fluttertoast.showToast(
      //     msg: "Problem Signing In",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white);
      await googleSignIn.signOut();
      await auth.signOut();
      return "failed";
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  // updateUser() async {
  //   // await _auth
  //   //     .signInWithEmailAndPassword(
  //   //         email: currentUser.user!.email.toString(),
  //   //         password: currentUserData.password)
  //   //     .then((value) {
  //   //   currentUser.user!.updateEmail(currentUserData.email);
  //   //   currentUser.user!.updatePassword(currentUserData.password);
  //   // });

  //   if (currentUserData!.file != null) {
  //     String photoUrl = await FirebaseStorageModel()
  //         .uploadImageToFIrebase("profilePics", currentUserData!.file!, false);
  //     currentUserData?.photoUrl = photoUrl;
  //   }

  //   await db
  //       .collection('users')
  //       .doc(currentUser!.user!.uid)
  //       .set(currentUserData!.toJson());
  //   notifyListeners();
  // }

  // updateUserLocation() async {
  //   await db
  //       .collection('users')
  //       .doc(currentUser!.user!.uid)
  //       .set(currentUserData!.toJson());
  //   notifyListeners();
  // }

  void writeUserdataOnStorage() {
    _storage.write('mail', currentUserData!.email);
    _storage.write('pass', currentUserData!.password);
  }

  getCurrentUserData(String mail) async {
    final snapshot =
        await db.collection('users').where('email', isEqualTo: mail).get();
    currentUserData =
        snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).single;
    // print(currentUserData!.username.toString());
    notifyListeners();
  }

  autoSignIn(String mail) async {
    await getCurrentUserData(mail);
    await signinUser(
        email: currentUserData!.email, password: currentUserData!.password);
    return AppRoutes.homeContainerScreen;
  }

  Future<List<UserModel>> getAllUserData() async {
    final snapshot = await db.collection('users').get();
    List<UserModel> currentUserDataList =
        snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
    return currentUserDataList;
  }

  // Future<void> setDeviceToken(List<MyDeviceToken> deviceToken) async {
  //   try {
  //     await db
  //         .collection('users')
  //         .doc(currentUserData!.id)
  //         .update(<String, dynamic>{
  //       'devices_tokens':
  //           deviceToken.map((MyDeviceToken e) => e.toMap()).toList()
  //     });
  //   } catch (e) {
  //     CustomToast.errorToast(message: 'Something Went Wrong Token setup');
  //   }
  // }

  Future<List<UserModel>> getUserDataWhere() async {
    final snapshot = await db.collection('users').get();
    List<UserModel> currentUserDataList =
        snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
    return currentUserDataList;
  }

  Future<UserModel> recieveUserData(String id) async {
    final snapshot =
        await db.collection('users').where('uid', isEqualTo: id).get();
    UserModel UserData = UserModel(
      username: '',
      email: '',
      password: '',
      bookings: [],
    );
    UserData =
        snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).single;
    // print(currentUserData!.username.toString());
    return UserData;
    notifyListeners();
  }

  Future<UserModel> getUserData(String id) async {
    final snapshot =
        await db.collection('users').where('uid', isEqualTo: id).get();
    UserModel UserData =
        snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).single;
    // print(currentUserData!.username.toString());
    return UserData;
    notifyListeners();
  }

  Future<String> getUserProfileImage(String uid) async {
    final snapshot =
        await db.collection('users').where('uid', isEqualTo: uid).get();
    UserModel UserData =
        snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).single;
    return UserData.photoUrl.toString();
  }

  Stream<UserModel> userDatabyUid(String userId) {
    return db.collection('users').doc(userId).snapshots().map(
          (event) => UserModel.fromMap(
            event.data()!,
          ),
        );
  }

  // followUser({String followerUid = " ", String followingUid = " "}) async {
  //   if (followerUid == followingUid) {
  //     return false;
  //   }

  //   try {
  //     UserModel user = await recieveUserData(followingUid);
  //     user.followers.add(followerUid);
  //     currentUserData?.following.add(followingUid);
  //     user.noOfFollowers = user.followers.length;
  //     currentUserData!.noOfFollowing = currentUserData!.following.length;
  //     await db
  //         .collection('users')
  //         .doc(currentUserData!.id)
  //         .set(currentUserData!.toJson());

  //     await db.collection('users').doc(user.id).set(user.toJson());
  //     notifyListeners();
  //     return true;
  //   } catch (e) {
  //     return CustomToast.errorToast(message: e.toString());
  //   }
  // }

  // unfollowUser({String followerUid = " ", String followingUid = " "}) async {
  //   try {
  //     UserModel user = await recieveUserData(followingUid);
  //     user.followers.remove(followerUid);
  //     currentUserData?.following.remove(followingUid);
  //     user.noOfFollowers = user.followers.length;
  //     currentUserData!.noOfFollowing = currentUserData!.following.length;

  //     await db
  //         .collection('users')
  //         .doc(currentUserData!.id)
  //         .set(currentUserData!.toJson());

  //     await db.collection('users').doc(user.id).set(user.toJson());
  //     notifyListeners();

  //     return true;
  //   } catch (e) {
  //     return CustomToast.errorToast(message: e.toString());
  //   }
  // }

  addNotifications(
      {required final String postId,
      required final String announcementTitle,
      required final String imageUrl,
      required final String eachUserId,
      required String eachUserToken,
      required final String description}) async {
    FirebaseFirestore.instance
        .collection("notifications")
        .doc(eachUserId)
        .collection("userNotifications")
        .doc(postId)
        .set({
      "notificationId": postId,
      "notificationTitle": announcementTitle,
      "description": description,
      "timestamp": DateTime.now(),
      "token": eachUserToken,
      "imageUrl": imageUrl,
      "userId": currentUser!.user!.uid
    });
  }

  // Future getNotifications() async {
  //   List<NotificationModel> tempAllAnnouncements = [];
  //   QuerySnapshot tempAnnouncementsSnapshot = await FirebaseFirestore.instance
  //       .collection('notifications')
  //       .doc(currentUser!.user!.uid)
  //       .collection("userNotifications")
  //       .get();

  //   tempAnnouncementsSnapshot.docs.forEach((element) {
  //     tempAllAnnouncements.add(NotificationModel.fromDocument(element));
  //   });
  //   return tempAllAnnouncements;
  // }

  void signOutUser() async {
    currentUser = null;
    currentUserData = null;
    _storage.remove('user');
    await auth.signOut();
    notifyListeners();
  }
}
