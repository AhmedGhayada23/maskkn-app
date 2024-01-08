import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../services/authentication/authenticate.dart';
import '../../../services/authentication/validation.dart';
import 'customized_text_field.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(icon: Icon(Icons.arrow_back,),color: Res.blackColor, onPressed: () {
          Navigator.pop(context);

        }, ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Res.logo,width: 80,height: 80,),
            //assets/img/photography.svg
            Padding(
              padding:
              const EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
              child: Text(
                localizations.resetpassTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:  Res.kPrimaryColor,
                  fontSize: Res.TitleFontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/6,
            ),
            Text(localizations.reciveEmailReset),
            Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, right: 35.0, left: 35.0),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomizedTextField(
                    controller: _emailTextController,
                    name: localizations.email,
                    validatorCallBack: Validator.validateEmail,
                    hint: const [
                      AutofillHints.email
                    ],
                  ),
                )),
            Padding(
              padding:
              const EdgeInsets.only(right:  35.0, left:  35.0, top: 30,bottom: 25),
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
                     localizations.resetpassTitle,
                      style: const TextStyle(
                        fontSize:   Res.SubTitleFontSize,

                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      AuthenticationService.verifyEmail(_emailTextController.text.trim(), localizations.resetEmailMsg,context);
                    },

                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
