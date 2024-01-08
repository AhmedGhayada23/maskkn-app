import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/Shared/DialogHelper.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/network-services/authentication.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';
import 'package:maskkn/screens/main-page/main-page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

TextStyle TitleStyle = TextStyle(
    color: Res.kPrimaryColor,
    fontSize: Res.TitleFontSize,
    fontWeight: FontWeight.bold);

class ValidateOtp extends StatefulWidget {
  final String? phone;
  const ValidateOtp({this.phone, super.key});

  @override
  State<ValidateOtp> createState() => _ValidateOtpState();
}

class _ValidateOtpState extends State<ValidateOtp> {
  String otpPin = '';
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    AuthAPI _authAPI = AuthAPI();

    void showSnackBarText(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)),
      );
    }

    
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            SizedBox(
              height: 8,
            ),
            Directionality(
                textDirection: TextDirection.ltr,
                child: Text('+968${widget.phone}')),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10.0, 25, 10),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    setState(() {
                      otpPin = value;
                      log('otpPin :: ${otpPin}');
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
                      log('message leng :: ${otpPin.length},,$otpPin');
                      if (otpPin.length >= 4) {
                        var req = await _authAPI.validateOtp(
                            widget.phone!, otpPin, context);
                            var jsonData = json.decode(req.body);
                        if (req.statusCode == 200) {
                          
                          String token = jsonData['content']['token'];
                          SecureStorage.setStorage(token);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else {
                          ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text( jsonData['description'])),
                                      );
                          log(req.statusCode.toString());
                          log('phone :: ${widget.phone} : : : otp :: $otpPin');
                          DialogHelper.hideLoading(context);
                        }
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
                          color: Res.blackColor,
                          fontSize: Res.SubTitleFontSize)),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          //  screenState = 0;
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
        ),
      ),
    );
  }
}
