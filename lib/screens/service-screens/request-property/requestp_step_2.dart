import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/screens/authorization_screens/components/customized_text_field.dart';
import 'package:maskkn/screens/main-page/main-page.dart';
import 'package:maskkn/screens/service-screens/request-property/request_type.dart';
import 'package:maskkn/screens/service-screens/request-property/requestp_step_3.dart';
import 'package:provider/provider.dart';
import '../../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/request_property_provider.dart';

//Text styles
TextStyle TitleStyle =
    TextStyle(color: Res.kPrimaryColor, fontSize: Res.SubTitleFontSize);
TextStyle SubTitleStyle =
    TextStyle(color: Res.blackColor, fontSize: Res.TextFontSize);
TextStyle DetailTitleStyle =
    TextStyle(color: Res.blackColor, fontSize: Res.TextFontSize);

class PropertyRequestSecond extends StatefulWidget {
  const PropertyRequestSecond({Key? key}) : super(key: key);

  @override
  State<PropertyRequestSecond> createState() => _PropertyRequestSecondState();
}

enum RoomTypes { villa, dorms, building }

class _PropertyRequestSecondState extends State<PropertyRequestSecond> {
  double _landSize = 300;
  double _buildingSize = 300;

  int year = DateTime.now().year;
  String? fromYear;
  String? toYear;
  List<int> toyear = [];
  List<int> fromyear = [];
  // ignore: non_constant_identifier_names
  int bathroom_num = 0;
  // ignore: non_constant_identifier_names
  int bedroom_num = 0;
  bool isChecked = false;
  RoomTypes? _roomType = RoomTypes.villa;
  TextEditingController buildingSizeMin = TextEditingController();
  TextEditingController buildingSizeMax = TextEditingController();
  TextEditingController landSizeMin = TextEditingController();
  TextEditingController landSizeMax = TextEditingController();

  @override
  void initState() {
    fromyear = List.generate(year - 1979, (index) => 1980 + index);
    toyear = List.generate(year - 1979, (index) => 1980 + index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String LanguageCode = Localizations.localeOf(context).languageCode;
    final PRProvider = Provider.of<RequestPropertyProvider>(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //major widgets
          const SizedBox(
            height: 10,
          ),
          Text(
            "${localizations.stepNum} 2 / 3",
            style: TextStyle(
              color: Res.blackColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            value: 2 / 3,
            valueColor:
                AlwaysStoppedAnimation(Res.kPrimaryColor.withOpacity(0.3)),
          ),
          const SizedBox(
            height: 10,
          ),

          //consumer for the building year range ==> it only appear with Room
          // Consumer<RequestPropertyProvider>(
          //   builder: (_, RequestProperty, child) =>
          //       //result = testCondition ? trueValue : falseValue
          //       // RequestProperty.propertyType == 'Room'?

          //       Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       RequestProperty.sectorDetailSlug == "eva-home" ||
          //               RequestProperty.sectorDetailSlug == "apartment" ||
          //               RequestProperty.sectorDetailSlug == "office" ||
          //               RequestProperty.sectorDetailSlug == "shop" ||
          //               RequestProperty.sectorDetailSlug == "villa"
          //           ? Text(localizations.roomType)
          //           : SizedBox(),
          //       RequestProperty.sectorDetailSlug == 'villa'
          //           ? RadioListTile<RoomTypes>(
          //               activeColor: Res.kPrimaryColor,
          //               title: Text(localizations.villa),
          //               value: RoomTypes.villa,
          //               groupValue: _roomType,
          //               onChanged: (RoomTypes? value) {
          //                 setState(() {
          //                   _roomType = value;
          //                   if (_roomType == RoomTypes.villa) {
          //                     print('villa');
          //                   }
          //                 });
          //               },
          //             )
          //           : SizedBox(),
          //       RequestProperty.sectorDetailSlug == "eva-home" ||
          //               RequestProperty.sectorDetailSlug == "apartment" ||
          //               RequestProperty.sectorDetailSlug == "office" ||
          //               RequestProperty.sectorDetailSlug == "shop"
          //           ? RadioListTile<RoomTypes>(
          //               activeColor: Res.kPrimaryColor,
          //               title: Text(localizations.building),
          //               value: RoomTypes.building,
          //               groupValue: _roomType,
          //               onChanged: (RoomTypes? value) {
          //                 setState(() {
          //                   _roomType = value;
          //                 });
          //               },
          //             )
          //           : SizedBox(),
          //       RequestProperty.sectorDetailSlug == "eva-home" ||
          //               RequestProperty.sectorDetailSlug == "apartment" ||
          //               RequestProperty.sectorDetailSlug == "office"
          //           ? RadioListTile<RoomTypes>(
          //               activeColor: Res.kPrimaryColor,
          //               title: Text(localizations.dorm),
          //               value: RoomTypes.dorms,
          //               groupValue: _roomType,
          //               onChanged: (RoomTypes? value) {
          //                 setState(() {
          //                   _roomType = value;
          //                 });
          //               },
          //             )
          //           : SizedBox(),
          //     ],
          //   ),
          //   // : Container()
          // ),

          //consumer for the building year range ==> it only appear with VILLA & FLAT
          Consumer<RequestPropertyProvider>(
              builder: (_, RequestProperty, child) =>
                  //result = testCondition ? trueValue : falseValue
                  // RequestProperty.propertyType == 'Villa' ||  RequestProperty.propertyType == 'Flat'?

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequestProperty.sectorDetailSlug == "shop" ||
                                RequestProperty.sectorDetailSlug == "store" ||
                                RequestProperty.sectorDetailSlug == "factory" ||
                                RequestProperty.sectorDetailSlug == "land" ||
                                RequestProperty.sectorDetailSlug ==
                                    "building" ||
                                RequestProperty.sectorDetailSlug == "farm"
                            ? SizedBox()
                            : Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "${localizations.roomsP}",
                                  style: TitleStyle,
                                ),
                              ),
                        RequestProperty.sectorDetailSlug == "apartment" ||
                                RequestProperty.sectorDetailSlug == "villa"
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(localizations.bathroom,
                                        style: SubTitleStyle,
                                        textAlign: LanguageCode == 'en'
                                            ? TextAlign.left
                                            : TextAlign.right),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Res.grey200,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 25,
                                          width: 25,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            onTap: () {
                                              setState(() {
                                                if (bathroom_num == 0) {
                                                  return;
                                                }
                                                bathroom_num--;
                                              });
                                            },
                                            child: const Center(
                                                child: Icon(
                                              Icons.remove,
                                              size: 15,
                                            )),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Text(bathroom_num.toString()),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Res.kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 25,
                                          width: 25,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            onTap: () {
                                              setState(() {
                                                bathroom_num++;
                                              });
                                            },
                                            child: const Center(
                                                child: Icon(
                                              Icons.add,
                                              size: 15,
                                              color: Colors.white,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        RequestProperty.sectorDetailSlug == "apartment" ||
                                RequestProperty.sectorDetailSlug == "villa"
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(localizations.bedroom,
                                        style: SubTitleStyle,
                                        textAlign: LanguageCode == 'en'
                                            ? TextAlign.left
                                            : TextAlign.right),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Res.grey200,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 25,
                                          width: 25,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            onTap: () {
                                              setState(() {
                                                if (bedroom_num == 0) {
                                                  return;
                                                }
                                                bedroom_num--;
                                              });
                                            },
                                            child: const Center(
                                                child: Icon(
                                              Icons.remove,
                                              size: 15,
                                            )),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Text(bedroom_num.toString()),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Res.kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 25,
                                          width: 25,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            onTap: () {
                                              setState(() {
                                                bedroom_num++;
                                              });
                                            },
                                            child: const Center(
                                                child: Icon(
                                              Icons.add,
                                              size: 15,
                                              color: Colors.white,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        Divider(
                          color: Res.dGrayColor.withOpacity(0.8),
                          indent: 15,
                          endIndent: 15,
                        ),
                      ],
                    ),
                  )
              //: Container()
              ),

          //consumer for the building year range ==> it only appear with VILLA
          Consumer<RequestPropertyProvider>(
            builder: (_, RequestProperty, child) =>
                RequestProperty.sectorDetailSlug == 'villa'
                    ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "${localizations.yearb}                                                                                 ",
                                style: DetailTitleStyle,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(localizations.from),
                                    DropdownButton(
                                      items: fromyear
                                          .map(
                                            (e) => DropdownMenuItem<String>(
                                              value: e.toString(),
                                              child: Text(e.toString()),
                                            ),
                                          )
                                          .toList(),
                                      value: fromYear,
                                      hint: Text('حدد التاريخ'),
                                      onChanged: (value) {
                                        setState(() {
                                          fromYear = value;
                                        });
                                      },
                                    ),
                                  ],
                                )),
                                SizedBox(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(localizations.to),
                                    //DropDownButton(items: [for (int i=30; i>=0; i--) "${year - i}" ]),
                                    DropdownButton(
                                      items: toyear
                                          .map(
                                            (e) => DropdownMenuItem<String>(
                                              value: e.toString(),
                                              child: Text(e.toString()),
                                            ),
                                          )
                                          .toList(),
                                      value: toYear,
                                      hint: Text('حدد التاريخ'),
                                      onChanged: (value) {
                                        setState(() {
                                          toYear = value;
                                        });
                                      },
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            Divider(
                              color: Res.dGrayColor.withOpacity(0.8),
                              indent: 15,
                              endIndent: 15,
                            ),
                          ],
                        ),
                      )
                    : Container(),
          ),

          //consumer for the landsize ==> it only appear with LAND/VILLA
          Consumer<RequestPropertyProvider>(
            builder: (_, RequestProperty, child) =>
                //result = testCondition ? trueValue : falseValue
                // RequestProperty.propertyType == 'Land' ||
                //         RequestProperty.propertyType == 'Villa'
                //     ?
                RequestProperty.sectorDetailSlug == "land" ||
                        RequestProperty.sectorDetailSlug == "villa"
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageCode == 'ar'
                                      ? 'الحد الأدنى لمساحة الأرض'
                                      : 'Land Size Min',
                                  style: SubTitleStyle,
                                ),
                                CustomizedTextField(
                                  controller: landSizeMin,
                                  name: '0',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageCode == 'ar'
                                      ? 'الحد الأقصى لحجم الأرض'
                                      : 'Land Size Max',
                                  style: SubTitleStyle,
                                ),
                                CustomizedTextField(
                                  controller: landSizeMax,
                                  name: '0',
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container(),
          ),
          SizedBox(
            height: 10,
          ),
          //consumer for buildingSize ==> it only appear with SHOP/OFFICE/STORE/VILLA
          Consumer<RequestPropertyProvider>(
            builder: (_, RequestProperty, child) =>
                //result = testCondition ? trueValue : falseValue
                // RequestProperty.propertyType == 'Shop' ||
                //         RequestProperty.propertyType == 'Villa' ||
                //         RequestProperty.propertyType == 'Office' ||
                //         RequestProperty.propertyType == 'Store'
                //     ?
                RequestProperty.sectorDetailSlug == "villa" ||
                        RequestProperty.sectorDetailSlug == "office" ||
                        RequestProperty.sectorDetailSlug == "shop" ||
                        RequestProperty.sectorDetailSlug == "store"
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageCode == 'ar'
                                      ? 'الحد الأدنى لحجم المبنى'
                                      : 'Building Size Min',
                                  style: SubTitleStyle,
                                ),
                                CustomizedTextField(
                                  controller: buildingSizeMin,
                                  name: '0',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageCode == 'ar'
                                      ? 'حجم المبنى الأقصى'
                                      : 'Building Size Max',
                                  style: SubTitleStyle,
                                ),
                                CustomizedTextField(
                                  controller: buildingSizeMax,
                                  name: '0',
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container(),
          ),
          SizedBox(
            height: 10,
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
                    localizations.nextPage,
                    style: const TextStyle(
                      fontSize: Res.SubTitleFontSize,
                    ),
                  ),
                ),
                onPressed: () {
                  PRProvider.changebathrooms(bathroom_num);
                  PRProvider.changebedrooms(bedroom_num);
                  PRProvider.changebuiltYearfrom(fromYear ?? '');
                  PRProvider.changebuiltYearTo(toYear ?? '');
                  PRProvider.changelandSize(landSizeMax.text);
                  PRProvider.changebuildingSize(buildingSizeMax.text);

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PropertyRequestFinal(),
                  ));
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}
