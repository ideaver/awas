import 'package:flutter/material.dart';

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final RegExp passwordValidatorRegExp = RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])');
final RegExp phoneNumValidatorRegExp = RegExp(r'^[0-9]{11}$');
final RegExp nameValidatorRegExp = RegExp(r'^[a-zA-Z\s]*$');

const String emailNullError = 'Please Enter your email';
const String invalidEmailError = 'Please Enter a valid email';
const String invalidPassError =
    'Password must contain both letters and numbers';
const String invalidPhoneNumError = 'Phone number must contain 11 numbers';
const String invalidNameError = 'Name must contain letters only';
const String passNullError = 'Please Enter your password';
const String shortPassError = 'Password must contain at least 8 characters';
const String matchPassError = "Passwords don't match";
const String nameNullError = 'Please Enter your name';
const String phoneNumberNullError = 'Please Enter your phone number';
const String addressNullError = 'Please Enter your address';
const String wrongEorP = 'Wrong email or password';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

// final otpInputDecoration = InputDecoration(
//   contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
// );

// OutlineInputBorder outlineInputBorder() {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(getProportionateScreenWidth(2)),
//     borderSide: const BorderSide(color: SecondaryColorDark),
//   );
// }
