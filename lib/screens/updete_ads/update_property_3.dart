import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maskkn/models/Features.dart';
import 'package:maskkn/models/city.dart';
import 'package:maskkn/models/governorate.dart';
import 'package:maskkn/models/property_full_details.dart';
import 'package:maskkn/network-services/features.dart';
import 'package:maskkn/network-services/sector_req.dart';
import 'package:maskkn/providers/list_property_provider.dart';
import 'package:maskkn/screens/main-page/filter_page.dart';
import 'package:maskkn/screens/updete_ads/update_location.dart';
import 'package:maskkn/screens/service-screens/components/customizedDropdounButton.dart';
import 'package:provider/provider.dart';
import '../../appConfig.dart';
import '../../network-services/wilays_governorate.dart';
import '../../providers/general_provider.dart';
import '../real_estate_detials/components/feature_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'update_property_4.dart';

class UpdatePropertyStepThree extends StatefulWidget {
  int id;
    List<dynamic> setFeatures = [];
  UpdatePropertyStepThree({required this.id,required this.setFeatures,super.key});

  @override
  State<UpdatePropertyStepThree> createState() =>
      _UpdatePropertyStepThreeState();
}

class _UpdatePropertyStepThreeState extends State<UpdatePropertyStepThree> {
  String? selectedGovernorate;
  String? selectedGovernorateId;
  String? selectedWilayaId;
  String? selectedWilaya;
  bool error = false;
  SectorReqest sectorReqest = SectorReqest();
  FeaturesApi featuresApi = FeaturesApi();
  List<FeaturesAll> featuresData = [];
  List<int> selectedIds = [];
  List chosenFeatures = [];
  List<Governorate> governorateData = [];

  List<City> cityData = [];
  TextEditingController locationController = TextEditingController();
  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Res.grey200!, width: 0.5));
  StatApi countryData = StatApi();

  fetchDataSector() async {
    var governorateDetail = await sectorReqest.getGovernorate(null);
    var features = await featuresApi.getFeatures();

    setState(() {
      governorateData.addAll(governorateDetail);
      featuresData.addAll(features);
    });
  }

  Future<void> changeFeatures() async {

    setState(() {
      selectedIds = widget.setFeatures.map((str) => int.parse(str)).toList();
    });
  }

  Future<void> loadSectorDetails() async {
    var cityDetail = await sectorReqest.getCity(widget.id);
    setState(() {
      cityData.addAll(cityDetail);
    });
  }

  @override
  void initState() {
    fetchDataSector();
    changeFeatures();
    loadSectorDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;

    //add provider instance
    final ARProvider = Provider.of<ListPropertyProvider>(context);
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.stepNum + " 3 / 4",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              LinearProgressIndicator(
                backgroundColor: Res.grey200,
                value: 3 / 4,
                valueColor:
                    AlwaysStoppedAnimation(Res.kPrimaryColor.withOpacity(0.3)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                localizations.chooseFeatures,
                style: TextStyle(fontSize: Res.SubTitleFontSize),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<ListPropertyProvider>(
                builder: (context, value, child) {
                  return Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: List.generate(
                      featuresData.length,
                      (index) => InkWell(
                        onTap: () {
                          setState(() {
                            if (selectedIds.contains(featuresData[index].id)) {
                              selectedIds.remove(featuresData[index].id);
                            } else {
                              selectedIds.add(featuresData[index].id!);
                            }
                            print(selectedIds);
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: selectedIds.contains(featuresData[index].id)
                                ? Res.kPrimaryColor.withOpacity(0.5)
                                : Colors.transparent,
                            border: Border.all(color: Res.grey200!),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Expanded(
                              //   child: widget.icon,
                              // ),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              Text(
                                localeCode == 'ar'
                                    ? featuresData[index].nameAr.toString()
                                    : featuresData[index].nameEn.toString(),
                                style: TextStyle(
                                    color: selectedIds
                                            .contains(featuresData[index].id)
                                        ? Res.whiteColor
                                        : Res.dGrayColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              // FadeInLeft(
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           setState(() {
              //             chosenFeatures.add('parking');
              //             //  print('chosenFeatures :: ${chosenFeatures.length}');
              //           });
              //         },
              //         child: FeatureSectionWidget(
              //           onTap: () {
              //             setState(() {
              //               chosenFeatures.add('parking');
              //             });
              //           },
              //           icon: Icon(
              //             Icons.local_parking,
              //             size: 20,
              //             color: Res.dGrayColor,
              //           ),
              //           title: localizations.parking,
              //         ),
              //       ),
              //       FeatureSectionWidget(
              //         icon: Icon(Icons.security_sharp,
              //             size: 20, color: Res.dGrayColor),
              //         title: localizations.security,
              //       ),
              // FeatureSectionWidget(
              //   icon:
              //       Icon(Icons.balcony, size: 20, color: Res.dGrayColor),
              //   title: localizations.balcony,
              // ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // FadeInRight(
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       FeatureSectionWidget(
              //         icon: Icon(Icons.pool, size: 20, color: Res.dGrayColor),
              //         title: localizations.pool,
              //       ),
              //       FeatureSectionWidget(
              //         icon: Icon(Icons.ac_unit_sharp,
              //             size: 20, color: Res.dGrayColor),
              //         title: 'AC',
              //       ),
              //       FeatureSectionWidget(
              //         icon: Icon(Icons.cameraswitch_sharp,
              //             size: 20, color: Res.dGrayColor),
              //         title: localizations.cctv,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // FadeInRight(
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       FeatureSectionWidget(
              //         icon: Icon(Icons.fitness_center,
              //             size: 20, color: Res.dGrayColor),
              //         title: 'Fitness',
              //       ),
              //       FeatureSectionWidget(
              //         icon: Icon(Icons.maps_home_work_outlined,
              //             size: 20, color: Res.dGrayColor),
              //         title: 'Centre',
              //       ),
              // FeatureSectionWidget(
              //   icon:
              //       Icon(Icons.elevator, size: 20, color: Res.dGrayColor),
              //   title: 'Elevator',
              // ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Text(localizations.governorate, style: SubTitleStyle),
              SizedBox(
                height: 10,
              ),
              Consumer<ListPropertyProvider>(
                builder: (context, value, child) {
                  var name;
                  try {
                    name = governorateData.firstWhere((element) =>
                        element.id == int.parse(value.governorate));
                    print('اسم القطاع المطابق: ${name.name}');
                  } catch (e) {
                    print('لم يتم العثور على أي عنصر مطابق.');
                  }
                  return DropDownButtonProvider(
                      items: governorateData
                          .map((e) => localeCode == 'ar'
                              ? e.stateAr.toString()
                              : e.state.toString())
                          .toList(),
                      selectedValue: selectedGovernorate != null
                          ? selectedGovernorate
                          : name != null
                              ? localeCode == 'ar'
                                  ? name.stateAr
                                  : name.state
                              : null,
                      onchanged: (value) async {
                        selectedWilaya = null;
                        cityData.clear();
                        setState(() {
                          var governorateDatavalue = governorateData.firstWhere(
                            (element) => localeCode == 'ar'
                                ? element.stateAr == value
                                : element.state == value,
                          );

                          selectedGovernorateId =
                              governorateDatavalue.id.toString();
                          selectedGovernorate = value as String;
                          print("type2 ==> ${selectedGovernorateId}");
                          print("type ==> ${value}");
                          ARProvider.changegovernorate(selectedGovernorateId!);
                        });
                        var cityDetail = await sectorReqest
                            .getCity(int.parse(selectedGovernorateId!));
                        setState(() {
                          cityData.addAll(cityDetail);
                        });
                      });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(localizations.wilaya, style: SubTitleStyle),
              SizedBox(
                height: 10,
              ),
              Consumer<ListPropertyProvider>(
                builder: (context, value, child) {
                  var name;
                  try {
                    name = cityData.firstWhere((element) =>
                        element.id == int.parse(value.propertyType));
                    print('اسم القطاع المطابق: ${name.name}');
                  } catch (e) {
                    print('لم يتم العثور على أي عنصر مطابق.');
                  }
                  return DropDownButtonProvider(
                      items: cityData
                          .map((e) => localeCode == 'ar'
                              ? e.cityAr.toString()
                              : e.city.toString())
                          .toList(),
                      selectedValue: selectedWilaya != null
                          ? selectedWilaya
                          : name != null
                              ? localeCode == 'ar'
                                  ? name.cityAr
                                  : name.city
                              : null,
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
                        ARProvider.changewilaya(selectedWilayaId!);
                      });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<ListPropertyProvider>(
                builder: (context, value, child) {
                  if (value.lat != 0.0) {
                    locationController = TextEditingController(
                        text: '${value.lat} - ${value.long}');
                  }
                  return TextFormField(
                    readOnly: true,
                    controller: locationController,
                    cursorColor: Res.dGrayColor,
                    decoration: InputDecoration(
                        hintText: localizations.enterLocation,
                        suffixIcon: IconButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateLocation(),
                          )),
                          icon: Icon(
                            Icons.location_on,
                            color: Res.dGrayColor,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        enabledBorder: border,
                        border: border,
                        focusedBorder: border),
                    keyboardType: TextInputType.name,
                  );
                },
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
                    ARProvider.changefeatures(selectedIds);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UpdatePropertyStepFour(),
                      ),
                    );
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
