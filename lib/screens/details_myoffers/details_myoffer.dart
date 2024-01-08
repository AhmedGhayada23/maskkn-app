import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/network-services/my_offers.dart';
import 'package:maskkn/screens/main-page/components/details_icons.dart';

class DetailsMyOffer extends StatefulWidget {
  int id;
  DetailsMyOffer({required this.id, super.key});

  @override
  State<DetailsMyOffer> createState() => _DetailsMyOfferState();
}

class _DetailsMyOfferState extends State<DetailsMyOffer> {
  MyOfferApi myOfferApi = MyOfferApi();
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      backgroundColor: Res.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Res.blackColor,
            )),
        backgroundColor: Res.whiteColor,
        centerTitle: true,
        title: Text(
          localeCode == 'ar'
              ? 'تفاصيل الطلب العقاري'
              : 'Details Property Request',
          style: TextStyle(
            color: Res.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: ListView(
          children: [
            FutureBuilder(
              future: myOfferApi.getPropertDetailsId(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            localeCode == 'ar'
                                ? 'حاجتي إلى تأجير عقار'
                                : 'Need property rent',
                            style: TextStyle(
                                color: Res.blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          Spacer(),
                          Text(
                            '${snapshot.data?.priceLow ?? '0'} - ${snapshot.data?.priceHigh ?? '0'} OMR',
                            style: TextStyle(
                                color: Res.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        localeCode == 'ar'
                            ? 'تفاصيل الطلب العقاري'
                            : 'Property Details',
                        style: TextStyle(
                            color: Res.kPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: DetialedIcon(
                              icon: Icons.bed,
                              size: 25,
                              number: '${snapshot.data?.bedrooms ?? '0'}',
                              unit: "",
                            ),
                          ),
                          Expanded(
                            child: DetialedIcon(
                              size: 25,
                              icon: Icons.bathtub_outlined,
                              number: '${snapshot.data?.bathrooms ?? '0'}',
                              unit: "",
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icon/building_size.png',
                                    width: 25,
                                    color: Res.dGrayColor.withOpacity(0.8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${snapshot.data?.buildingSize ?? '0'}' +
                                        " " +
                                        "Sqm",
                                    style: TextStyle(
                                        fontSize: Res.SubTextFontSize,
                                        color: Res.dGrayColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icon/area.png',
                                    width: 25,
                                    color: Res.dGrayColor.withOpacity(0.8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${snapshot.data?.landSize ?? '0'}' +
                                        " " +
                                        "Sqm",
                                    style: TextStyle(
                                        fontSize: Res.SubTextFontSize,
                                        color: Res.dGrayColor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localeCode == 'ar' ? 'الموقع' : 'Location',
                              style: TextStyle(
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Res.kPrimaryColor.withOpacity(0.2),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                localeCode == 'ar'
                                    ? snapshot.data!.state!.stateAr ?? '-'
                                    : snapshot.data!.state!.state ?? '-',
                                style: TextStyle(
                                    color: Res.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Res.kPrimaryColor.withOpacity(0.2),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                localeCode == 'ar'
                                    ? snapshot.data!.cities![0].cityAr ?? '-'
                                    : snapshot.data!.cities![0].city ?? '-',
                                style: TextStyle(
                                    color: Res.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                          )),
                          Divider(),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localeCode == 'ar' ? "سنة البناء" : 'Built Year',
                              style: TextStyle(
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '-',
                              style: TextStyle(
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localeCode == 'ar'
                                  ? "نوع العقار"
                                  : 'Property type',
                              style: TextStyle(
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${localeCode == 'ar' ? snapshot.data?.sector?.sectorAr ?? '-' : snapshot.data?.sector?.sectorEn ?? '-'} - ${localeCode == 'ar' ? snapshot.data?.sectorDetail?.nameAr ?? '-' : snapshot.data?.sectorDetail?.nameEn ?? '-'}',
                              style: TextStyle(
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        localeCode == 'ar' ? "الوصف" : 'Discription',
                        style: TextStyle(
                            color: Res.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        localeCode == 'ar'
                            ? snapshot.data?.descriptionAr ??
                                snapshot.data?.descriptionEn ??
                                '-'
                            : snapshot.data?.descriptionEn ??
                                snapshot.data?.descriptionAr ??
                                '-',
                        style: TextStyle(
                            color: Res.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  );
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
            )
          ],
        ),
      ),
    );
  }
}
