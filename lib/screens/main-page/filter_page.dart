import 'dart:async';
import 'dart:developer';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/models/city.dart';
import 'package:maskkn/models/governorate.dart';
import 'package:maskkn/models/property_request_type.dart';
import 'package:maskkn/models/sector.dart';
import 'package:maskkn/models/sector_details.dart';
import 'package:maskkn/network-services/property_request.dart';
import 'package:maskkn/network-services/sector_req.dart';
import 'package:maskkn/providers/general_provider.dart';
import 'package:maskkn/screens/authorization_screens/components/customized_text_field.dart';
import 'package:maskkn/screens/main-page/search_result.dart';
import 'package:maskkn/services/authentication/validation.dart';
import 'package:provider/provider.dart';
import '../../appConfig.dart';
import '../../mskn.dart';
import '../../network-services/wilays_governorate.dart';
import '../../providers/filter_provider.dart';
import '../service-screens/components/customizedDropdounButton.dart';
import '../service-screens/done_widget.dart';

//Text styles
TextStyle TitleStyle =
    TextStyle(color: Res.kPrimaryColor, fontSize: Res.SubTitleFontSize);
TextStyle SubTitleStyle =
    TextStyle(color: Res.blackColor, fontSize: Res.TextFontSize);
TextStyle DetailTitleStyle =
    TextStyle(color: Res.blackColor, fontSize: Res.TextFontSize);
int step_num = 1;

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

enum type { sell, rent }

class _FilterPageState extends State<FilterPage> {
  int currentStep = 0;
  MsknData mskn = MsknData();
  PropertyRequest propertyRequest = PropertyRequest();
  SectorReqest sectorReqest = SectorReqest();
  List<PropertyRequestType> propertyData = [];
  List<Sector> sectorData = [];
  List<SectorDetails> sectorDetailsData = [];
  List<Governorate> governorateData = [];
  List<City> cityData = [];

  fetchData() async {
    var properties = await propertyRequest.getPropertyRequestOffers();

    setState(() {
      propertyData.addAll(properties);
    });
  }

  fetchDataSector() async {
    var sectors = await sectorReqest.getSector();

    var governorateDetail = await sectorReqest.getGovernorate(null);

    setState(() {
      sectorData.addAll(sectors);

      governorateData.addAll(governorateDetail);
    });
  }

  @override
  void initState() {
    fetchData();
    fetchDataSector();
    super.initState();
  }

  Color backgroundColor = Res.kPrimaryColor;
  bool sellPressed = false;
  bool RentPressed = false;

  ///DATA GETTER
  String selectedListingType = type.rent.toString();
  String? selectedSectorType;
  String? selectedSectorId;
  String? selectedPropertyType;
  String? selectedPropertyId;
  String? selectedGovernorate;
  String? selectedGovernorateId;
  String? selectedPropertyTypeEn;
  String? selectedWilaya;
  String? selectedWilayaId;

  RangeValues _currentRangeValues = RangeValues(100, 300000);
  TextEditingController areaSizs = TextEditingController();
  TextEditingController buildingsize = TextEditingController();
  TextEditingController priceMin = TextEditingController();
  TextEditingController priceMax = TextEditingController();
  TextEditingController bathroom = TextEditingController();
  TextEditingController bedroom = TextEditingController();

  double _areaSizs = 0;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    final FProvider = Provider.of<FilterProvider>(context);
    String localeCode = Localizations.localeOf(context).languageCode;

    var sectorList = [
      localizations.residential,
      localizations.commercial,
      localizations.agriculture,
      localizations.industrial
    ];
    var propertyTypeList = [
      localizations.land,
      localizations.villa,
      localizations.office,
      localizations.shop,
      localizations.flat,
      localizations.store,
      localizations.room
    ];
    var wwww = [
      localizations.land,
      localizations.villa,
      localizations.office,
      localizations.shop,
      localizations.flat,
      localizations.store,
      localizations.room
    ];
    StatApi countryData = StatApi();
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
          localizations.filters,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            // This switch is to be activated for the variants of the side drawer quran index.
            CustomRadioButton(
              defaultSelected: type.rent,
              elevation: 0,
              selectedBorderColor: Res.sPrimaryColor,
              unSelectedBorderColor: Res.sPrimaryColor,
              wrapAlignment: WrapAlignment.spaceBetween,
              margin: EdgeInsets.all(5),
              shapeRadius: 8,
              enableShape: true,
              radius: 8,
              width: 150,
              height: 45,
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
                  textStyle: TextStyle(
                      fontSize: Res.TextFontSize, fontWeight: FontWeight.bold)),
              radioButtonValue: (value) {
                selectedListingType = value.toString();
              },
              selectedColor: Res.sPrimaryColor,
            ),
            SizedBox(
              height: 10,
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
              style: SubTitleStyle,
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
                    selectedPropertyTypeEn =
                        sectorDetailvalue.nameEn!.toLowerCase();
                    print("type2 ==> ${selectedPropertyId}");
                    print("type ==> ${selectedPropertyTypeEn}");
                  });
                }),
            SizedBox(
              height: 10,
            ),
            Text(localizations.governorate, style: SubTitleStyle),
            SizedBox(
              height: 10,
            ),
            DropDownButtonProvider(
                items: governorateData
                    .map((e) => localeCode == 'ar'
                        ? e.stateAr.toString()
                        : e.state.toString())
                    .toList(),
                selectedValue: selectedGovernorate,
                onchanged: (value) async {
                  selectedWilaya = null;
                  cityData.clear();
                  setState(() {
                    var governorateDatavalue = governorateData.firstWhere(
                      (element) => localeCode == 'ar'
                          ? element.stateAr == value
                          : element.state == value,
                    );

                    selectedGovernorateId = governorateDatavalue.id.toString();
                    selectedGovernorate = value as String;
                    print("type2 ==> ${selectedGovernorateId}");
                    print("type ==> ${value}");
                  });
                  var cityDetail = await sectorReqest
                      .getCity(int.parse(selectedGovernorateId!));
                  setState(() {
                    cityData.addAll(cityDetail);
                  });
                }),
            SizedBox(
              height: 10,
            ),
            Text(localizations.wilaya, style: SubTitleStyle),
            SizedBox(
              height: 10,
            ),
            DropDownButtonProvider(
                items: cityData
                    .map((e) => localeCode == 'ar'
                        ? e.cityAr.toString()
                        : e.city.toString())
                    .toList(),
                selectedValue: selectedWilaya,
                onchanged: (value) async {
                  setState(() {
                    var cityDatavalue = cityData.firstWhere(
                      (element) => localeCode == 'ar'
                          ? element.cityAr == value
                          : element.city == value,
                    );

                    selectedWilayaId = cityDatavalue.id.toString();
                    selectedWilaya = value as String;
                    print("type2 ==> ${selectedWilayaId}");
                    print("type ==> ${value}");
                  });
                }),

            SizedBox(
              height: 16,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localeCode == 'ar' ? 'الحد الأدنى للسعر' : 'price Min',
                        style: SubTitleStyle,
                      ),
                      CustomizedTextField(
                        controller: priceMin,
                        validatorCallBack: Validator.validateName,
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
                        localeCode == 'ar' ? 'الحد الأعلى للسعر' : 'price Max',
                        style: SubTitleStyle,
                      ),
                      CustomizedTextField(
                        controller: priceMax,
                        validatorCallBack: Validator.validateName,
                        name: '0',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                selectedPropertyTypeEn == "eva home" ||
                        selectedPropertyTypeEn == 'apartment' ||
                        selectedPropertyTypeEn == 'chalet'
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations.bedroom,
                              style: SubTitleStyle,
                            ),
                            CustomizedTextField(
                              controller: bedroom,
                              validatorCallBack: Validator.validateName,
                              name: '0',
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  width: 8,
                ),
                selectedPropertyTypeEn == "eva home" ||
                        selectedPropertyTypeEn == 'apartment' ||
                        selectedPropertyTypeEn == 'chalet'
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations.bathroom,
                              style: SubTitleStyle,
                            ),
                            CustomizedTextField(
                              controller: bathroom,
                              validatorCallBack: Validator.validateName,
                              name: '0',
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),

            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       localizations.setprice,
            //       style: SubTitleStyle,
            //     ),
            //     Text(
            //       "${_currentRangeValues.start.toStringAsFixed(1)} - ${_currentRangeValues.end.toStringAsFixed(2)} ${localizations.oMR}",
            //       style: TextStyle(
            //           color: Res.kPrimaryColor, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),

            // RangeSlider(
            //   labels: RangeLabels(
            //     _currentRangeValues.start.round().toString(),
            //     _currentRangeValues.end.round().toString(),
            //   ),
            //   min: 100.0,
            //   divisions: 100,
            //   max: 1000000.0,
            //   activeColor: Res.kPrimaryColor,
            //   inactiveColor: Res.lGrayColor2,
            //   onChanged: (RangeValues values) {
            //     setState(() {
            //       _currentRangeValues = values;
            //     });
            //   },
            //   values: _currentRangeValues,
            // ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                selectedPropertyTypeEn == "eva home" ||
                        selectedPropertyTypeEn == "apartment" ||
                        selectedPropertyTypeEn == "room" ||
                        selectedPropertyTypeEn == "office" ||
                        selectedPropertyTypeEn == "shop" ||
                        selectedPropertyTypeEn == "store" ||
                        selectedPropertyTypeEn == "factory"
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations.buildingsize,
                              style: SubTitleStyle,
                            ),
                            CustomizedTextField(
                              controller: buildingsize,
                              name: '0',
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  width: 8,
                ),
                selectedPropertyTypeEn == "eva home" ||
                        selectedPropertyTypeEn == "villa" ||
                        selectedPropertyTypeEn == "land" ||
                        selectedPropertyTypeEn == "shop" ||
                        selectedPropertyTypeEn == "store" ||
                        selectedPropertyTypeEn == "factory" ||
                        selectedPropertyTypeEn == "farm"
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations.landsize,
                              style: DetailTitleStyle,
                            ),
                            CustomizedTextField(
                              controller: areaSizs,
                              name: '0',
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),

                // _areaSizs == 2000
                //     ? Text(
                //         "${_areaSizs.round().toString()} +",
                //         style: TextStyle(
                //             color: Res.kPrimaryColor,
                //             fontWeight: FontWeight.bold),
                //       )
                //     : Text(
                //         _areaSizs.round().toString(),
                //         style: TextStyle(
                //             color: Res.kPrimaryColor,
                //             fontWeight: FontWeight.bold),
                //       ),
              ],
            ),

            // Slider(
            //   label: "$_areaSizs",
            //   min: 0,
            //   divisions: 4,
            //   max: 2000,
            //   activeColor: Res.kPrimaryColor,
            //   inactiveColor: Res.lGrayColor2,
            //   onChanged: (double value) {
            //     setState(() {
            //       _areaSizs = value;
            //     });
            //   },
            //   value: _areaSizs,
            // ),

            SizedBox(
              height: 16,
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
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Res.kPrimaryColor),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      localizations.showProperties,
                      style: const TextStyle(
                        fontSize: Res.SubTitleFontSize,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // if(selectedGovernorate != null){FProvider.changegovernorate(selectedGovernorate!);}
                    // if( selectedSectorType != null ){  FProvider.changesectorType(selectedSectorType!);}
                    // if( selectedPropertyType != null){  FProvider.changepropertyType(selectedPropertyType!);}
                    // if(selectedWilaya != null){ FProvider.changewilaya(selectedWilaya!);}
                    // FProvider.changeprice(_currentRangeValues);
                    // FProvider.changelistingType(selectedListingType);
                    // FProvider.changeareaSize(_areaSizs);
                    //   OverlayEntry overlayEntry;
                    //   overlayEntry =
                    //       OverlayEntry(builder: (context) => doneWidget(
                    //         "", Icons.downloading
                    //       ));
                    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    //     Overlay.of(context)!.insert(overlayEntry);
                    //     Timer(Duration(milliseconds: 1500),
                    //             () => overlayEntry.remove());});

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultPage(
                        cityId: selectedWilayaId,
                        saleStatus:
                            selectedListingType == "type.rent" ? '2' : '1',
                        sectorId: selectedSectorId,
                        sectorDetailsId: selectedPropertyId,
                        stateId: selectedGovernorateId,
                        priceMax: priceMax.text,
                        priceMin: priceMin.text,
                        maxArea: areaSizs.text,
                        minArea: '0',
                      ),
                    ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
