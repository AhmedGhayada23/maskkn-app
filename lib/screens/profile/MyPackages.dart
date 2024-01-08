import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maskkn/models/packages.dart';
import 'package:maskkn/network-services/packages.dart';
import 'package:maskkn/screens/profile/confirm_packages.dart';
import 'package:maskkn/screens/service-screens/photography/confirm_order.dart';

import '../../appConfig.dart';
import '../service-screens/all_packges.dart';

class MyPackages extends StatefulWidget {
  const MyPackages({Key? key}) : super(key: key);

  @override
  State<MyPackages> createState() => _MyPackagesState();
}

class _MyPackagesState extends State<MyPackages> with TickerProviderStateMixin {
  PackagesApi packagesApi = PackagesApi();
  List<Package> myPackageData = [];
  late TabController tabController = TabController(length: 2, vsync: this);
  fetchData() async {
    var myPackageDatas = await packagesApi.getAllPackages();

    setState(() {
      myPackageData.addAll(myPackageDatas);
      //   lodding = false;
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        // leading: Icon(Ico),
        title: Text(
          localizations.mypakges,
          style: TextStyle(
              //"Confirm Order"
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Text(
              localizations.choosePackage,
              style: TextStyle(
                  color: Res.dGrayColor, fontSize: Res.SubTitleFontSize),
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
              indicatorColor: Res.sPrimaryColor,
              controller: tabController,
              onTap: (v) {
                setState(() {});
              },
              labelStyle: TextStyle(color: Res.sPrimaryColor),
              tabs: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: Text(
                      localizations.monthly,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: tabController.index == 0
                              ? Res.kPrimaryColor
                              : Colors.grey),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                      child: Text(
                    localizations.annually,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: tabController.index == 1
                            ? Res.kPrimaryColor
                            : Colors.grey),
                  )),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Res.sPrimaryColor,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(controller: tabController, children: [
                ListView.separated(
                    itemBuilder: (context, index) => FadeInLeft(
                          child: PhotoPackge(
                            packageId: myPackageData[index].id!,
                            title: localeCode == 'ar'
                                ? myPackageData[index].nameAr
                                : myPackageData[index].nameEn,
                            photography: myPackageData[index]
                                        .numberOfPhotographyShots ==
                                    0
                                ? localeCode == 'ar'
                                    ? 'غير محدود لقطات تصوير'
                                    : 'Unlimited Shots'
                                : localeCode == 'ar'
                                    ? '${myPackageData[index].numberOfPhotographyShots} لقطات تصوير'
                                    : '${myPackageData[index].numberOfPhotographyShots} Shooting shots',
                            price: '${myPackageData[index].price / 1000}',
                            discont: myPackageData[index].discount.toString(),
                            appraisal: myPackageData[index].appraisal,
                            propertymanagement:
                                myPackageData[index].propertyManagement,
                            requestproperty:
                                myPackageData[index].propertyRequires,
                            ads: myPackageData[index].cunlimitedNumberOfAds == 0
                                ? localeCode == 'ar'
                                    ? 'إعلانات غير محدودة'
                                    : 'Unlimited Ads'
                                : localeCode == 'ar'
                                    ? '${myPackageData[index].cunlimitedNumberOfAds}أعلانات '
                                    : '${myPackageData[index].cunlimitedNumberOfAds} Ads',
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(),
                    itemCount: myPackageData.length),
                ListView.separated(
                    itemBuilder: (context, index) => FadeInLeft(
                          child: PhotoPackge(
                            packageId: myPackageData[index].id!,
                            title: localeCode == 'ar'
                                ? myPackageData[index].nameAr
                                : myPackageData[index].nameEn,
                            photography: myPackageData[index]
                                        .numberOfPhotographyShots ==
                                    0
                                ? localeCode == 'ar'
                                    ? 'غير محدود لقطات تصوير'
                                    : 'Unlimited Shots'
                                : localeCode == 'ar'
                                    ? '${myPackageData[index].numberOfPhotographyShots} لقطات تصوير'
                                    : '${myPackageData[index].numberOfPhotographyShots} Shooting shots',
                            price: '${myPackageData[index].price * 12 / 1000}',
                            discont:
                                myPackageData[index].discountAnnual.toString(),
                            appraisal: myPackageData[index].appraisal,
                            propertymanagement:
                                myPackageData[index].propertyManagement,
                            requestproperty:
                                myPackageData[index].propertyRequires,
                            ads: myPackageData[index].cunlimitedNumberOfAds == 0
                                ? localeCode == 'ar'
                                    ? 'إعلانات غير محدودة'
                                    : 'Unlimited Ads'
                                : localeCode == 'ar'
                                    ? '${myPackageData[index].cunlimitedNumberOfAds}أعلانات '
                                    : '${myPackageData[index].cunlimitedNumberOfAds} Ads',
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(),
                    itemCount: myPackageData.length),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoPackge extends StatelessWidget {
  PhotoPackge(
      {required this.packageId,
      required this.discont,
      required this.title,
      required this.photography,
      required this.ads,
      required this.price,
      required this.appraisal,
      required this.requestproperty,
      required this.propertymanagement});
  String title;
  String photography;
  String price;
  String discont;
  int packageId;
  String ads;
  int requestproperty;
  int appraisal;
  int propertymanagement;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(12),
        //  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, spreadRadius: 0.8, color: Colors.grey[200]!)
            ],
            color: Res.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Res.SubTitleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                if (discont != '0')
                  Text(
                    "-% $discont",
                    style: TextStyle(
                        color: Res.sPrimaryColor, fontWeight: FontWeight.bold),
                  )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Text(subTitle),

            Row(
              children: [
                SvgPicture.asset('assets/icon/ads.svg'),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ads,
                  style: TextStyle(color: Res.dGrayColor2),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if (requestproperty != 0)
              Row(
                children: [
                  Icon(
                    Icons.article,
                    color: Res.dGrayColor2,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    localizations.requestproperty,
                    style: TextStyle(color: Res.dGrayColor2),
                  ),
                ],
              ),

            SizedBox(
              height: 10,
            ),
            if (appraisal != 0)
              Row(
                children: [
                  SvgPicture.asset('assets/icon/appraisal.svg'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    localizations.appraisal,
                    style: TextStyle(color: Res.dGrayColor2),
                  ),
                ],
              ),
            SizedBox(
              height: 10,
            ),
            if (propertymanagement != 0)
              Row(
                children: [
                  SvgPicture.asset('assets/icon/property management.svg'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    localizations.propertyManagement,
                    style: TextStyle(color: Res.dGrayColor2),
                  ),
                ],
              ),
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                SvgPicture.asset('assets/icon/photography.svg'),
                SizedBox(
                  width: 5,
                ),
                Text(
                  photography,
                  style: TextStyle(color: Res.dGrayColor2),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    "${localizations.order} >>>",
                    style: TextStyle(
                      color: Res.sPrimaryColor,
                      fontSize: Res.SubTitleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ConfirmPakages(
                              packageId: packageId,
                              price: double.parse(price),
                              discount: discont,
                              photography: photography,
                              ads: ads,
                              package: OrderedPackage(
                                id: packageId,
                                photography: photography,
                                ads: ads,
                                discount: discont,
                                price: price,
                                appraisal: appraisal,
                                propertyManagementl: propertymanagement,
                                propertyRequies: requestproperty,
                                title: title,
                              ),
                            )));
                  },
                ),
                Text(
                  "$price ${localizations.oMR}",
                  style: TextStyle(
                      fontSize: Res.SubTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Res.kPrimaryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
