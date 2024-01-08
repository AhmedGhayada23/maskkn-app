import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maskkn/models/user.dart' as usr;
import '../../appConfig.dart';

import 'auth_error_message_mapper.dart';

//this a function to add a new user in the

class AuthenticationService {
  static String? email;
  static String? id;
  static FirebaseAuth instance = FirebaseAuth.instance;
  static String? name;
  static SignInStatus signInStatus = SignInStatus.signedOut;
  static usr.UserChant? currentUser;
  //intit function
  static Future<void> init() async {
    if (instance.currentUser == null) {
      signInStatus = SignInStatus.signedOut;
    } else {
      signInStatus = SignInStatus.signedIn;
      id = instance.currentUser?.uid;
    }

    //  instance.setLanguageCode('ar');
  }

  static Stream<User?> authStateChanges() {
    return instance.authStateChanges();
  }

  static Future verifyEmail(email, resetEmail, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Res.lGrayColor,
          textColor: Res.kPrimaryColor,
          fontSize: Res.TextFontSize,
          toastLength: Toast.LENGTH_LONG,
          msg: resetEmail);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Res.lGrayColor,
          textColor: Res.kPrimaryColor,
          fontSize: Res.TextFontSize,
          toastLength: Toast.LENGTH_LONG,
          msg: getUserErrorMessage(e));
    }
  }

  static Future<bool> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      UserCredential userCredential =
          await instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      user = FirebaseAuth.instance.currentUser;

      await user!.updateDisplayName(name);
      await user.reload();

      AuthenticationService.email = user.email;
      AuthenticationService.id = user.uid;

      await user.updateDisplayName(name);

      //newly created model to hold users
      return true;
    } on Exception catch (e) {
      Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Res.lGrayColor,
          textColor: Res.kPrimaryColor,
          fontSize: Res.TextFontSize,
          toastLength: Toast.LENGTH_LONG,
          msg: getUserErrorMessage(e));
      return false;
    }
  }

  static Future<bool> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user!;

      AuthenticationService.email = user.email;
      AuthenticationService.id = user.uid;
      // AuthenticationService.name=user.displayName;
      return true;
    } on Exception catch (e) {
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          backgroundColor: Res.kPrimaryColor,
          textColor: Res.kPrimaryColor,
          fontSize: 20,
          toastLength: Toast.LENGTH_LONG,
          msg: getUserErrorMessage(e));

      return false;
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /*static Future<DocumentSnapshot<Object?>> storeUserData(
      String name, String email, String password) async {
    String userId = instance.currentUser!.uid;
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('Users').doc(userId);
    await userDoc.set({
      'name': name,
      'email': instance.currentUser?.email,
      'password': password, //TODO:This should generally not exist
    });
    return await userDoc.get();
  }*/

  /*static Future<DocumentSnapshot<Object?>> retrieveUserData() async {
    String userId = instance.currentUser!.uid;
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('Users').doc(userId);
    return await userDoc.get();
  }*/

  static Future<bool> signInUsingGoogleAcount() async {
    final GoogleSignInAccount? user =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth = await user!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    return true;
  }
}

enum SignInStatus { signedIn, signedOut }
