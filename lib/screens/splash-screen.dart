import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maskkn/screens/authorization_screens/sign_in.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';
import 'package:maskkn/screens/main-page/main-page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    log('2222');
    Future.delayed(Duration(seconds: 5), () {
      log('1111');
      // ignore: unnecessary_null_comparison
      SecureStorage.getStorage() != null
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));

      log('token :: ${SecureStorage.getStorage().toString()}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/img/splash-logo.png',
          color: Colors.white,
        ),
      ),
    );
  }
}
