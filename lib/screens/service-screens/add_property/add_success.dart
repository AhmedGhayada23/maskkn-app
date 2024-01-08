import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';
import '../../main-page/main-page.dart';
import '../../profile/my_adds.dart';

class AdSuccess extends StatelessWidget {
  const AdSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            //add a message for the new accepted authentication
            builder: (context) => MyAds(),
          ),
        );

        return false;
      },
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                //Res.addSuccess,
                "assets/icon/addSuccess.svg",
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                localizations.adAddedSuc,
                style: TextStyle(
                    fontSize: Res.TitleFontSize, color: Res.kPrimaryColor),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          //add a message for the new accepted authentication
                          builder: (context) => MyAds(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Res.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(localizations.myadds,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Res.TitleFontSize,
                          )),
                    ))),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          //add a message for the new accepted authentication
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Center(
                        child: Text(localizations.homepage,
                            style: TextStyle(
                              color: Res.kPrimaryColor,
                              fontSize: Res.TitleFontSize,
                            )))),
              )
            ],
          ),
        )),
      ),
    );
  }
}
