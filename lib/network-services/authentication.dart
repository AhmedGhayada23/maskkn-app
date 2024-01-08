import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maskkn/Shared/DialogHelper.dart';
import 'package:maskkn/models/user.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';
import 'base_api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthAPI extends BaseAPI {
  static UserChant? currentUser;
  Future<http.Response> register(
      String name, String email, String phone, String password) async {
    var body = jsonEncode({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'role': "customer"
    });
    http.Response response = await http.post(Uri.parse(super.registerPath),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: body);
    return response;
  }

//X-Mskkn-Mob
  Future<http.Response> login(
      String email, String password, BuildContext context) async {
    DialogHelper().showProgressDialog(context);
    var body = jsonEncode({'email': email, 'password': password});
    http.Response response = await http.post(Uri.parse(super.loignPath),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "X-Mskkn-Mob": "true"
        },
        body: body);
    return response;
  }

  Future<http.Response> loginWithGoogle(
      String accessToken, BuildContext context) async {
    DialogHelper().showProgressDialog(context);
    Uri uri = Uri.parse('${super.loginGoogle}$accessToken');
    http.Response response = await http.get(uri);

    return response;
  }

  Future<http.Response> getOTP(String phone, BuildContext? context,
      [bool show = false]) async {
    show == true ? DialogHelper().showProgressDialog(context!) : null;
    http.Response response = await http.get(Uri.parse('${super.get_otp}$phone'),
        headers: super.headers);
    return response;
  }

  Future<http.Response> validateOtp(
      String phone, String otp, BuildContext context) async {
    DialogHelper().showProgressDialog(context);
   // var body = jsonEncode({'phone': phone, 'otp': otp});
    http.Response response = await http.post(
        Uri.parse('${super.validateOTP}?phone=$phone&otp=$otp'),
        headers: super.headers);

    return response;
  }

  Future<http.Response> logout() async {
    var token = await SecureStorage.getStorage();
    var body = jsonEncode({'token': token});

    http.Response response = await http.post(Uri.parse(super.loignPath),
        headers: super.headers, body: body);

    return response;
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logoutWithGoogle() => _googleSignIn.disconnect();
}
