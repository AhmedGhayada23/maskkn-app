import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maskkn/models/property_off_plan.dart';
import 'package:maskkn/network-services/maps_api.dart';
import 'package:maskkn/screens/service-screens/appraisal/find_appraisal.dart';
import 'package:maskkn/screens/main-page/components/search_field.dart';
import 'package:maskkn/screens/main-page/components/shadow_title.dart';
import 'package:maskkn/screens/main-page/components/suggestion_list.dart';
import '../../../appConfig.dart';
import '../../../models/chart_item.dart';
import '../../../models/item.dart';
import '../../../models/property_short_details.dart';
import '../../../network-services/real_estate.dart';
import '../../service-screens/add_property/add_property.dart';
import '../../service-screens/all_packges.dart';
import '../../service-screens/photography/photo-subscribtion.dart';
import '../../service-screens/property_managment/find_agent.dart';
import '../../service-screens/request-property/request-property-main.dart';
import '../../service-screens/request-property/request_type.dart';
import '../sell_on_chart/sell_onchart_list.dart';
import 'categories.dart';
import 'icon_grideview.dart';

/*
class RealEstateAdvertisement {
  int? id;
  String? titleEn;
  String? titleAr;
  String? url3d;
  String? url360;
  String? descriptionEn;
  String? descriptionAr;
  String? locationLong;
  String? locationLat;
  String? countryId;
  String? stateId;
  String? sectorId;
  String? sectorDetailId;
  String? area;
  String? parking;
  String? numberBathrooms;
  String? yearBuilt;
  String? numberRooms;
  String? cityId;
  String? numberBedrooms;
  String? numberBeds;
  String? buildingSize;
  String? videoUrl;
  String? landingSize;
  String? square;
  String? isFeatured;
  String? autoRenew;
  String? isSale;
  String? salePrice;
  String? isRent;
  String? rentPrice;
  String? neverExpired;
  String? rentPeriod;
  String? numberFloors;
  String? listingStatus;
  String? expireDate;
  String? userId;
  String? small;
  String? medium;
  String? createdTime;
  String? updatedTime;
  String? views;
  String? lastHourViews;

  RealEstateAdvertisement(
      {this.id,
        this.titleEn,
        this.titleAr,
        this.url3d,
        this.url360,
        this.descriptionEn,
        this.descriptionAr,
        this.locationLong,
        this.locationLat,
        this.countryId,
        this.stateId,
        this.sectorId,
        this.sectorDetailId,
        this.area,
        this.parking,
        this.numberBathrooms,
        this.yearBuilt,
        this.numberRooms,
        this.cityId,
        this.numberBedrooms,
        this.numberBeds,
        this.buildingSize,
        this.videoUrl,
        this.landingSize,
        this.square,
        this.isFeatured,
        this.autoRenew,
        this.isSale,
        this.salePrice,
        this.isRent,
        this.rentPrice,
        this.neverExpired,
        this.rentPeriod,
        this.numberFloors,
        this.listingStatus,
        this.expireDate,
        this.userId,
        this.small,
        this.medium,
        this.createdTime,
        this.updatedTime,
        this.views,
        this.lastHourViews});

  RealEstateAdvertisement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en']?? " ";
    titleAr = json['title_ar']?? " ";
    url3d = json['url_3d'] ?? " ";
    url360 = json['url_360']?? " ";
    descriptionEn = json['description_en']?? " ";
    descriptionAr = json['description_ar']?? " ";
    locationLong = json['location_long']??  "0";
    locationLat = json['location_lat']??  "0";
    countryId =json['country_id']??  "0";
    stateId = json['state_id']??  "0";
    sectorId = json['sector_id']??  "0";
    sectorDetailId = json['sector_detail_id']??  "0";
    area = json['area']??  "0";
    parking = json['parking'] ??  "0";
    numberBathrooms =  json['number_bathrooms']??  "0";
    yearBuilt = json['year_built']?? " ";
    numberRooms =json['number_rooms']??  "0";
    cityId =json['city_id']??  "0";
    numberBedrooms = json['number_bedrooms']??  "0";
    numberBeds = json['number_beds']??  "0";
    buildingSize = json['building_size']??  "0";
    videoUrl = json['video_url']?? " ";
    landingSize = json['landing_size']??  "0";
    square = json['square']??  "0";
    isFeatured = json['is_featured']??  "0";
    autoRenew = json['auto_renew']?? " ";
    isSale = json['is_sale']??  "0";
    salePrice = json['sale_price']?? "0";
    isRent = json['is_rent']?? "0";
    rentPrice =json['rent_price']??  "0";
    neverExpired = json['never_expired']?? " ";
    rentPeriod =json['rent_period'] ?? " ";
    numberFloors = json['number_floors']??  "0";
    listingStatus = json['listing_status']?? " ";
    expireDate = json['expire_date'];
    userId = json['user_id']??  "0";
    small = json['small'];
    medium = json['medium'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    views = json['views']??  "0";
    lastHourViews = json['last_hour_views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_en'] = this.titleEn;
    data['title_ar'] = this.titleAr;
    data['url_3d'] = this.url3d ;
    data['url_360'] = this.url360 ;
    data['description_en'] = this.descriptionEn ;
    data['description_ar'] = this.descriptionAr;
    data['location_long'] = this.locationLong ;
    data['location_lat'] = this.locationLat ;
    data['country_id'] = this.countryId ;
    data['state_id'] = this.stateId ;
    data['sector_id'] = this.sectorId ;
    data['sector_detail_id'] = this.sectorDetailId;
    data['area'] = this.area ;
    data['parking'] = this.parking ;
    data['number_bathrooms'] = this.numberBathrooms;
    data['year_built'] = this.yearBuilt;
    data['number_rooms'] = this.numberRooms;
    data['city_id'] = this.cityId ;
    data['number_bedrooms'] = this.numberBedrooms;
    data['number_beds'] = this.numberBeds;
    data['building_size'] = this.buildingSize;
    data['video_url'] = this.videoUrl;
    data['landing_size'] = this.landingSize;
    data['square'] = this.square;
    data['is_featured'] = this.isFeatured;
    data['auto_renew'] = this.autoRenew;
    data['is_sale'] = this.isSale;
    data['sale_price'] = this.salePrice;
    data['is_rent'] = this.isRent;
    data['rent_price'] = this.rentPrice;
    data['never_expired'] = this.neverExpired;
    data['rent_period'] = this.rentPeriod;
    data['number_floors'] = this.numberFloors;
    data['listing_status'] = this.listingStatus;
    data['expire_date'] = this.expireDate;
    data['user_id'] = this.userId;
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['views'] = this.views;
    data['last_hour_views'] = this.lastHourViews;
    return data;
  }
}*/
class MainBody extends StatefulWidget {
  MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  RealEstateApi realestates = RealEstateApi();
  MapsApi mapsApi = MapsApi();
  List<PropertyShortDetails> bestAppartments = [];
  List<PropertyShortDetails> bestVillas = [];

  List<PropertyOffPlanModel> offplan = [];

  fetchData() async {
    var appartments = await realestates.getbestApartments();
    var villas = await realestates.getbestVillas();
    var offplans = await mapsApi.getOffPlan(context);
    setState(() {
      bestAppartments.addAll(appartments);
      bestVillas.addAll(villas);
      offplan.addAll(offplans);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Res.background),
                    fit: BoxFit.cover,
                  ),
                ),
                height: height * 0.30,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    ShadowText(
                      localizations.findThousandReal,
                      style: const TextStyle(
                        fontSize: Res.TitleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0, 1),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: SearchFeild(),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: MainIcons(Res.propertyRequest_img,
                      localizations.requestproperty, RequestType())),
              SizedBox(
                height: height * 0.09,
                width: MediaQuery.of(context).size.width * 0.45,
                child: MainIcons(Res.camera_img, localizations.photography,
                    PhotographySubscription()),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: MainIcons(Res.camera_img,
                      localizations.propertyManagement, PropertyManagement())),
              SizedBox(
                  height: height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: MainIcons(Res.appriasal_img, localizations.appraisal,
                      FindAppraisal())),
              // SizedBox(
              //     height: height * 0.09,
              //     width: MediaQuery.of(context).size.width * 0.45,
              //     child: ElevatedButton.icon(
              //       style: ElevatedButton.styleFrom(
              //         foregroundColor: Res.lGrayColor,
              //         backgroundColor: Res.lGrayColor,
              //         elevation: 1,
              //       ),
              //       onPressed: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => FindAppraisal(),
              //         ));
              //       },
              //       icon: Image.asset(
              //         Res.appriasal_img,
              //         height: 50,
              //       ),
              //       label: Center(
              //         child: Text(
              //           localizations.appraisal,
              //           style: TextStyle(
              //             fontSize: Res.TextFontSize,
              //             fontWeight: FontWeight.bold,
              //             color: Res.blackColor,
              //           ),
              //         ),
              //       ),
              //     )),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          SellOnChartList(offplan),
          SuggestedListItems(localizations.bestApartment, bestAppartments),
          SuggestedListItems(localizations.bestVilla, bestVillas),
          Center(
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, right: 8, top: 10),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: const TextStyle(
                                  fontSize: Res.SubTitleFontSize,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: localizations.wannaSell),
                                  TextSpan(
                                      text: localizations.yourproperty,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Res.kPrimaryColor)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  localizations.listYourProperty,
                                  style: const TextStyle(
                                    fontSize: Res.SubTitleFontSize,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Res.kPrimaryColor),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AddProperty(),
                                        ));
                                      },
                                      child: Text(
                                        localizations.listproperty,
                                        style: TextStyle(
                                          fontSize: Res.SubTitleFontSize,
                                          color: Res.whiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        Res.houses_img,
                        height: height * 0.18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
