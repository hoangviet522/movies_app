import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/extensions/size_extensions.dart';
import 'package:mygarment/common/extensions/string_extensions.dart';
import 'package:mygarment/presentation/widgets/app_bar_widget.dart';
import 'package:mygarment/presentation/widgets/default_button.dart';
import 'package:mygarment/presentation/widgets/form_errors.dart';
import '../../themes/theme_text.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

enum Genders { male, female, anotherGender }

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final dateTimeController = TextEditingController();
  String fullName;
  String gender;
  String dob;
  String phNumber;
  String job;
  String address;
  DateTime dob2;
  DateTime _dateTime;

  Genders _gender = Genders.male;

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
    return Scaffold(
      appBar: AppBarWidget(
        title: TranslationConstants.updateProfile.t(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_14,
            vertical: Sizes.dimen_14,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: Genders.male,
                      groupValue: _gender,
                      onChanged: (Genders value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    Text(TranslationConstants.male.t(context)),
                    Radio(
                      value: Genders.female,
                      groupValue: _gender,
                      onChanged: (Genders value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    Text(TranslationConstants.feMale.t(context)),
                    Radio(
                      value: Genders.anotherGender,
                      groupValue: _gender,
                      onChanged: (Genders value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    Text(TranslationConstants.anotherGender.t(context)),
                  ],
                ),
                SizedBox(
                  height: Sizes.dimen_12,
                ),
                buildNameFormField(),
                SizedBox(
                  height: Sizes.dimen_12,
                ),
                buildDOBFormField(),
                SizedBox(
                  height: Sizes.dimen_12,
                ),
                buildPhoneNumberFormField(),
                SizedBox(
                  height: Sizes.dimen_12,
                ),
                buildJobFormField(),
                SizedBox(
                  height: Sizes.dimen_12,
                ),
                buildAddressFormField(),
                // SizedBox(height: Sizes.dimen_8.h),
                FormError(errors: errors),
                SizedBox(height: Sizes.dimen_10.h),
                DefaultButtonWidget(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  title: TranslationConstants.update.t(context),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      // if all are valid then go to success screen
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(builder: (context) => HomeScreen()),
                      //     (Route<dynamic> route) => false);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      // keyboardType: TextInputType.number,
      onSaved: (newValue) => fullName = newValue,
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
      decoration: InputDecoration(
        labelText: TranslationConstants.name.t(context),
        hintText: TranslationConstants.infoNotUpdated.t(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          FontAwesomeIcons.user,
          size: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
        ),
      ),
    );
  }

  TextFormField buildDOBFormField() {
    return TextFormField(
      onTap: () => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime(2040),
      ).then((date) {
        setState(() {
          _dateTime = date;
          dateTimeController.text = _dateTime.day.toString() +
              "/" +
              _dateTime.month.toString() +
              "/" +
              _dateTime.year.toString();
        });
      }),
      controller: dateTimeController,
      onSaved: (newValue) => dateTimeController.text = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: TranslationConstants.dobError);
      //     // } else if (CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   removeError(error: TranslationConstants.invalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: TranslationConstants.dobError);
      //     return "";
      //     // } else if (!CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   addError(error: TranslationConstants.invalidEmailError);
      //     //   return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: TranslationConstants.dob.t(context),
        hintText: TranslationConstants.dobPlaceHolder.t(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/svgs/birthday.svg"),
        prefixIcon: Icon(
          FontAwesomeIcons.birthdayCake,
          size: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phNumber = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: TranslationConstants.phoneNumberNullError);
      //     // } else if (CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   removeError(error: TranslationConstants.invalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: TranslationConstants.phoneNumberNullError);
      //     return "";
      //     // } else if (!CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   addError(error: TranslationConstants.invalidEmailError);
      //     //   return "";
      //   }
      //   return null;
      // },
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        labelText: TranslationConstants.phoneNumber.t(context),
        hintText: TranslationConstants.infoNotUpdated.t(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          FontAwesomeIcons.mobile,
          size: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
        ),
      ),
    );
  }

  TextFormField buildJobFormField() {
    return TextFormField(
      // keyboardType: TextInputType.number,
      onSaved: (newValue) => job = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: TranslationConstants.jobError);
      //     // } else if (CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   removeError(error: TranslationConstants.invalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: TranslationConstants.jobError);
      //     return "";
      //     // } else if (!CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   addError(error: TranslationConstants.invalidEmailError);
      //     //   return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: TranslationConstants.job.t(context),
        hintText: TranslationConstants.infoNotUpdated.t(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          FontAwesomeIcons.briefcase,
          size: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      // keyboardType: TextInputType.number,
      onSaved: (newValue) => address = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: TranslationConstants.addressError);
      //     // } else if (CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   removeError(error: TranslationConstants.invalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: TranslationConstants.addressError);
      //     return "";
      //     // } else if (!CommonConstant.emailValidatorRegExp.hasMatch(value)) {
      //     //   addError(error: TranslationConstants.invalidEmailError);
      //     //   return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: TranslationConstants.address.t(context),
        hintText: TranslationConstants.infoNotUpdated.t(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          FontAwesomeIcons.home,
          size: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
        ),
      ),
    );
  }
}
