import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/models/sector.dart';
import 'package:maskkn/models/sector_details.dart';
import 'package:maskkn/network-services/sector_req.dart';
import 'package:maskkn/screens/main-page/filter_page.dart';
import 'package:provider/provider.dart';
import '../../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../network-services/wilays_governorate.dart';
import '../../../providers/list_property_provider.dart';
import '../components/customizedDropdounButton.dart';
import 'add_property_2.dart';

enum type { sell, rent }

class AddProperty extends StatefulWidget {
  const AddProperty({super.key});

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  bool sellPressed = false;
  bool RentPressed = false;
  SectorReqest sectorReqest = SectorReqest();
  List<Sector> sectorData = [];
  List<SectorDetails> sectorDetailsData = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  ///DATA GETTER
  String selectedListingType = type.rent.toString();
  String? selectedSectorType;
  String? selectedSectorId;
  String? selectedPropertyType;
  String? selectedPropertyId;
  String? selectedGovernorate;
  String? sectorDetailSlug;
  String? selectedWilaya;
  String? selectedVillage;

//to sent the data to api, I created the instance of statApi
  StatApi countryData = StatApi();

// border that is used more than once
  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide:
          BorderSide(color: Res.dGrayColor.withOpacity(0.5), width: 0.5));

  //check variable for the required data
  bool error = false;

  fetchDataSector() async {
    var sectors = await sectorReqest.getSector();

    setState(() {
      sectorData.addAll(sectors);
    });
  }

  @override
  void initState() {
    fetchDataSector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    List<String> sectorList = [
      localizations.residential,
      localizations.commercial,
      localizations.agriculture,
      localizations.industrial
    ];
    List<String> propertyTypeList = [
      localizations.land,
      localizations.villa,
      localizations.office,
      localizations.shop,
      localizations.flat,
      localizations.store,
      localizations.room
    ];

    //add property provider instance
    final ARProvider = Provider.of<ListPropertyProvider>(context);
    String localeCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: Res.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.stepNum + " 1 / 4",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              LinearProgressIndicator(
                backgroundColor: Res.grey200,
                value: 1 / 4,
                valueColor:
                    AlwaysStoppedAnimation(Res.kPrimaryColor.withOpacity(0.3)),
              ),
              const SizedBox(
                height: 10,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   localizations.chooseListingType,
                  //   style: const TextStyle(fontSize: Res.SubTitleFontSize),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  CustomRadioButton(
                    defaultSelected: type.rent,
                    elevation: 0,
                    selectedBorderColor: Res.sPrimaryColor,
                    unSelectedBorderColor: Res.sPrimaryColor,
                    wrapAlignment: WrapAlignment.spaceBetween,
                    margin: const EdgeInsets.all(5),
                    shapeRadius: 8,
                    enableShape: true,
                    radius: 8,
                    width: 180,
                    height: 48,
                    unSelectedColor: Res.whiteColor,
                    buttonLables: [
                      localizations.sellListing,
                      localizations.rentListing,
                    ],
                    buttonValues: [
                      type.sell,
                      type.rent,
                    ],
                    buttonTextStyle: ButtonTextStyle(
                        selectedColor: Res.whiteColor,
                        unSelectedColor: Res.sPrimaryColor.withOpacity(0.5),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    radioButtonValue: (value) {
                      selectedListingType = value.toString();
                      print(selectedListingType.toString());
                    },
                    selectedColor: Res.sPrimaryColor,
                  ),
                  Text(
                    localizations.sectorType,
                    style: SubTitleStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropDownButtonProvider(
                      items: sectorData
                          .map((e) => localeCode == 'ar'
                              ? e.sectorAr.toString()
                              : e.sectorEn.toString())
                          .toList(),
                      selectedValue: selectedSectorType,
                      onchanged: (value) async {
                        setState(() {
                          selectedPropertyType = null;
                          sectorDetailsData.clear();
                          var setId = sectorData.firstWhere((element) =>
                              localeCode == 'ar'
                                  ? element.sectorAr == value
                                  : element.sectorEn == value);

                          selectedSectorId = setId.id.toString();
                          selectedSectorType = value as String;
                        });
                        var sectorsDetails = await sectorReqest
                            .getSectorDetailsId(int.parse(selectedSectorId!));
                        setState(() {
                          sectorDetailsData.addAll(sectorsDetails);
                        });
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    localizations.typeProperty,
                    style: Res.SubTitleStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropDownButtonProvider(
                      items: sectorDetailsData
                          .map((e) => localeCode == 'ar'
                              ? e.nameAr.toString()
                              : e.nameEn.toString())
                          .toList(),
                      selectedValue: selectedPropertyType,
                      onchanged: (value) {
                        setState(() {
                          var sectorDetailvalue = sectorDetailsData.firstWhere(
                            (element) => localeCode == 'ar'
                                ? element.nameAr == value
                                : element.nameEn == value,
                          );

                          selectedPropertyId = sectorDetailvalue.id.toString();
                          selectedPropertyType = value as String;
                          sectorDetailSlug = sectorDetailvalue.slug;
                          print("type2 ==> ${selectedPropertyId}");
                          print("type ==> ${value}");
                          print("type En ==> $sectorDetailSlug");
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                    child: Text(
                      localizations.listTitle,
                      style: TextStyle(
                          color: Res.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    controller: titleController,
                    maxLength: 30,
                    cursorColor: Res.dGrayColor,
                    decoration: InputDecoration(
                        hintText: localizations.enterTitle,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 15),
                        enabledBorder: border,
                        focusedBorder: border,
                        border: border,
                        disabledBorder: border),
                    keyboardType: TextInputType.name,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 15),
                    child: Text(
                      localizations.description + "*",
                      style: TextStyle(
                          color: Res.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    cursorColor: Res.dGrayColor,
                    controller: descriptionController,
                    maxLength: 400,
                    maxLines: 7,
                    decoration: InputDecoration(
                        hintText: localizations.description,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        enabledBorder: border,
                        focusedBorder: border,
                        border: border,
                        disabledBorder: border),
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),

              //widgets[currentStep],
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
                          color: Res.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onPressed: () {
                    if (selectedSectorType == null ||
                        selectedPropertyType == null ||
                        selectedListingType == null ||
                        titleController.text == null) {
                      setState(() {
                        error = true;
                      });
                    } else {
                      ARProvider.changelistingType(selectedListingType);
                      ARProvider.changepropertyType(selectedSectorId!);
                      ARProvider.changesectorType(selectedPropertyId!);
                      ARProvider.changepropertyTitle(titleController.text);
                      ARProvider.changeSectorDetailSlug(sectorDetailSlug!);
                      ARProvider.changedescription(descriptionController.text);
                      if (selectedListingType == 'type.sell') {
                        ARProvider.changelistingSellAndRent('1');
                        print('sell And Rent :: ${ARProvider.sellAndRent}');
                      } else {
                        ARProvider.changelistingSellAndRent('0');
                        print('sell And Rent :: ${ARProvider.sellAndRent}');
                      }

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddPropertyStepTwo(),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
