import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:maskkn/Shared/DialogHelper.dart';
import 'package:maskkn/network-services/authentication.dart';
import 'package:maskkn/screens/authorization_screens/validate_otp.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';
import '../../main-page/main-page.dart';

TextStyle TitleStyle = TextStyle(
    color: Res.kPrimaryColor,
    fontSize: Res.TitleFontSize,
    fontWeight: FontWeight.bold);

class OTPRegistration extends StatefulWidget {
  const OTPRegistration({Key? key}) : super(key: key);

  @override
  State<OTPRegistration> createState() => _OTPRegistrationState();
}

class _OTPRegistrationState extends State<OTPRegistration> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  AuthAPI _authAPI = AuthAPI();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;

  String otpPin = " ";
  String countryDial = "+968";
  String verID = " ";

  int screenState = 0;

  Future<void> verifyPhone(String number) async {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText(localizations.authCompleted);
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText(localizations.authFailed);
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText(localizations.oTPSent);
        verID = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText(localizations.timeout);
      },
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      ),
    )
        .whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          //add a message for the new accepted authentication
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () {
        setState(() {
          screenState = 0;
        });
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              color: Res.blackColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                screenState == 0 ? stateRegister() : stateOTP(),
              ],
            ),
          )),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(width: 0, color: Res.dGrayColor.withOpacity(0.4)),
  );

  Widget stateRegister() {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
          child: Text(
            localizations.enterPhone,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Res.kPrimaryColor,
              fontSize: Res.TitleFontSize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Image.asset(
            Res.logo,
            width: 80,
            height: 80,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: IntlPhoneField(
              controller: phoneController,
              dropdownTextStyle: TextStyle(
                fontSize: Res.TextFontSize,
                color: Res.dGrayColor,
              ),
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Res.dGrayColor,
              cursorHeight: 25,
              textAlign: TextAlign.start,
              style: TextStyle(color: Res.dGrayColor, letterSpacing: 2),
              dropdownIcon: Icon(
                Icons.keyboard_arrow_down,
                color: Res.dGrayColor,
              ),
              showCountryFlag: false,
              showDropdownIcon: false,
              dropdownIconPosition: IconPosition.trailing,
              dropdownDecoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      width: .5, color: Res.dGrayColor.withOpacity(0.4)),
                ),
              ),
              initialValue: countryDial,
              onCountryChanged: (country) {
                setState(() {
                  countryDial = "+" + country.dialCode;
                });
              },
              decoration: InputDecoration(
                prefixText: "  ",
                hintText: localizations.yourPhoneNum,
                // errorText: localizations.errorPhone,
                iconColor: Res.dGrayColor,
                contentPadding: const EdgeInsets.only(left: 50, right: 50),
                focusColor: Res.lGrayColor,
                hintStyle: TextStyle(
                  color: Res.dGrayColor.withOpacity(0.5),
                ),
                focusedBorder: border,
                focusedErrorBorder: border,
                enabledBorder: border,
                errorBorder: border,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 30.0, left: 30.0, top: 40, bottom: 25),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Builder(builder: (context) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Res.kPrimaryColor,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  localizations.submit,
                  style: const TextStyle(
                    fontSize: Res.SubTitleFontSize,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (phoneController.text.isEmpty) {
                    showSnackBarText(localizations.enterPhone);
                  } else {
                    var req = await _authAPI.getOTP(
                        phoneController.text, context, true);
                    if (req.statusCode == 200) {
                      var jsonData = json.decode(req.body);
                      print('otp code :: ${jsonData['content']['otp']}');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ValidateOtp(
                                    phone: phoneController.text,
                                  )
                                  ));
                    } else {
                      DialogHelper.hideLoading(context);
                    }
                    print('phoneController :: ${phoneController.text}');
                    //verifyPhone(countryDial + phoneController.text);
                  }
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget stateOTP() {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 40),
          child: Text(
            localizations.enterOTP,
            style: TitleStyle,
          ),
        ),
        Text(localizations.enter6digit),
        Directionality(
            textDirection: TextDirection.ltr,
            child: Text(countryDial + " " + phoneController.text)),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10.0, 25, 10),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                setState(() {
                  otpPin = value;
                });
              },
              pinTheme: PinTheme(
                //   activeColor: blue,
                // selectedColor: blue,
                inactiveColor: Colors.black26,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 30.0, left: 30.0, top: 40, bottom: 25),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Builder(builder: (context) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Res.kPrimaryColor,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  localizations.confirm,
                  style: const TextStyle(
                    fontSize: Res.SubTitleFontSize,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (otpPin.length >= 6) {
                    verifyOTP();
                  } else {
                    showSnackBarText(localizations.enterOTPcorrectly);
                  }
                },
              );
            }),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: localizations.notRecivedCode,
                  style: TextStyle(
                      color: Res.blackColor, fontSize: Res.SubTitleFontSize)),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      screenState = 0;
                    });
                  },
                  child: Text(
                    localizations.resend,
                    style: TextStyle(
                      color: Res.kPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
