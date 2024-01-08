
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../appConfig.dart';


class AboutUs extends StatelessWidget {
   AboutUs({Key? key}) : super(key: key);

  var colorStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    double height=  MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Res.kPrimaryColor,
          foregroundColor:Colors.white,),
        body:Container(
          height: height,
          color:Colors.white,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [

                        Text("about us page"),
                      ],
                    ),
                  )

              ),
            )
    );

}
}
