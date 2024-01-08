import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maskkn/Shared/DialogHelper.dart';
import 'package:maskkn/screens/authorization_screens/sign_up.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';
import '../../appConfig.dart';
import '../../network-services/authentication.dart';
import '../../services/authentication/validation.dart';
import '../main-page/main-page.dart';
import 'components/customized_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'components/forgot_password.dart';
import 'components/otp_full_registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  bool obscureText = true;
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  AuthAPI _authAPI = AuthAPI();

  Future signInWithGoogle() async {
    try {
      final user = await GoogleSignInApi.login();
      final googleSignIn = GoogleSignIn();
      final account = await googleSignIn.signIn();
      final authentication = await account!.authentication;

      log('Access Token: ${authentication.accessToken}');
      log('Provider ID: ${account.id}');
      log('Email :: ${user!.email}');
      log('Display Name :: ${user.displayName}');
      log('Display Name :: ${user.displayName}');
      log('User :: $user');

      // ignore: unnecessary_null_comparison
      if (user != null) {
        var req = await _authAPI.loginWithGoogle(
            authentication.accessToken!, context);
        if (req.statusCode == 200) {
          var jsonData = json.decode(req.body);
          String token = jsonData['content']['data']['token'];
          SecureStorage.setStorage(token);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => HomePage())));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sign in Failed ${req.statusCode}')));
        }
      }

      /*    if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sign in Failed')));
        print("Sign in Failed");
      } else {*/
    } catch (exception) {
      print("what is wrong=> $exception");
    }
  }

  //  signInWithGoogle() async {
  //   log('message dddd');

  //   try {
  //     final GoogleSignInAccount? googlUser =
  //         await GoogleSignIn(scopes: <String>[
  //       'email']).signIn();

  //     if (googlUser != null) {
  //       log('googlUser All :: ${googlUser}');
  //       final GoogleSignInAuthentication googleAuth =
  //           await googlUser.authentication;
  //       log('user id : ${googlUser.id}');

  //       log('تم في حساب');
  //       log('googlUser :: ${googlUser}');

  //       log('googleAuth:: ${googleAuth.accessToken}');
  //       log('name :: ${googlUser.displayName}');
  //       log('googlUserId:: ${googlUser.id}');
  //       log('email :: ${googlUser.email}');

  //       final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );

  //       return await FirebaseAuth.instance.signInWithCredential(credential);
  //     } else {}
  //   } catch (e) {
  //     log('Google Catch :: $e');
  //   } finally {}
  // }

  @override
  Widget build(BuildContext context) {
    Widget googleIcon = FaIcon(
      FontAwesomeIcons.google,
      color: Res.sPrimaryColor,
    );

    Widget progressIndicator = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Res.sPrimaryColor : Res.kPrimaryColor,
          ),
        );
      },
    );

    bool isProcessing = false;
    bool isProcessingGoogle = false;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    var width = MediaQuery.of(context).size.width;
    final navigator = Navigator.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Form(
                  key: _key,
                  child: ListView(
                    children: <Widget>[
                      //title
                      //assets/img/photography.svg
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                        child: Text(
                          AppLocalizations.of(context)!.signIn,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Res.kPrimaryColor,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(
                        Res.logo,
                        width: 111,
                        height: 108,
                      ),
                      //username field
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, right: 8.0, left: 8.0),
                          child: CustomizedTextField(
                            controller: _emailTextController,
                            name: localizations.emailField,
                            validatorCallBack: Validator.validateEmail,
                            hint: const [AutofillHints.email],
                          )
                          ),

                      //password field
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 8.0, left: 8.0),
                          child: CustomizedTextField(
                            icon: IconButton(
                              icon: Icon(() {
                                if (obscureText) {
                                  return Icons.visibility_outlined;
                                } else {
                                  return Icons.visibility_off_outlined;
                                }
                              }(), color: Res.dGrayColor),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
                            obscureText: obscureText,
                            controller: _passwordTextController,
                            name: localizations.password,
                            hint: const [AutofillHints.password],
                          )),

                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text(
                            localizations.forgetPass,
                            style: TextStyle(
                                color: Res.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          onPressed: () {
                            navigator.push(MaterialPageRoute(
                              builder: (context) => ResetPassword(),
                            ));
                          },
                        ),
                      ),

                      // sign in TextButton
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10.0, top: 10, bottom: 15),
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Res.kPrimaryColor,
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                isProcessing
                                    ? localizations.signingInPro
                                    : localizations.signIn,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Res.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isProcessing = true;
                                });
                                _emailTextController.text =
                                    _emailTextController.text.trim();
                                if (_key.currentState!.validate()) {
                                  try {
                                    //login via api and wait for the response

                                    var req = await _authAPI.login(
                                        _emailTextController.text,
                                        _passwordTextController.text,
                                        context);
                                    var jsonData = json.decode(req.body);
                                    if (req.statusCode == 200) {
                                      String token =
                                          jsonData['content']['token'];
                                      SecureStorage.setStorage(token);
                                      // AuthAPI.currentUser = user.User.fromJson(
                                      //     jsonData['content']['data']);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content:
                                                Text(jsonData['description'])),
                                      );
                                      DialogHelper.hideLoading(context);
                                    }
                                  } on Exception catch (e) {
                                    print(
                                        "there is an issue>>> ${e.toString()}");
                                  }
                                }
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                setState(() {
                                  isProcessing = false;
                                });
                              }
                              // },
                              );
                        }),
                      ),

                      //DEVIDER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("_________"),
                          Text(
                            localizations.continueWith,
                            style: const TextStyle(fontSize: Res.TextFontSize),
                          ),
                          const Text("_________"),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // sign in with other options

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton.icon(
                              style: ButtonStyle(
                                  shadowColor:
                                      MaterialStateProperty.all(Res.lGrayColor),
                                  fixedSize: MaterialStateProperty.all(
                                      Size(width * 0.45, 40))),
                              label: Text(
                                localizations.email,
                                style: TextStyle(
                                    color: Res.blackColor,
                                    fontSize: Res.TextFontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                              // ignore: dead_code
                              icon: isProcessingGoogle
                                  // ignore: dead_code
                                  ? progressIndicator
                                  : googleIcon,
                              onPressed: signInWithGoogle
                              // {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => LoginWithGoogle()));
                              // },
                              ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: OutlinedButton.icon(
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(BorderSide(
                                      width: 0,
                                      color:
                                          Res.kPrimaryColor.withOpacity(0.3))),
                                  backgroundColor: MaterialStateProperty.all(
                                      Res.kPrimaryColor.withOpacity(0.3)),
                                  shadowColor:
                                      MaterialStateProperty.all(Res.lGrayColor),
                                  fixedSize: MaterialStateProperty.all(
                                      Size(width * 0.45, 40))),
                              icon: Icon(
                                Icons.phone,
                                size: 20,
                                color: Res.kPrimaryColor,
                              ),
                              label: Text(
                                localizations.phone,
                                style: TextStyle(
                                    color: Res.kPrimaryColor,
                                    fontSize: Res.TextFontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OTPRegistration()));
                              },
                            ),
                          ),
                        ],
                      ),
                      // option of add new user TextButton
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            localizations.newUserMessage,
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
                                      builder: (context) =>
                                          SignUpScreen(skip: true)));
                            },
                            child: Text(
                              localizations.signUp,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
