import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../appConfig.dart';


class ConnectWithUs extends StatefulWidget {
  const ConnectWithUs({Key? key}) : super(key: key);

  @override
  _ConnectWithUsState createState() => _ConnectWithUsState();
}

class _ConnectWithUsState extends State<ConnectWithUs> {

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    double height=  MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Res.kPrimaryColor,
          foregroundColor:Colors.white,),

        body: Container(
          alignment: AlignmentDirectional.center,
          height: height,
          child: SingleChildScrollView(
      child: Container(
        child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(Res.logo,
                  height: height / 3
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0) //
                    )),
                child: Column(
                  children: [

              /*      Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
                      child: Column(
                        children: [
                           Text(
                              localizations.contactUsDetails,
                             style: const TextStyle(color: Colors.grey, fontSize: 18),),
                          TextButton(
                              child: Text('hafsmushaf@gmail.com'),
                              onPressed: () => {launchEmailSubmission()})
                        ],
                      ),
                    )*/
                  ],
                ),
              ),
            ],
        ),
      ),
    ),
        ));
  }
}
