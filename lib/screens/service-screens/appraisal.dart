import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main-page/components/upload_button.dart';
import '../main-page/main-page.dart';
import 'components/dropDownButton.dart';

class AppraisalMain extends StatefulWidget {
  const AppraisalMain({Key? key}) : super(key: key);

  @override
  State<AppraisalMain> createState() => _AppraisalMainState();
}

class _AppraisalMainState extends State<AppraisalMain> {
  int initialLabelIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
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
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // leading: Icon(Ico),
        title: Text(
          localizations.appraisal,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: AppraisalPageOne(),
    );
  }
}

// ignore: non_constant_identifier_names
TextStyle TitleStyle =
    TextStyle(color: Res.kPrimaryColor, fontSize: Res.SubTitleFontSize);
TextStyle SubTitleStyle = TextStyle(
    color: Res.blackColor,
    fontSize: Res.TextFontSize,
    fontWeight: FontWeight.bold);
TextStyle DetailTitleStyle = TextStyle(
  color: Res.blackColor,
  fontSize: Res.TextFontSize,
);

class AppraisalPageOne extends StatefulWidget {
  const AppraisalPageOne({Key? key}) : super(key: key);

  @override
  State<AppraisalPageOne> createState() => _AppraisalPageOneState();
}

class _AppraisalPageOneState extends State<AppraisalPageOne> {
  String dropdownvalue = "Fanja";
  // List of items in our dropdown menu
  var items = ["Muscat", "Fanja", "Bidbid"];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            localizations.bank + "  " * 32,
            style: SubTitleStyle,
          ),
          DropDownButtonWidget(items: items),
          Text(
            localizations.governorate + "  " * 28,
            style: SubTitleStyle,
          ),
          DropDownButtonWidget(items: items),
          Text(
            localizations.wilaya + "  " * 33,
            style: SubTitleStyle,
          ),
          DropDownButtonWidget(items: items),
          Text(
            localizations.sectorType + "  " * 28,
            style: SubTitleStyle,
          ),
          DropDownButtonWidget(items: items),
          Text(
            localizations.typeProperty + "  " * 23,
            style: SubTitleStyle,
          ),
          DropDownButtonWidget(items: items),
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            width: size.width * 0.8,
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Res.kPrimaryColor),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppraisalPageSecond()));
              },
              child: Text(
                localizations.nextSt,
                style: TextStyle(
                  fontSize: Res.SubTitleFontSize,
                  color: Res.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppraisalPageSecond extends StatefulWidget {
  const AppraisalPageSecond({Key? key}) : super(key: key);

  @override
  State<AppraisalPageSecond> createState() => _AppraisalPageSecondState();
}

class _AppraisalPageSecondState extends State<AppraisalPageSecond> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Res.blackColor,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // leading: Icon(Ico),
        title: Text(
          "Property Request",
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                localizations.idCard,
                style: SubTitleStyle,
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: UploadButton()),
            Text(
              localizations.buildingPlan,
              style: SubTitleStyle,
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: UploadButton()),
            Text(
              localizations.landPlan,
              style: SubTitleStyle,
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: UploadButton()),
            Text(
              localizations.ownership,
              style: SubTitleStyle,
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: UploadButton()),
            Text(
              localizations.buildingcomp,
              style: SubTitleStyle,
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: UploadButton()),
            Container(
              width: size.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Res.kPrimaryColor),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AppraisalThird()));
                },
                child: Text(
                  localizations.nextSt,
                  style: TextStyle(
                    fontSize: Res.SubTitleFontSize,
                    color: Res.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppraisalThird extends StatefulWidget {
  const AppraisalThird({Key? key}) : super(key: key);

  @override
  State<AppraisalThird> createState() => _AppraisalThirdState();
}

class _AppraisalThirdState extends State<AppraisalThird> {
  late TextEditingController _moreDetailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Res.blackColor,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // leading: Icon(Ico),
        title: Text(
          localizations.appraisal,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "${localizations.uploadFile} :                                                                       ",
                  style: SubTitleStyle,
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Res.lGrayColor,
                    backgroundColor: Res.lGrayColor.withOpacity(0.8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side:
                            BorderSide(color: Res.dGrayColor.withOpacity(0.2))),
                  ),
                  onPressed: () {},
                  child: Container(
                    height: 250,
                    padding: const EdgeInsets.all(20),
                    width: size * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Res.kPrimaryColor.withOpacity(0.2),
                          child: Icon(
                            Icons.cloud_download_rounded,
                            size: 18,
                            color: Res.kPrimaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          localizations.uploadFile,
                          style: TextStyle(
                            fontSize: Res.TextFontSize,
                            color: Res.dGrayColor,
                          ),
                        ),
                        Text(
                          localizations.fileType,
                          style: TextStyle(
                            fontSize: Res.SubTitleFontSize,
                            color: Res.dGrayColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50),
              width: size * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Res.kPrimaryColor),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppraisalAgency()));
                },
                child: Text(
                  localizations.submit,
                  style: TextStyle(
                    fontSize: Res.SubTitleFontSize,
                    color: Res.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppraisalAgency extends StatefulWidget {
  const AppraisalAgency({Key? key}) : super(key: key);

  @override
  State<AppraisalAgency> createState() => _AppraisalAgencyState();
}

class _AppraisalAgencyState extends State<AppraisalAgency> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Res.blackColor,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // leading: Icon(Ico),
        title: Text(
          localizations.appraisal,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: const AppraisalPageOne(),
    );
  }
}
