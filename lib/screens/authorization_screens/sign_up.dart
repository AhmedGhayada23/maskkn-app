import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:maskkn/screens/authorization_screens/terms&conditions.dart';
import 'package:maskkn/screens/authorization_screens/validate_otp.dart';
import '../../appConfig.dart';
import '../../network-services/authentication.dart';
import '../../services/authentication/validation.dart';

import 'components/customized_text_field.dart';

import 'sign_in.dart';

class SignUpScreen extends StatefulWidget {
  final bool skip;
  // ignore: prefer_const_constructors_in_immutables
  SignUpScreen({this.skip = false, Key? key}) : super(key: key);

  @override
  State createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpScreen> {
  //firebase ==> call the instance getter on FirebaseAuth To create a new Firebase Auth instance.

  final GlobalKey<FormState> _key = GlobalKey();
  final AutovalidateMode _validate = AutovalidateMode.disabled;
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _isProcessing = false;
  AuthAPI _authAPI = AuthAPI();
  bool obscureText = true;
  bool isChecked = false;
  String countryDial = "+968";
  TextEditingController phoneController = TextEditingController();

  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(width: 0, color: Res.dGrayColor.withOpacity(0.5)),
  );

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    Validator.localizations == localizations;
    final navigator = Navigator.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: Text(
              localizations.resend,
              style: TextStyle(
                  color: Res.kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: _key,
          autovalidateMode: _validate,
          child: ListView(
            children: <Widget>[
              Image.asset(
                Res.logo,
                width: 80,
                height: 80,
              ),
              //assets/img/photography.svg
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
                child: Text(
                  localizations.createNewAccount,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Res.kPrimaryColor,
                    fontSize: Res.TitleFontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 35.0, left: 35.0),
                  child: CustomizedTextField(
                    controller: _nameTextController,
                    validatorCallBack: Validator.validateName,
                    name: localizations.name,
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 35.0, left: 35),
                  child: CustomizedTextField(
                    controller: _emailTextController,
                    validatorCallBack: Validator.validateEmail,
                    name: localizations.emailField,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, right: 35.0, left: 35, bottom: 0),
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
                      contentPadding:
                          const EdgeInsets.only(left: 50, right: 50),
                      focusColor: Res.lGrayColor,
                      hintStyle: TextStyle(
                          color: Res.dGrayColor, fontSize: Res.TextFontSize),
                      focusedBorder: border,
                      focusedErrorBorder: border,
                      enabledBorder: border,
                      errorBorder: border,
                    ),
                  ),
                ),
              ),

              Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, right: 35.0, left: 35),
                  child: CustomizedTextField(
                    controller: _passwordTextController,
                    validatorCallBack: Validator.validatePassword,
                    name: localizations.password,
                    icon: IconButton(
                      icon: obscureText
                          ? Icon(
                              Icons.visibility_outlined,
                              color: Res.dGrayColor,
                            )
                          : Icon(
                              Icons.visibility_off_outlined,
                              color: Res.dGrayColor,
                            ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    obscureText: obscureText,
                  )),

              CheckboxListTile(
                title: TextButton(
                    onPressed: () {
                      navigator.push(MaterialPageRoute(
                        builder: (context) => AppTerms(),
                      ));
                    },
                    child: Text(
                      localizations.byCreatingAcountAgree,
                      style: TextStyle(
                          color: Res.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                checkColor: Colors.white,
                value: isChecked,
                activeColor: Res.kPrimaryColor,
                onChanged: (value) {
                  setState(() => isChecked = value!);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (!isChecked)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    localizations.conditionsAgreament,
                    style: TextStyle(
                        color: Res.sPrimaryColor,
                        fontSize: Res.SubTextFontSize),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 20, bottom: 25),
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
                        _isProcessing
                            ? localizations.signingUpPro
                            : localizations.signUp,
                        style: TextStyle(
                          fontSize: 18,
                          color: Res.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isProcessing = true;
                        });
                        if (isChecked) {
                          if (_key.currentState!.validate()) {
                            try {
                              var req = await _authAPI.register(
                                  _nameTextController.text,
                                  _emailTextController.text.trim(),
                                  countryDial + phoneController.text.trim(),
                                  _passwordTextController.text.trim());
                              var jsonData = json.decode(req.body);
                              if (req.statusCode == 200) {
                                //  _authAPI.getOTP(countryDial + "79049223"/*phoneController.text.trim()*/,context);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ValidateOtp(
                                              phone: phoneController.text,
                                            )));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(jsonData['description'])),
                                );
                                print(">>>Opps${req.statusCode}");
                              }
                            } on Exception catch (e) {
                              print("there is an issue>>> ${e.toString()}");
                            }

                            /*   if(status){
                      */
                            /*        Future.delayed(Duration.zero, () =>   showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return  AlertDialog(
                                    elevation: 40,
                                    backgroundColor: Res.lGrayColor,
                                    title:  Center(
                                      child: Text(localizations.welcomingNewUser, style: TextStyle(
                                          color: Res.sPrimaryColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Res.TextFontSize
                                      ),),
                                    ),
                                  );
                                },
                              ));*/
                            /*
                              Fluttertoast.showToast(
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Res.lGrayColor,
                                  textColor: Res.kPrimaryColor,
                                  fontSize: 20,
                                  toastLength: Toast.LENGTH_LONG,
                                  msg: localizations.welcomingNewUser
                              );

                              navigator.pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                  ));
                            }*/
                          }
                        }
                        setState(() {
                          _isProcessing = false;
                        });
                      },
                    );
                  }),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.existingUserMessage,
                    style: TextStyle(
                      fontSize: Res.TextFontSize,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      localizations.signIn,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
