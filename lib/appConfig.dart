import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class Res {
  ///Image Assets
  ///Image Assets svg
  static const String propertyRequest_img =
      "assets/main-icons/propertyRequest.png";

  static const String houses_img = "assets/main-icons/homes.png";
  static const String camera_img = "assets/main-icons/Photo-amico.png";
  static const String property_manag_img =
      "assets/main-icons/propertymanage.png";
  static const String appriasal_img = "assets/main-icons/appraisal.png";
  static const String interior_1 = 'assets/img/interior_2.jpg';
  static const String man = 'assets/img/man.jpg';
  static const String area = "assets/icon/area.png";
  static const String mastercard = 'assets/img/mastercard.png';
  static const String visa = 'assets/img/visa.png';
  static const String background = "assets/img/background.webp";
  static const String google_icon = "assets/icon/google.svg";
  static const String logo = "assets/img/logo.png";
  static const String upload_img = "assets/icon/upload.svg";
  static const String adawr = "assets/img/dawerly_img/Adawr.png";
  static const String adawrPlis = "assets/img/dawerly_img/AdawrPlus.png";
  static const String dawarly = "assets/img/dawerly_img/Dawarly.png";

  ///Font sizes
  static const double TitleFontSize = 20;
  static const double SubTitleFontSize = 18;
  static const double TextFontSize = 14;
  static const double SubTextFontSize = 12;

  ///Icons
  static const String seen_icon_3d = "assets/icon/Mskn App Icon_3D-01.svg";
  static const String threeDimIcPng = "assets/icon/3d-model.png";

  ///Colors
  static final HexColor kPrimaryColor = HexColor("#0B6F70");
  static final HexColor lkPrimaryColor = HexColor("#0DA8AA");
  static final HexColor sPrimaryColor = HexColor("#9F271B");
  static final HexColor dGrayColor = HexColor("#707070");
  static final HexColor lGrayColor = HexColor("#F5F5F5");
  static final HexColor dGrayColor2 = HexColor("#555555");
  static final HexColor lGrayColor2 = HexColor("#F1F1F1");
  static final HexColor whiteColor = HexColor("#ffffff");
  static final HexColor blackColor = HexColor("#000000");
  static final Color? grey200 = Colors.grey[200];

  static final HexColor chatColor = HexColor("#DFDFE0");
  static final HexColor chatGray = HexColor("#B1B1C2");
  static final HexColor chatGray2 = HexColor("#F3F4F8");
  static final HexColor lightGreen = HexColor("#D9F3F2");
  static final HexColor dGreen = HexColor("#0DA8AA");

  ///Fonts
  static String fontFamily0 = "Tajwal";
  static TextStyle TitleStyle = TextStyle(
      color: Res.blackColor,
      fontSize: Res.SubTitleFontSize,
      fontWeight: FontWeight.bold);
  static TextStyle SubTitleStyle =
      TextStyle(color: Res.kPrimaryColor, fontSize: Res.SubTitleFontSize);
  static TextStyle textStyle =
      TextStyle(color: Res.dGrayColor, fontSize: Res.TextFontSize);

  ///App Paths

  /// GOOGLE MAP API
  static const googleMapsApiKey = 'AIzaSyBEhPNgxezFViqJumUn-CckXZb1rAnIQaY';

  static showToast(text) {
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0);
  }
}
