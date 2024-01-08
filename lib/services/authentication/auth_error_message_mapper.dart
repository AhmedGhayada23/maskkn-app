//Returns appropriate message for a given exception or error during any part authentication.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/services/authentication/validation.dart';


String getUserErrorMessage(Exception e){
  AppLocalizations localizations = Validator.localizations!;

  print(e.runtimeType);
  String firebaseAuthExceptions(FirebaseAuthException e){
    switch (e.code){
      case 'user-not-found':
        return localizations.incorrectEmail;
      case 'wrong-password' :
        return localizations.incorrectPassword ;
      case 'network-request-failed':
        return localizations.checkYourConnection;
      case 'email-already-in-use':
        return localizations.existedEmail;
      case 'unknown':
        return localizations.somethingWentWrong;

    }
    // print(e.code);
    return e.code;
  }
  String platformExceptions(PlatformException e){
    switch (e.code){
      case 'network_error':
        return localizations.checkYourConnection;
    }
    //Log e.message and return and vague message;
    return localizations.somethingWentWrong;
  }

  if(e is PlatformException){
     return platformExceptions(e);
  }
  if(e is FirebaseAuthException){
    return firebaseAuthExceptions(e);
  }

  return localizations.somethingWentWrong;
}