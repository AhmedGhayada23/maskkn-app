import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/models/my_ads_model.dart';
import 'package:maskkn/network-services/my_ads.dart';
import 'package:maskkn/providers/list_property_provider.dart';
import 'package:maskkn/screens/updete_ads/update_property.dart';
import 'package:provider/provider.dart';
import '../../appConfig.dart';
import 'ads_details_widget.dart';

class MyAds extends StatefulWidget {
  const MyAds({super.key});

  @override
  State<MyAds> createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  bool lodding = true;
  AdsApi adsApi = AdsApi();
  List<MyAdsModel> MyAdsData = [];
  fetchData() async {
    var MyAdsDatas = await adsApi.getMyAds();

    setState(() {
      MyAdsData.addAll(MyAdsDatas);
      lodding = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;
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
        actions: const [
          Icon(Icons.add),
        ],
        // leading: Icon(Ico),
        title: Text(
          localizations.myadds,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: lodding == true
          ? Center(child: CircularProgressIndicator())
          : MyAdsData.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Res.kPrimaryColor),
                    //         borderRadius: BorderRadius.circular(10)),
                    //     margin: EdgeInsets.symmetric(horizontal: 10),
                    //     child: DefaultTabController(
                    //         length: 2,
                    //         child: TabBar(
                    //           unselectedLabelColor: Res.kPrimaryColor,
                    //           labelColor: Colors.white,
                    //           indicator: BoxDecoration(
                    //               borderRadius:
                    //                   BorderRadius.circular(5), // Creates border
                    //               color: Res.kPrimaryColor),
                    //           tabs: [
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(5)),
                    //               height: 40,
                    //               child: Center(
                    //                   child: Text(
                    //                 localizations.current,
                    //                 style: TextStyle(fontSize: Res.TitleFontSize - 2),
                    //               )),
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(5)),
                    //               height: 40,
                    //               child: Center(
                    //                   child: Text(
                    //                 localizations.previous,
                    //                 style: TextStyle(fontSize: Res.TitleFontSize - 2),
                    //               )),
                    //             ),
                    //           ],
                    //         )),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Container(
                    //     width: 90,
                    //     margin: EdgeInsets.symmetric(horizontal: 10),
                    //     child: DropdownButtonFormField<String>(
                    //       items:
                    //           [localizations.all, localizations.rent, localizations.sell]
                    //               .map((e) => DropdownMenuItem<String>(
                    //                     child: Text(e),
                    //                     value: e,
                    //                   ))
                    //               .toList(),
                    //       onChanged: (v) {},
                    //       icon: Icon(Icons.expand_more),
                    //       decoration: InputDecoration(
                    //           contentPadding:
                    //               EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    //           enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //               borderSide:
                    //                   BorderSide(color: Colors.grey[300]!, width: 0.5)),
                    //           border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //               borderSide:
                    //                   BorderSide(color: Colors.grey[300]!, width: 0.5)),
                    //           focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //               borderSide:
                    //                   BorderSide(color: Colors.grey[300]!, width: 0.5))),
                    //       value: localizations.all,
                    //     ),
                    //   ),
                    // ),

                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => myAdsDetails(
                              id: MyAdsData[index].id!,
                              title: localeCode == 'ar'
                                  ? MyAdsData[index].titleAr ?? ''
                                  : MyAdsData[index].titleEn ?? '',
                              typeOfAd: MyAdsData[index].isRent == 1
                                  ? localizations.rent
                                  : localizations.sell,
                              imgPath: MyAdsData[index].medium != ''
                                  ? MyAdsData[index].medium.toString()
                                  : 'https://www.hueofbluephotography.com/wp-content/uploads/pp/images/no-image-300x300.jpg',
                              location: "",
                              // date: MyAdsData[index].expireDate ?? '',
                              price: MyAdsData[index].isRent == 1
                                  ? "${MyAdsData[index].rentPrice ?? ''}"
                                  : "${MyAdsData[index].salePrice ?? ''}",
                              onSelected: (value) async {
                                if (value == 'delete') {
                                  var req = await adsApi
                                      .deleteAds(MyAdsData[index].id!);
                                  var jsonData = json.decode(req.body);

                                  if (req.statusCode == 200) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(jsonData['description'])),
                                    );
                                    setState(() {
                                      MyAdsData.removeAt(index);
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(jsonData['description'])),
                                    );
                                  }
                                  // adsApi.deleteAds(MyAdsData[index].id!);
                                } else {
                                  ARProvider.changeId(MyAdsData[index].id!);
                                  ARProvider.changepropertyTitle(localeCode ==
                                          'ar'
                                      ? MyAdsData[index].titleAr.toString()
                                      : MyAdsData[index].titleEn.toString());
                                  ARProvider.changedescription(
                                      localeCode == 'ar'
                                          ? MyAdsData[index]
                                              .descriptionAr
                                              .toString()
                                          : MyAdsData[index]
                                              .descriptionEn
                                              .toString());
                                  ARProvider.changelistingSellAndRent(
                                      MyAdsData[index].isRent.toString());
                                  ARProvider.changepropertyType(
                                      MyAdsData[index].sectorId.toString());
                                  ARProvider.changesectorType(MyAdsData[index]
                                      .sectorDetailId
                                      .toString());
                                  ARProvider.changeprice(
                                    MyAdsData[index].isRent == 1
                                        ? MyAdsData[index].rentPrice.toString()
                                        : MyAdsData[index].salePrice.toString(),
                                  );
                                  ARProvider.changeareaSize(
                                      MyAdsData[index].landingSize.toString());
                                  ARProvider.changebuildingSize(
                                      MyAdsData[index].buildingSize.toString());
                                  ARProvider.changebedrooms(
                                      MyAdsData[index].numberBedrooms ?? 0);
                                  ARProvider.changebathrooms(
                                      MyAdsData[index].numberBathrooms ?? 0);
                                  ARProvider.changebuiltYear(
                                      MyAdsData[index].yearBuilt ?? 0);
                                  ARProvider.changemaidRoom(
                                      MyAdsData[index].maidRoom ?? '0');
                                  ARProvider.changelaundryRoom(
                                      MyAdsData[index].laundryRoom ?? '0');
                                  List<Features> featuresList =
                                      MyAdsData[index].features ?? [];
                                  List<String> features = featuresList
                                      .map((element) => element.id.toString())
                                      .toList();
                                  ARProvider.changegovernorate(
                                      MyAdsData[index].stateId.toString());
                                  ARProvider.changewilaya(
                                      MyAdsData[index].cityId.toString());
                                  ARProvider.changelaundryRoom(
                                      MyAdsData[index].laundryRoom ?? '0');
                                  ARProvider.changetourLink(
                                      MyAdsData[index].url3D ?? '');
                                  ARProvider.changefeatures(features);
                                  List<Media1> photoUrlList =
                                      MyAdsData[index].media ?? [];
                                  List<String> photoUrl = photoUrlList
                                      .map((element) =>
                                          element.originalUrl.toString())
                                      .toList();
                                  ARProvider.changephotosUrl(photoUrl);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => UpdateProperty(
                                          id: MyAdsData[index].sectorId!),
                                    ),
                                  );
                                }
                              },
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 8,
                            ),
                        itemCount: MyAdsData.length),
                  ]),
                )
              : Center(
                  child: Text(
                    'No Ads',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: Res.SubTitleFontSize,
                        fontWeight: FontWeight.w500),
                  ),
                ),
    );
  }
}
