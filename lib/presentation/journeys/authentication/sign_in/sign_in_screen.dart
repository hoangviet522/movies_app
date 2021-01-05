import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/extensions/string_extensions.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/sign_in_screen_widget.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          title: Text(
            TranslationConstants.signin.t(context),
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        body: SignInScreenWidget(),
      ),
    );
  }
}
