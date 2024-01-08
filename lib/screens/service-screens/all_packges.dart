import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/screens/service-screens/photography/confirm_order.dart';
import '../../appConfig.dart';

class AvailablePhotoPackages extends StatefulWidget {
  const AvailablePhotoPackages({super.key});

  @override
  State<AvailablePhotoPackages> createState() => _AvailablePhotoPackagesState();
}

class _AvailablePhotoPackagesState extends State<AvailablePhotoPackages>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
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
          localizations.photography,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                localizations.choosePackage,
                style: TextStyle(
                    color: Colors.grey, fontSize: Res.SubTitleFontSize),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TabBar(
                  controller: tabController,
                  onTap: (v) {
                    setState(() {});
                  },
                  labelStyle: const TextStyle(color: Colors.blue),
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
                                  : Res.dGrayColor),
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
                                : Res.dGrayColor),
                      )),
                    ),
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Res.sPrimaryColor,
                  labelColor: Res.sPrimaryColor),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 2,

                ///TODO: find away to remove the extra space
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: double.maxFinite,
                child: TabBarView(controller: tabController, children: [
                  SingleChildScrollView(child: MonthlyPackage()),
                  SingleChildScrollView(child: MonthlyPackage()),
                ]),
              ),
            ),

            //MonthlyPackage()
          ],
        ),
      ),
    );
  }
}

class MonthlyPackage extends StatelessWidget {
  const MonthlyPackage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInLeft(child: MonthlyPackageWidget()),
        FadeInLeft(child: MonthlyPackageWidget(isExtended: true)),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            localizations.packagePhoto,
            style: TextStyle(
                fontSize: Res.SubTitleFontSize,
                fontWeight: FontWeight.bold,
                color: Res.kPrimaryColor),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        PhotoPackgeWidget(
          title: "photography packages",
          subTitle: "-20 Photography shot",
          price: '200',
          discont: '0',
          ads: '',
          packageId: 1,
        ),
        SizedBox(
          height: 10,
        ),
        PhotoPackgeWidget(
          title: "photography packages",
          subTitle: "-20 Photography shot",
          price: '200',
          discont: '0',
          ads: '',
          packageId: 1,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Res.kPrimaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      localizations.order,
                      style: TextStyle(
                          fontSize: Res.SubTitleFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {})),
        ),
      ],
    );
  }
}

class PhotoPackgeWidget extends StatelessWidget {
  PhotoPackgeWidget(
      {required this.packageId,
      required this.discont,
      required this.title,
      required this.subTitle,
      required this.ads,
      required this.price});
  String title;
  String subTitle;
  String price;
  String discont;
  int packageId;
  String ads;
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
                Text(
                  "$price ${localizations.oMR}",
                  style: TextStyle(
                      fontSize: Res.SubTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Res.kPrimaryColor),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(subTitle),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.photo,
                      color: Res.dGrayColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      localizations.photo,
                      style: TextStyle(color: Res.dGrayColor2),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.video_call,
                      color: Res.dGrayColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      localizations.video,
                      style: TextStyle(color: Res.dGrayColor2),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.view_agenda,
                      color: Res.dGrayColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "3D",
                      style: TextStyle(color: Res.dGrayColor2),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ConfirmOrder(
                              packageId: packageId,
                              price: double.parse(price),
                              discount: discont,
                              photography: subTitle,
                              ads: ads,
                              package: orderedPackage(
                                id: packageId,
                                photography: subTitle,
                                ads: ads,
                                discount: discont,
                                price: price,
                              ),
                            )));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Res.kPrimaryColor,
                    ),
                    child: Text(
                      localizations.order,
                      style: TextStyle(
                        color: Res.whiteColor,
                        fontSize: Res.SubTitleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // TextButton(
                //   child: Text(
                //     "${localizations.order} >>>",
                //     style: TextStyle(
                //       color: Res.sPrimaryColor,
                //       fontSize: Res.SubTitleFontSize,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => ConfirmOrder(
                //               packageId: packageId,
                //               price: double.parse(price),
                //               discount: discont,
                //               photography: subTitle,
                //               ads: ads,
                //               package: orderedPackage(
                //                 id: packageId,
                //                 photography: subTitle,
                //                 ads: ads,
                //                 discount: discont,
                //                 price: price,
                //               ),
                //             )));
                //   },
                // ),
                if (discont != '0')
                  Text(
                    "-% $discont",
                    style: TextStyle(
                        color: Res.sPrimaryColor, fontWeight: FontWeight.bold),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MonthlyPackageWidget extends StatelessWidget {
  final bool isExtended;
  const MonthlyPackageWidget({super.key, this.isExtended = false});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isExtended ? "Package Mskn Plus" : "Package Mskn",
                      style: TextStyle(
                          fontSize: Res.SubTitleFontSize,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.campaign,
                        color: Res.dGrayColor2,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "20 " + localizations.ads,
                        style: TextStyle(
                          color: Res.dGrayColor2,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.article,
                        color: Res.dGrayColor2,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          localizations.propertyREQ,
                          style: TextStyle(
                            color: Res.dGrayColor2,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.collections_outlined,
                        color: Res.dGrayColor2,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "2 Photography shot monthly",
                          style: TextStyle(
                            color: Res.dGrayColor2,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isExtended) ...[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bar_chart_outlined,
                          color: Res.dGrayColor2,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            localizations.appraisal,
                            style: TextStyle(
                              color: Res.dGrayColor2,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.store,
                          color: Res.dGrayColor2,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            localizations.propertyManagement,
                            style: TextStyle(
                              color: Res.dGrayColor2,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localizations.freeTrial,
                    style: TextStyle(
                        fontSize: Res.SubTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Res.kPrimaryColor),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    isExtended
                        ? "50 " + localizations.oMR
                        : "20 " + localizations.oMR,
                    style: TextStyle(
                        fontSize: Res.SubTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Res.kPrimaryColor),
                  )
                ],
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
