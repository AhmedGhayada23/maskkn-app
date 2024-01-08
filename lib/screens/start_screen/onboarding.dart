import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/OnbordingData.dart';
import 'package:flutter_onboarding_screen/flutteronboardingscreens.dart';
import 'package:maskkn/screens/main-page/main-page.dart';

class OnboardingScreens extends StatelessWidget {
  /*here we have a list of OnbordingScreen which we want to have, each OnbordingScreen have a imagePath,title and an desc.
      */

  // var LocaleCode = locale.languageCode;// or html.window.locale

  final List<OnbordingData> list_ar = [
    OnbordingData(
      imagePath: "assets/onboarding_img/board-1.png", //Res.logo,
      title: "السلام عليكم",
      desc: "مرحبا بك في تطبيق مسكن للعقارات",
    ),
    OnbordingData(
      imagePath: "assets/onboarding_img/board-2.png",
      title: "تسجيل المستخدم",
      desc: "قم بإنشاء مستخدم جديد بحساب الإيميل أو رقم الهاتف",
    ),
    OnbordingData(
      imagePath: "assets/onboarding_img/board-3.png",
      title: "ابحث باستخدام الفلتر",
      desc: "اختر نوع العقار في المنطقة المرغوب بها",
    ),
    OnbordingData(
      imagePath: "assets/onboarding_img/board-4.png",
      title: "الجولة الإفتراضية",
      desc: "استكشف عقارك بسهولة مع الجولة الإفتراضية",
    ),
  ];
  final List<OnbordingData> list_en = [
    OnbordingData(
      imagePath: "assets/onboarding_img/board-1.png", //Res.logo,
      title: "Salam Alikum",
      desc: "Welcome to Mskn App",
    ),
    OnbordingData(
      imagePath: "assets/onboarding_img/board-2.png",
      title: "Register",
      desc: "Create new account by email or phone",
    ),
    OnbordingData(
      imagePath: "assets/onboarding_img/board-3.png",
      title: "Search By Filter",
      desc: "Select Property sector and property kind State City.",
    ),
    OnbordingData(
      imagePath: "assets/onboarding_img/board-4.png",
      title: "See Virtual tour",
      desc: "See Explore property by VT.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String localeCode = Localizations.localeOf(context).languageCode;
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */

    return Scaffold(
      body: IntroScreen(
        localeCode == 'en' ? list_en : list_ar,
        MaterialPageRoute(builder: (context) => HomePage() //LoginScreen()
            ),
      ),
    );
  }
}
