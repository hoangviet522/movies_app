import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_screen_widget.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   automaticallyImplyLeading: true,
        //   title: Text(
        //     TranslationConstants.signin.t(context),
        //     style: Theme.of(context).textTheme.subtitle1,
        //   ),
        // ),
        body: SignInScreenWidget(),
        // body: isSignIn
        //     ? Center(
        //         child: Column(
        //           children: <Widget>[
        //             CircleAvatar(
        //               backgroundImage: NetworkImage(_user.photoURL),
        //             ),
        //             Text(_user.displayName),
        //             OutlineButton(
        //               onPressed: () {
        //                 googleSignOut();
        //               },
        //               child: Text("LogOut"),
        //             ),
        //           ],
        //         ),
        //       )
        //     : Center(
        //         child: OutlineButton(
        //           onPressed: () {
        //             handleSignIn();
        //           },
        //           child: Text("Sign In With Googlewww"),
        //         ),
        //       ),
      ),
    );
  }
}
