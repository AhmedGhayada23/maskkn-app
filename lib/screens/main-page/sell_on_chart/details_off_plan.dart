import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/AppIcons/icons.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/models/Features.dart';
import 'package:maskkn/models/property_full_details.dart';
import 'package:maskkn/models/property_off_plan.dart';
import 'package:maskkn/models/details_off_plan_model.dart';
import 'package:maskkn/network-services/favorite.dart';
import 'package:maskkn/network-services/features.dart';
import 'package:maskkn/network-services/my_offers.dart';
import 'package:maskkn/network-services/real_estate.dart';
import 'package:maskkn/providers/general_provider.dart';
import 'package:maskkn/screens/chat-screen/conversation-screen.dart';
import 'package:maskkn/screens/realEstate_all_details.dart';
import 'package:maskkn/screens/real_estate_detials/components/feature_section.dart';
import 'package:maskkn/screens/real_estate_detials/components/interior_carousel.dart';
import 'package:maskkn/screens/real_estate_detials/components/property_info.dart';
import 'package:maskkn/screens/real_estate_detials/components/realestate_location.dart';
import 'package:maskkn/screens/real_estate_detials/components/schedual_tour.dart';
import 'package:maskkn/screens/service-screens/property_managment/details_agent.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsOffPlan extends StatefulWidget {
  final int id;

  DetailsOffPlan({required this.id, super.key});

  @override
  State<DetailsOffPlan> createState() => _DetailsOffPlanState();
}

class _DetailsOffPlanState extends State<DetailsOffPlan> {
  MyOfferApi realEstate = MyOfferApi();
  FavoriteApi favoriteFunctions = FavoriteApi();
  bool isFavorite = false;
  List? sectorTypes;
  String? image, name, slug;
  List<FeaturesAll> featuresData = [];

  fetchDataSector() async {
    var features = await FeaturesApi().getFeatures();

    setState(() {
      featuresData.addAll(features);
    });
  }

  String getSectorTypeById(int id, String languageCode) {
    var type = sectorTypes!.firstWhere((obj) => obj.id == id, orElse: null);
    String typeName = type == null
        ? "non"
        : languageCode == 'ar'
            ? type.nameAr
            : type.nameEn;
    return typeName;
  }

  @override
  void initState() {
    final GProvider = Provider.of<GeneralProvider>(context, listen: false);
    sectorTypes = GProvider.sectorTypes;
    fetchDataSector();
    print('Id pro : ${widget.id}');
    //print(">>>>>>>>>>>>>" + getSectorTypeById(27,'en'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;
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
        elevation: 0,
        actions: [
          IconButton(
            icon: isFavorite
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 25,
                  ),
            onPressed: () async {
              setState(() {
                isFavorite = !isFavorite;
              });
              if (isFavorite) {
                await favoriteFunctions.addFavorite(widget.id);
              } else {
                await favoriteFunctions.removeFavorite(widget.id);
              }
            },
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () async {
                final imageUrl = image;
                final box = context.findRenderObject() as RenderBox?;
                // استبدل هذا بعنوان URL الفعلي للصورة
                Share.share('$name \n https://stg.mskkn.com/properties/$slug');
              },
              icon: Icon(
                Icons.share,
                color: Res.blackColor,
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<DetailsOffPlanModel>(
          future: realEstate.getPropertywithId(widget.id),
          builder: (BuildContext context,
              AsyncSnapshot<DetailsOffPlanModel> snapshot) {
            if (snapshot.hasData) {
              image = snapshot.data!.media![0].originalUrl;
              name = localeCode == 'ar'
                  ? snapshot.data?.titleAr
                  : snapshot.data?.titleEn;
              slug = snapshot.data?.slug;
              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InteriorCarouselOffPlan(assets: snapshot.data!.media!),
                      const SizedBox(
                        height: 10,
                      ),
                      PropertyInfo(
                        name: snapshot.data?.user?.name ?? '',
                        title: localeCode == 'ar'
                            ? snapshot.data?.titleAr ?? ''
                            : snapshot.data?.titleEn ?? '',
                        avatar: snapshot.data?.user?.avatar ?? '',
                        price: snapshot.data!.maxPrice ?? 0,
                        location: " ",
                        description: localeCode == 'ar'
                            ? snapshot.data?.descriptionAr ?? ''
                            : snapshot.data?.descriptionEn ?? '',
                        bathrooms: 0,
                        bedrooms: 0,
                        areaSize: 0,
                        buildingSize: snapshot.data?.buildingSize ?? 0,
                        bedNum: 0,
                        floors: 0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // // PropertyDetails(
                      // //   type: getSectorTypeById(
                      // //       snapshot.data?.sectorId ?? 0, localeCode),
                      // //   yearBuilt: snapshot.data?.yearBuilt ?? 0,
                      // // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          localizations.feature,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Res.kPrimaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            snapshot.data?.features?.length ?? 0,
                            (index) {
                              var featureName = featuresData.firstWhere(
                                  (element) =>
                                      snapshot.data?.features?[index].id ==
                                      element.id);
                              return FeatureSectionWidget(
                                icon: SizedBox(),
                                title: localeCode == 'ar'
                                    ? featureName.nameAr ?? ''
                                    : featureName.nameEn ?? '',
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          localeCode == 'ar'
                              ? "تفاصيل الشقة"
                              : 'Apartment Details',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Res.kPrimaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      ...List.generate(
                        snapshot.data!.offPlans!.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Res.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.2,
                                  )
                                ]),
                            child: Row(children: [
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 3 * 50,
                                          decoration: BoxDecoration(
                                              color: Res.chatGray2,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: MemoryImage(
                                                  base64.decode(snapshot
                                                      .data!
                                                      .offPlans![index]
                                                      .images![0]
                                                      .split('base64,')
                                                      .last),
                                                ),
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: List.generate(
                                              snapshot.data!.offPlans![index]
                                                      .images!.length -
                                                  1,
                                              (_) => Container(
                                                    height: 40,
                                                    width: 50,
                                                    margin: EdgeInsets.only(
                                                        bottom: 4),
                                                    decoration: BoxDecoration(
                                                        color: Res.grey200,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: MemoryImage(
                                                            base64.decode(snapshot
                                                                .data!
                                                                .offPlans![
                                                                    index]
                                                                .images![_]
                                                                .split(
                                                                    'base64,')
                                                                .last),
                                                          ),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            blurRadius: 0.5,
                                                            spreadRadius: 0.2,
                                                          )
                                                        ]),
                                                  )),
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    localeCode == 'ar'
                                        ? snapshot.data!.offPlans![index]
                                                .titleAr ??
                                            ''
                                        : snapshot.data!.offPlans![index]
                                                .titleEn ??
                                            '',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Res.kPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${snapshot.data?.offPlans?[index].numOfRooms ?? '0'} ${localeCode == 'ar' ? 'غرفة' : 'Room'}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Res.blackColor),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${snapshot.data?.offPlans?[index].price ?? '0'} OMR',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Res.kPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  if (snapshot
                                      .data!.offPlans![index].virtualTour!
                                      .startsWith('https'))
                                    Image.asset(
                                      "assets/icon/3d-model.png",
                                      color: Res.kPrimaryColor,
                                      width: 25,
                                    ),
                                  if (snapshot
                                      .data!.offPlans![index].virtualTour!
                                      .startsWith('https'))
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => VirtualTourPlay(
                                              url: snapshot.data!
                                                  .offPlans![index].virtualTour
                                                  .toString()),
                                        ));
                                      },
                                      child: Text(
                                        localizations.virtualTour,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Res.blackColor,
                                          decoration: TextDecoration
                                              .underline, // إضافة خط تحت النص
                                        ),
                                      ),
                                    )
                                ],
                              )),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LocationOfRealEstate(
                        id: snapshot.data!.id,
                        location: "state & city",
                        title: localeCode == 'ar'
                            ? snapshot.data!.titleAr
                            : snapshot.data!.titleEn,
                        lat: snapshot.data!.locationLat,
                        lan: snapshot.data!.locationLong,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      snapshot.data?.url3D == null
                          ? SizedBox()
                          : snapshot.data!.url3D!.startsWith('https')
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Text(
                                          //   localizations.virtualTour,
                                          //   style: TextStyle(
                                          //       fontSize: 17,
                                          //       fontWeight: FontWeight.bold,
                                          //       color: Res.kPrimaryColor),
                                          // ),
                                          Image.asset(
                                            "assets/icon/3d-model.png",
                                            color: Res.kPrimaryColor,
                                            width: 25,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      VirtualTourPlay(
                                                        url: snapshot
                                                                .data?.url3D ??
                                                            '',
                                                      )));
                                        },
                                        child: Container(
                                          height: 186,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .media![0]
                                                      .originalUrl!)),
                                              color: Res.grey200),
                                          child: Center(
                                            child: Icon(
                                              Icons.play_circle_outline,
                                              color: Res.whiteColor,
                                              size: 70,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),

                      // //VirtualTour(),

                      const SizedBox(
                        height: 10,
                      ),
                      ButtonArea(
                        id: snapshot.data!.id!,
                        name: snapshot.data?.user?.name ?? '',
                        urlImage: snapshot.data?.user?.avatar ?? '',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailsAgent(id: snapshot.data!.user!.id!),
                          ));
                        },
                        chatUserOnTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConversationScreen(
                                userId: snapshot.data!.user!.id!,
                                userName: snapshot.data!.user!.name!,
                                userImage: snapshot.data!.user!.avatar!,
                                //  chat: chatsMap[users[index]],
                              ),
                            )),
                      ),
                    ],
                  ));
            }

            if (snapshot.hasError) {
              print("error is >> ${snapshot.error}");
              print("error data >> ${snapshot.hasData}");
              return Center(
                  child: Icon(
                Icons.error,
                color: Colors.red,
                size: 82.0,
              ));
            }

            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  color: Res.kPrimaryColor,
                  backgroundColor: Res.grey200,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  localizations.loadingphrase,
                  style: TextStyle(color: Res.blackColor),
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}

class ButtonArea extends StatelessWidget {
  int id;
  String name, urlImage;
  final Function()? onTap;
  final Function()? chatUserOnTap;
  ButtonArea(
      {super.key,
      required this.id,
      required this.onTap,
      required this.name,
      required this.chatUserOnTap,
      required this.urlImage});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(urlImage),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: Res.TextFontSize),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: FadeInUp(
              child: ElevatedButton(
                  onPressed: () {
                    showBottomSheet(
                      backgroundColor: Res.kPrimaryColor,
                      context: context,
                      builder: (context) => ScheduleTourView(id: 1),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Res.kPrimaryColor),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          localizations.schedleTour,
                          style: TextStyle(fontSize: Res.TextFontSize),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: FadeInLeft(
                  child: Container(
                    height: 40,
                    child: OutlinedButton(
                        onPressed: chatUserOnTap,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side:
                                        BorderSide(color: Res.kPrimaryColor)))),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.chat_outlined,
                                  size: 25, color: Res.kPrimaryColor),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                localizations.chat,
                                style: TextStyle(color: Res.kPrimaryColor),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: FadeInRight(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Res.kPrimaryColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.phone,
                            size: 25,
                            color: Res.kPrimaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            localizations.call,
                            style: TextStyle(
                              fontSize: 17,
                              color: Res.kPrimaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class VirtualTourPlay extends StatefulWidget {
  String url;
  VirtualTourPlay({required this.url, super.key});

  @override
  State<VirtualTourPlay> createState() => _VirtualTourPlayState();
}

class _VirtualTourPlayState extends State<VirtualTourPlay> {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0xffffffff))
        ..setNavigationDelegate(NavigationDelegate())
        ..loadRequest(Uri.parse(widget.url)),
    );
  }
}
