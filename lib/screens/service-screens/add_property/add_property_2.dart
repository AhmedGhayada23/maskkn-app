import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../appConfig.dart';
import '../../../providers/list_property_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'add_property_3.dart';

class AddPropertyStepTwo extends StatefulWidget {
  const AddPropertyStepTwo({super.key});
  @override
  State<AddPropertyStepTwo> createState() => _AddPropertyStepTwoState();
}

class _AddPropertyStepTwoState extends State<AddPropertyStepTwo> {
  double? landSize;
  double? buildingSize;
  double? price;
  int year = DateTime.now().year;
  int bathroom_num = 0;
  int bedroom_num = 0;
  bool isChecked = false;
  bool LaundryIsChecked = false;
  bool MaidIsChecked = false;
  String builtYear = DateTime.now().year.toString();

  bool error = false;

  selectedYear(value) {
    setState(() {
      builtYear = value;
    });
  }

  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Res.grey200!, width: 0.5));

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    TextEditingController priceController = TextEditingController();
    TextEditingController areaController = TextEditingController();
    TextEditingController buildingController = TextEditingController();
    //add property provider instans
    final ARProvider = Provider.of<ListPropertyProvider>(context);

    return Scaffold(
      backgroundColor: Res.whiteColor,
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
        title: Text(
          localizations.addProperty,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.stepNum + " 2 / 4",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              LinearProgressIndicator(
                backgroundColor: Res.grey200,
                value: 2 / 4,
                valueColor:
                    AlwaysStoppedAnimation(Res.kPrimaryColor.withOpacity(0.3)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  localizations.setprice,
                  style: TextStyle(fontSize: Res.SubTitleFontSize),
                ),
              ),
              TextFormField(
                cursorColor: Res.dGrayColor,
                controller: priceController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    hintText: localizations.setprice,
                    suffixIcon: Container(
                      width: 70,
                      color: Res.grey200,
                      child: Center(
                          child: Text(
                        localizations.oMR,
                        style: TextStyle(
                            color: Res.dGrayColor, fontWeight: FontWeight.bold),
                      )),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                    enabledBorder: border,
                    border: border,
                    focusedBorder: border,
                    disabledBorder: border),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Consumer<ListPropertyProvider>(
                  builder: (_, ListProperty, child) => ARProvider
                                  .sectorDetailSlug ==
                              "shop" ||
                          ARProvider.sectorDetailSlug == "store" ||
                          ARProvider.sectorDetailSlug == "factory" ||
                          ARProvider.sectorDetailSlug == "land" ||
                          ARProvider.sectorDetailSlug == "building" ||
                          ARProvider.sectorDetailSlug == "farm"
                      ? Container()
                      : Container(
                          child: Column(
                            children: [
                              Text(
                                localizations.roomsP,
                                style: TextStyle(
                                    fontSize: Res.SubTitleFontSize,
                                    color: Res.kPrimaryColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ARProvider.sectorDetailSlug == "eva-home" ||
                                      ARProvider.sectorDetailSlug ==
                                          "apartment" ||
                                      ARProvider.sectorDetailSlug == "office" ||
                                      ARProvider.sectorDetailSlug == "villa"
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            localizations.bedroom,
                                            style: TextStyle(
                                              fontSize: Res.SubTitleFontSize,
                                            ),
                                          ),
                                        ),
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
                                                child: Center(
                                                    child: Icon(
                                                  Icons.remove,
                                                  size: 15,
                                                )),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0),
                                              child:
                                                  Text(bedroom_num.toString()),
                                            ),
                                            SizedBox(
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
                                                child: Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  size: 15,
                                                  color: Colors.white,
                                                )),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 10,
                              ),
                              ARProvider.sectorDetailSlug == "eva-home" ||
                                      ARProvider.sectorDetailSlug ==
                                          "apartment" ||
                                      ARProvider.sectorDetailSlug == "office" ||
                                      ARProvider.sectorDetailSlug == "chalet" ||
                                      ARProvider.sectorDetailSlug == "villa"
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            localizations.bathroom,
                                            style: TextStyle(
                                              fontSize: Res.SubTitleFontSize,
                                            ),
                                          ),
                                        ),
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
                                                child: Center(
                                                    child: Icon(
                                                  Icons.remove,
                                                  size: 15,
                                                )),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0),
                                              child:
                                                  Text(bathroom_num.toString()),
                                            ),
                                            SizedBox(
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
                                                child: Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  size: 15,
                                                  color: Colors.white,
                                                )),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              ARProvider.sectorDetailSlug == "land" ||
                                      ARProvider.sectorDetailSlug == "farm" ||
                                      ARProvider.sectorDetailSlug == "room" ||
                                      ARProvider.sectorDetailSlug == "office" ||
                                      ARProvider.sectorDetailSlug == "shop" ||
                                      ARProvider.sectorDetailSlug ==
                                          "factory" ||
                                      ARProvider.sectorDetailSlug == "chalet" ||
                                      ARProvider.sectorDetailSlug == "farm" ||
                                      ARProvider.sectorDetailSlug == "building"
                                  ? Row(
                                      children: [
                                        Checkbox(
                                          value: LaundryIsChecked,
                                          onChanged: (value) {
                                            print('LaundryIsChecked :: $value');
                                            setState(() =>
                                                LaundryIsChecked = value!);
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => LaundryIsChecked
                                                      ? Res.kPrimaryColor
                                                      : Res.whiteColor),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7.0),
                                          child: Text(
                                            localizations.laundryR,
                                            style: TextStyle(
                                                color: Res.dGrayColor,
                                                fontSize: Res.SubTitleFontSize),
                                          ),
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                              ARProvider.sectorDetailSlug == "land" ||
                                      ARProvider.sectorDetailSlug == "farm" ||
                                      ARProvider.sectorDetailSlug == "room" ||
                                      ARProvider.sectorDetailSlug == "office" ||
                                      ARProvider.sectorDetailSlug == "shop" ||
                                      ARProvider.sectorDetailSlug ==
                                          "factory" ||
                                      ARProvider.sectorDetailSlug == "chalet" ||
                                      ARProvider.sectorDetailSlug == "farm" ||
                                      ARProvider.sectorDetailSlug == "building"
                                  ? Row(
                                      children: [
                                        Checkbox(
                                          value: MaidIsChecked,
                                          onChanged: (value) {
                                            setState(
                                                () => MaidIsChecked = value!);
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => MaidIsChecked
                                                      ? Res.kPrimaryColor
                                                      : Res.whiteColor),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7.0),
                                          child: Text(
                                            localizations.maidRoom,
                                            style: TextStyle(
                                                color: Res.dGrayColor,
                                                fontSize: Res.SubTitleFontSize),
                                          ),
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                            ],
                          ),
                        )),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                child: Text(
                  localizations.builtYear,
                  style: TextStyle(
                    fontSize: Res.SubTitleFontSize,
                  ),
                ),
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Res.grey200!,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(children: [
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      localizations.builtYear,
                      style: TextStyle(
                          fontSize: Res.SubTitleFontSize,
                          color: Res.dGrayColor),
                    ),
                  ),
                  Spacer(),
                  VerticalDivider(),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      builtYear,
                      style: TextStyle(fontSize: Res.SubTitleFontSize),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  PopupMenuButton(
                    constraints: BoxConstraints(
                      maxHeight: 200,
                    ),
                    itemBuilder: (context) {
                      return List.generate(30, (index) {
                        return PopupMenuItem(
                          value: year - index,
                          child: Text((year - index).toString()),
                        );
                      });
                    },
                    onSelected: (value) {
                      print("value is $value");
                      selectedYear(value.toString());
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              ARProvider.sectorDetailSlug == "land" ||
                      ARProvider.sectorDetailSlug == "farm"
                  ? Text(
                      localizations.areaSize,
                      style: TextStyle(fontSize: Res.SubTitleFontSize),
                    )
                  : SizedBox(),
              SizedBox(
                height: 5,
              ),
              ARProvider.sectorDetailSlug == "land" ||
                      ARProvider.sectorDetailSlug == "farm"
                  ? TextFormField(
                      controller: areaController,
                      cursorColor: Res.dGrayColor,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          hintText: localizations.areaSize,
                          suffixIcon: Container(
                            width: 70,
                            color: Res.grey200!,
                            child: Center(
                                child: Text(
                              "sqm",
                              style: TextStyle(
                                  color: Res.dGrayColor,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          enabledBorder: border,
                          border: border,
                          focusedBorder: border),
                      keyboardType: TextInputType.number,
                    )
                  : SizedBox(),
              SizedBox(
                height: 10,
              ),
              ARProvider.sectorDetailSlug == "villa" ||
                      ARProvider.sectorDetailSlug == "apartment" ||
                      ARProvider.sectorDetailSlug == "shop" ||
                      ARProvider.sectorDetailSlug == "store" ||
                      ARProvider.sectorDetailSlug == "factory" ||
                      ARProvider.sectorDetailSlug == "building"
                  ? Text(
                      localizations.buildingsize,
                      style: TextStyle(fontSize: Res.SubTitleFontSize),
                    )
                  : SizedBox(),
              SizedBox(
                height: 5,
              ),
              ARProvider.sectorDetailSlug == "villa" ||
                      ARProvider.sectorDetailSlug == "apartment" ||
                      ARProvider.sectorDetailSlug == "shop" ||
                      ARProvider.sectorDetailSlug == "store" ||
                      ARProvider.sectorDetailSlug == "factory" ||
                      ARProvider.sectorDetailSlug == "building"
                  ? TextFormField(
                      controller: buildingController,
                      cursorColor: Res.dGrayColor,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          hintText: localizations.buildingsize,
                          suffixIcon: Container(
                            width: 70,
                            color: Res.grey200,
                            child: Center(
                                child: Text(
                              "sqm",
                              style: TextStyle(
                                  color: Res.dGrayColor,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          enabledBorder: border,
                          border: border,
                          focusedBorder: border),
                      keyboardType: TextInputType.number,
                    )
                  : SizedBox(),
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
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Res.kPrimaryColor,
                    elevation: 1,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      localizations.nextSt,
                      style: TextStyle(
                        fontSize: Res.SubTitleFontSize,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (priceController == null ||
                        areaController.text == null ||
                        buildingController.text == null) {
                      print("info not completed");
                      setState(() {
                        error = true;
                      });
                    } else {
                      ARProvider.changeprice(priceController.text);
                      ARProvider.changebedrooms(bedroom_num);
                      ARProvider.changebathrooms(bathroom_num);
                      if (LaundryIsChecked == true) {
                        ARProvider.changelaundryRoom('1');
                      } else {
                        ARProvider.changelaundryRoom('0');
                      }

                      if (MaidIsChecked == true) {
                        ARProvider.changemaidRoom('1');
                      } else {
                        ARProvider.changemaidRoom('0');
                      }

                      ARProvider.changebuiltYear(int.parse(builtYear));
                      ARProvider.changeareaSize(areaController.text);
                      ARProvider.changebuildingSize(buildingController.text);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddPropertyStepThree(),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
