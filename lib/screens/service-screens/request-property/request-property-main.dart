import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/models/area_model.dart';
import 'package:maskkn/models/city.dart';
import 'package:maskkn/models/governorate.dart';
import 'package:maskkn/models/sector.dart';
import 'package:maskkn/models/sector_details.dart';
import 'package:maskkn/network-services/sector_req.dart';
import 'package:maskkn/providers/general_provider.dart';
import 'package:maskkn/screens/authorization_screens/components/customized_text_field.dart';
import 'package:maskkn/screens/profile/personal_information.dart';
import 'package:maskkn/screens/service-screens/request-property/requestp_step_2.dart';
import 'package:maskkn/services/authentication/validation.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../../../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:provider/provider.dart';
import '../../../../mskn.dart';
import '../../../../providers/request_property_provider.dart';
import '../../../network-services/wilays_governorate.dart';
import '../components/customizedDropdounButton.dart';

//Text styles
TextStyle TitleStyle =
    TextStyle(color: Res.kPrimaryColor, fontSize: Res.SubTitleFontSize);
TextStyle SubTitleStyle =
    TextStyle(color: Res.blackColor, fontSize: Res.TextFontSize);
TextStyle DetailTitleStyle =
    TextStyle(color: Res.blackColor, fontSize: Res.TextFontSize);
int step_num = 1;

class PropertyRequestMain extends StatefulWidget {
  const PropertyRequestMain({Key? key}) : super(key: key);

  @override
  State<PropertyRequestMain> createState() => _PropertyRequestMainState();
}

enum type { sell, rent }

class _PropertyRequestMainState extends State<PropertyRequestMain> {
  int currentStep = 0;
  MsknData mskn = MsknData();
  //  @override
  List? banksList;
  Color backgroundColor = Res.kPrimaryColor;
  bool sellPressed = false;
  bool RentPressed = false;

  ///DATA GETTER
  List<Sector> sectorData = [];
  List<SectorDetails> sectorDetailsData = [];
  List<Governorate> governorateData = [];
  List<City> cityData = [];
  String selectedListingType = type.rent.toString();
  String? selectedSectorType;
  String? selectedSectorId;
  String? selectedPropertyType;
  String? selectedPropertyTypeEn;
  String? selectedPropertyId;
  String? selectedGovernorate;
  String? selectedGovernorateId;
  String? selectedWilaya;
  String? selectedWilayaId;
  String? selectedVillage;
  RangeValues _currentRangeValues = RangeValues(100, 300000);
  bool error = false;
  SectorReqest sectorReqest = SectorReqest();
  List<AreaModel> items = [];
  List<String> selectedItems = [];
  TextEditingController priceMin = TextEditingController();
  TextEditingController priceMax = TextEditingController();

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
    fetchDataSector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    final PRProvider = Provider.of<RequestPropertyProvider>(context);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "${localizations.stepNum}$step_num / 3",
              style: TextStyle(
                color: Res.blackColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              value: 1 / 3,
              valueColor:
                  AlwaysStoppedAnimation(Res.kPrimaryColor.withOpacity(0.3)),
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
                  selectedItems.clear();
                  items.clear();
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
                  var area =
                      await sectorReqest.getArea(int.parse(selectedWilayaId!));
                  setState(() {
                    items.addAll(area);
                  });
                }),

            SizedBox(
              height: 10,
            ),
            Text(localeCode == 'ar' ? 'منطقة' : 'Area', style: SubTitleStyle),

            SizedBox(
              height: 10,
            ),
            MultiSelectDialogField(
              checkColor: Res.kPrimaryColor.withOpacity(0.5),
              selectedColor: Res.kPrimaryColor.withOpacity(0.5),
              selectedItemsTextStyle: TextStyle(color: Res.whiteColor),
              listType: MultiSelectListType.CHIP,
              title: Text(localeCode == 'ar' ? 'اختر المنطقة' : 'Select Area',
                  style: SubTitleStyle),
              confirmText: Text(localeCode == 'ar' ? 'اختر' : 'OK',
                  style: SubTitleStyle),
              cancelText: Text(localeCode == 'ar' ? 'الغاء' : 'Cancel',
                  style: SubTitleStyle),
              items: items.map((item) {
                final displayName =
                    localeCode == 'ar' ? item.nameAr : item.nameEn;
                final value =
                    displayName?.isNotEmpty == true ? displayName : item.nameAr;

                return MultiSelectItem<String>(
                  value!,
                  value,
                );
              }).toList(),
              onConfirm: (values) {
                setState(() {
                  selectedItems = values;
                });
              },
              initialValue: selectedItems,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            /*    FutureBuilder<List<String>>(
              future: countryData.getAllCites(localeCode),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<String> data = snapshot.data!;
                  return    DropDownButtonProvider(
                      items: data,
                      selectedValue: selectedWilaya,
                      onchanged: (value)  {
                        setState(() {
                          selectedWilaya = value as String;
                        });
                      } );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return  Container();
              },
            ),*/
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
                    selectedPropertyTypeEn = sectorDetailvalue.slug;
                    print("type2 ==> ${selectedPropertyId}");
                    print("type ==> ${value}");
                    print("type En ==> $selectedPropertyTypeEn");
                  });
                }),
            SizedBox(
              height: 10,
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
            //   min: 100.0,
            //   divisions: 100,
            //   max: 1000000.0,
            //   activeColor: Res.kPrimaryColor,
            //   inactiveColor: Res.lGrayColor2,
            //   onChanged: (RangeValues values) {
            //     setState(() {
            //       _currentRangeValues = values;
            //       print('range :: ${_currentRangeValues.start}');
            //     });
            //   },
            //   values: _currentRangeValues,
            // ),

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
                        name: '0',
                      ),
                    ],
                  ),
                ),
              ],
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
                    localizations.nextSt,
                    style: const TextStyle(
                      fontSize: Res.SubTitleFontSize,
                    ),
                  ),
                ),
                onPressed: () {
                  if (selectedSectorType == null ||
                      selectedPropertyType == null ||
                      selectedGovernorate == null ||
                      selectedWilaya == null) {
                    setState(() {
                      error = true;
                    });
                  } else {
                    if (selectedListingType == 'type.sell') {
                      PRProvider.changelistingType('is_sale');
                    } else {
                      PRProvider.changelistingType('is_rent');
                    }

                    PRProvider.changegovernorate(selectedGovernorateId!);
                    PRProvider.changeSectorDetailSlug(selectedPropertyTypeEn!);
                    PRProvider.changewilaya(selectedWilayaId!);
                    PRProvider.changesectorType(selectedSectorId!);
                    PRProvider.changepropertyType(selectedPropertyId!);
                    PRProvider.changeSelectedPropertyType(
                        selectedPropertyType!);
                    PRProvider.changepriceLow(
                       priceMin.text);
                    PRProvider.changepriceHigh(
                       priceMax.text);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PropertyRequestSecond(),
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
