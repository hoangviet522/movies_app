import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mygarment/common/constants/common_constants.dart';
import 'package:mygarment/common/constants/size_constants.dart';
import 'package:mygarment/common/constants/translation_constant.dart';
import 'package:mygarment/common/screenutil/screenutil.dart';
import 'package:mygarment/controllers/firebase_controller.dart';
import 'package:mygarment/presentation/journeys/authentication/sign_in/google_sign_in.dart';
import 'package:mygarment/presentation/journeys/home/home_screen.dart';
import 'package:mygarment/presentation/themes/theme_color.dart';
import 'package:mygarment/presentation/widgets/common_button.dart';
import 'package:mygarment/presentation/widgets/custom_surffix_icon.dart';
import 'package:mygarment/presentation/widgets/default_button.dart';
import 'package:mygarment/presentation/widgets/form_errors.dart';
import 'package:provider/provider.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';
import '../../../themes/theme_text.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final FirebaseController firebaseController = Get.put(FirebaseController());

  final userData = GetStorage();
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _user;

  GoogleSignIn _googleSignIn = new GoogleSignIn();
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

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_20.w,
          vertical: Sizes.dimen_10.h,
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
              CommonButton(
                height: Sizes.dimen_20.h,
                text: "Sign In",
                colorStart: Colors.blueGrey,
                colorEnd: Colors.grey,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: Sizes.dimen_10.h,
              ),
              SignInButtonBuilder(
                text: 'Sign In With Google',
                icon: Icons.email,
                onPressed: () {
                  firebaseController.google_signIn();
                  userData.write(
                      "logged", firebaseController.userEmail.toString());
                },
                backgroundColor: Colors.blueGrey[700],
                width: double.infinity,
                height: Sizes.dimen_18.h,
              ),
              // SignInButton(
              //   Buttons.GoogleDark,
              //   onPressed: () {
              //     _showButtonPressDialog(context, 'Google (dark)');
              //   },
              // ),
              SizedBox(
                height: Sizes.dimen_20.h,
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
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  bool isSignIn = false;

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential userCredential =
        (await _auth.signInWithCredential(credential));

    _user = userCredential.user;

    setState(() {
      isSignIn = true;
    });

    // print(_user);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(
          user: _user,
        ),
      ),
    );
  }

  Future<void> googleSignOut() async {
    await _auth.signOut().then((value) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = false;
      });
    });
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
