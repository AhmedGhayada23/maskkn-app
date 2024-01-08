import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/providers/request_property_provider.dart';
import 'package:maskkn/screens/authorization_screens/components/otp_full_registration.dart';
import 'package:maskkn/screens/service-screens/done_widget.dart';
import 'package:maskkn/screens/service-screens/request-property/confirm_order_request_pro.dart';
import 'package:provider/provider.dart';

class PropertyRequestFinal extends StatefulWidget {
  const PropertyRequestFinal({super.key});

  @override
  State<PropertyRequestFinal> createState() => _PropertyRequestFinalState();
}

class _PropertyRequestFinalState extends State<PropertyRequestFinal> {
  bool error = false;
  TextEditingController _moreDetailControllerAr = TextEditingController();
  TextEditingController _tittleControllerAr = TextEditingController();
  TextEditingController _moreDetailControllerEn = TextEditingController();
  TextEditingController _tittleControllerEn = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;
    final PRProvider = Provider.of<RequestPropertyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
          ),
          color: Res.blackColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // leading: Icon(Ico),
        title: Text(
          localizations.requestproperty,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "${localizations.stepNum} 3 / 3",
            style: TextStyle(
              color: Res.blackColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            value: 1,
            valueColor:
                AlwaysStoppedAnimation(Res.kPrimaryColor.withOpacity(0.3)),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'العنوان',
                style: TitleStyle,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '*',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            cursorColor: Res.dGrayColor,
            controller: _tittleControllerAr,
            style: TextStyle(color: Res.dGrayColor),
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Res.lGrayColor,
              focusedBorder: OutlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(
                    width: 0.5, color: Res.dGrayColor.withOpacity(0.6)),
              ),
              border: OutlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(
                    width: 0.5, color: Res.dGrayColor.withOpacity(0.6)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "الوصف",
                style: TitleStyle,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '*',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ],
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              height: 150,
              child: TextFormField(
                cursorColor: Res.dGrayColor,
                controller: _moreDetailControllerAr,
                style: TextStyle(color: Res.dGrayColor),
                maxLines: 50,
                decoration: InputDecoration(
                  fillColor: Res.lGrayColor,
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 0.5, color: Res.dGrayColor.withOpacity(0.6)),
                  ),
                  border: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 0.5, color: Res.dGrayColor.withOpacity(0.6)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Title',
            style: TitleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            cursorColor: Res.dGrayColor,
            controller: _tittleControllerEn,
            style: TextStyle(color: Res.dGrayColor),
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Res.lGrayColor,
              focusedBorder: OutlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(
                    width: 0.5, color: Res.dGrayColor.withOpacity(0.6)),
              ),
              border: OutlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(
                    width: 0.5, color: Res.dGrayColor.withOpacity(0.6)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${localizations.moredetails}",
            style: TitleStyle,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              height: 150,
              child: TextFormField(
                cursorColor: Res.dGrayColor,
                controller: _moreDetailControllerEn,
                style: TextStyle(color: Res.dGrayColor),
                maxLines: 50,
                decoration: InputDecoration(
                  fillColor: Res.lGrayColor,
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 0.5, color: Res.dGrayColor.withOpacity(0.6)),
                  ),
                  border: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 0.5, color: Res.dGrayColor.withOpacity(0.6)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: error
                ? Text(
                    "** ${localizations.missingData}",
                    style: TextStyle(
                      color: Res.sPrimaryColor,
                      fontSize: Res.SubTextFontSize,
                    ),
                  )
                : Container(),
          ),
          Consumer<RequestPropertyProvider>(
            builder: (_, RequestProperty, child) => Container(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Res.kPrimaryColor),
                    shape: MaterialStateProperty.resolveWith((states) =>
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    localizations.nextSt,
                    style: const TextStyle(
                      fontSize: Res.SubTitleFontSize,
                    ),
                  ),
                ),
                onPressed: () {
                  if ((_tittleControllerAr.text.isEmpty ||
                          _moreDetailControllerAr.text.isEmpty) &&
                      (_tittleControllerEn.text.isEmpty ||
                          _moreDetailControllerEn.text.isEmpty)) {
                    setState(() {
                      error = true;
                    });
                  } else {
                    setState(() {
                      error = false;
                    });
                    OverlayEntry overlayEntry;
                    overlayEntry = OverlayEntry(
                        builder: (context) => doneWidget(
                            localizations.requestInprogress,
                            Icons.downloading));
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Overlay.of(context)!.insert(overlayEntry);
                      Timer(const Duration(milliseconds: 1500),
                          () => overlayEntry.remove());
                    });
                    PRProvider.changeMoreDetail(_moreDetailControllerAr.text);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ConfirmOrderRequestProperty(
                        packageId: PRProvider.requestType!,
                        price: PRProvider.priceAdawer!,
                        discount: '',
                        photography: '',
                        ads: '',
                        // package: PropertyTypeWidget(
                        //   title: localizations.adawerplus,
                        //   subtitle: localizations.lookingForPro,
                        //   description: localizations.adawerplusDesc,
                        //   pathImg: Res.adawrPlis,
                        //   price: "10 ${localizations.oMR}",
                        // ),
                      ),
                    ));
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
