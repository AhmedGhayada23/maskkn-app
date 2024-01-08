

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../appConfig.dart';
import '../../service-screens/all_packges.dart';
import '../../service-screens/photography/photo-subscribtion.dart';
import '../../service-screens/request-property/request-property-main.dart';
import 'categories.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GrideView extends StatelessWidget {
  const GrideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return   GridView.count(
      //scrollDirection: Axis.vertical,
      childAspectRatio: 5.0/2.1,
      primary: false,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,

      children: [
        MainIcons(Res.propertyRequest_img,localizations.requestproperty,PropertyRequestMain()),
        //MainIcons(Res.appriasal_img,localizations.appraisal,Container()),
        MainIcons(Res.camera_img,localizations.photography ,PhotographySubscription()),
        MainIcons(Res.camera_img,localizations.propertyManagement ,PropertyRequestMain()),
        ElevatedButton.icon(

          style: ElevatedButton.styleFrom(
            foregroundColor: Res.lGrayColor,
            backgroundColor: Res.lGrayColor,
            elevation:1,
          ),
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localizations.notAvailable, style: TextStyle(
                    color: Res.whiteColor
                ),),
                backgroundColor: Res.kPrimaryColor,
                behavior: SnackBarBehavior.fixed,

              ),
            );
          },
          icon: Image.asset(
            Res.appriasal_img,
            height: 50,
          ),
          label: Center(
            child: Text(localizations.appraisal,
              style: TextStyle(
                fontSize: Res.TextFontSize,
                fontWeight: FontWeight.bold,
                color: Res.blackColor,
              ),),
          ),
        )
      ],);
  }
}
