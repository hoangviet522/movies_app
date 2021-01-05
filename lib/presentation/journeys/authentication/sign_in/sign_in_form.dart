import 'package:flutter/material.dart';
import 'package:mygarment/common/constants/common_constants.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';
import 'package:mygarment/presentation/widgets/custom_surffix_icon.dart';
import 'package:mygarment/presentation/widgets/default_button.dart';
import 'package:mygarment/presentation/widgets/form_errors.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber;
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneNumberFormField(),
          SizedBox(height: Sizes.dimen_14.h),
          buildPasswordFormField(),
          SizedBox(height: Sizes.dimen_6.h),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              // onTap: () => Navigator.pushNamed(
              //     context, ForgotPasswordScreen.routeName),
              onTap: () {},
              child: Text(
                TranslationConstants.forgotPass.t(context),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          FormError(errors: errors),
          SizedBox(height: Sizes.dimen_20.h),
          DefaultButtonWidget(
            color: Colors.lightBlue,
            textColor: Colors.white,
            title: TranslationConstants.login.t(context),
            onPressed: () {
              // if (_formKey.currentState.validate()) {
              //   _formKey.currentState.save();
              // if all are valid then go to success screen
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false);
              // }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: TranslationConstants.passNullError);
        } else if (value.length >= 8) {
          removeError(error: TranslationConstants.shortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: TranslationConstants.passNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: TranslationConstants.shortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: TranslationConstants.password.t(context),
        hintText: TranslationConstants.passwordPlaceHolder.t(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/svgs/Lock.svg"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: TranslationConstants.phoneNumberNullError);
          // } else if (CommonConstant.emailValidatorRegExp.hasMatch(value)) {
          //   removeError(error: TranslationConstants.invalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: TranslationConstants.phoneNumberNullError);
          return "";
          // } else if (!CommonConstant.emailValidatorRegExp.hasMatch(value)) {
          //   addError(error: TranslationConstants.invalidEmailError);
          //   return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: TranslationConstants.phoneNumber.t(context),
        hintText: TranslationConstants.phoneNumberPlaceHolder.t(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/svgs/Phone.svg"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
        ),
      ),
    );
  }
}
