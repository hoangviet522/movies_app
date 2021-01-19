import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/common_constants.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/custom_surffix_icon.dart';
import 'package:mygarment/presentation/widgets/default_button.dart';
import 'package:mygarment/presentation/widgets/form_errors.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';
import '../../../themes/theme_text.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_20.w,
        vertical: Sizes.dimen_14.h,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: Sizes.dimen_4.h,
            ),
            buildEmailFormField(),
            SizedBox(
              height: Sizes.dimen_10.h,
            ),
            Text(
              "Password",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: Sizes.dimen_4.h,
            ),
            buildPasswordFormField(),
            SizedBox(
              height: Sizes.dimen_16.h,
            ),
            Container(
              width: ScreenUtil.screenWidth,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
                gradient: new LinearGradient(
                  colors: [Colors.blueGrey, Colors.grey],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                child: new Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.whiteBoldSubtitle1,
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, HomeScreen);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: Sizes.dimen_28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "forgot password?",
                  style: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
                Text(
                  "sign up >",
                  style: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    //   return Form(
    //     key: _formKey,
    //     child: Column(
    //       children: [
    //         buildPhoneNumberFormField(),
    //         SizedBox(height: Sizes.dimen_14.h),
    //         buildPasswordFormField(),
    //         SizedBox(height: Sizes.dimen_6.h),
    //         Align(
    //           alignment: Alignment.bottomRight,
    //           child: GestureDetector(
    //             // onTap: () => Navigator.pushNamed(
    //             //     context, ForgotPasswordScreen.routeName),
    //             onTap: () {},
    //             child: Text(
    //               TranslationConstants.forgotPass.t(context),
    //               style: Theme.of(context).textTheme.subtitle1,
    //             ),
    //           ),
    //         ),
    //         FormError(errors: errors),
    //         SizedBox(height: Sizes.dimen_20.h),
    //         DefaultButtonWidget(
    //           color: Colors.lightBlue,
    //           textColor: Colors.white,
    //           title: TranslationConstants.login.t(context),
    //           onPressed: () {
    //             // if (_formKey.currentState.validate()) {
    //             //   _formKey.currentState.save();
    //             // if all are valid then go to success screen
    //             Navigator.of(context).pushAndRemoveUntil(
    //                 MaterialPageRoute(builder: (context) => HomeScreen()),
    //                 (Route<dynamic> route) => false);
    //             // }
    //           },
    //         ),
    //       ],
    //     ),
    //   );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      // keyboardType: TextInputType.number,
      // onSaved: (newValue) => fullName = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: TranslationConstants.namelNullError);
      //     // } else if (CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   removeError(error: TranslationConstants.invalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: TranslationConstants.namelNullError);
      //     return "";
      //     // } else if (!CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   addError(error: TranslationConstants.invalidEmailError);
      //     //   return "";
      //   }
      //   return null;
      // },
      style: TextStyle(color: Colors.white.withOpacity(0.8)),
      decoration: InputDecoration(
        hintText: "Enter email",
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        fillColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_32.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_32.w),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      // onSaved: (newValue) => password = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: TranslationConstants.passNullError);
      //   } else if (value.length >= 8) {
      //     removeError(error: TranslationConstants.shortPassError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: TranslationConstants.passNullError);
      //     return "";
      //   } else if (value.length < 8) {
      //     addError(error: TranslationConstants.shortPassError);
      //     return "";
      //   }
      //   return null;
      // },
      style: TextStyle(color: Colors.white.withOpacity(0.8)),
      decoration: InputDecoration(
        hintText: "Enter password",
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        fillColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_32.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_32.w),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
    );
  }
}
