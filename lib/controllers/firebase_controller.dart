import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_screen.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';

class FirebaseController extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User> _firebaseUser = Rx<User>();

  String get userEmail => _firebaseUser.value?.email;
  String get imgUrl => _firebaseUser.value?.photoURL;
  String get userName => _firebaseUser.value?.displayName;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void google_signIn() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final User user =
        (await _auth.signInWithCredential(credential).then((value) {
      Get.offAll(
        HomeScreen(),
      );
      // print("user ${value}");
    }));
  }

  void google_signOut() async {
    // await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    GetStorage().remove('logged');
    Get.offAll(SignInScreen());
  }
}
