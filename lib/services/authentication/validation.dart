
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validator{
  static AppLocalizations? localizations;

  static String? validatePassword(String? value) {

    if ((value?.length ?? 0) < 6){
      return
        localizations?.passwordDigitCountError; //This should be 5 characters not digits;
    }
    else{
      return null;
    }
  }

//validateEmail method is to check that the email is correct
//@parm value
  static String? validateEmail(String? value) {

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex =  RegExp(pattern);
    if (!regex.hasMatch(value ?? ''))
    { return localizations?.validEmailError;}
    else {
      return null;
    }}

// validateName method is to check that the name field is not empty
//@parm value
  static String? validateName(String? value) {

    if (value?.length == '' || (value?.length ?? 0) < 3) {
      return
        localizations?.validNameError;
    }
    else{
      return null;
    }

  }
}

