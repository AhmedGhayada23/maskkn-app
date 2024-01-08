import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/models/profile.dart';
import 'package:maskkn/network-services/profile.dart';
import 'package:maskkn/network-services/property_request.dart';
import 'package:maskkn/providers/request_property_provider.dart';
import 'package:maskkn/repositories/repositories.dart';
import 'package:maskkn/screens/profile/my_offers.dart';
import 'package:maskkn/screens/service-screens/photography/payment.dart';
import 'package:provider/provider.dart';
import '../../../appConfig.dart';

class ConfirmOrderRequestProperty extends StatefulWidget {
  ConfirmOrderRequestProperty({
    required this.packageId,
    required this.price,
    required this.discount,
    required this.photography,
    required this.ads,
  });
  int packageId;
  String discount;
  String photography;
  int price;
  String ads;
  //Widget package;

  @override
  State<ConfirmOrderRequestProperty> createState() =>
      _ConfirmOrderRequestPropertyState();
}

class _ConfirmOrderRequestPropertyState
    extends State<ConfirmOrderRequestProperty> {
  Profile? profile;
  TextEditingController promoCodeTextEditingController =
      TextEditingController();

  void _fetchProfileData() async {
    try {
      Profile profileData = await ProfileApi().getUserInfo();
      setState(() {
        profile = profileData;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    _fetchProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    final PRProvider = Provider.of<RequestPropertyProvider>(context);
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
          localizations.confirmOrder,
          style: TextStyle(
              //"Confirm Order"
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${localizations.date}:",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Res.SubTitleFontSize),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}",
                  style: const TextStyle(fontSize: Res.SubTitleFontSize),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 3,
            // ),
            // Divider(
            //   thickness: 0.5,
            //   color: Colors.grey[200]!,
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // Row(
            //   children: [
            //     Text(
            //       "${localizations.location}:",
            //       style: const TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: Res.SubTitleFontSize),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     const Text(
            //       "Al Mwailah Seeb, Muscat",
            //       style: TextStyle(fontSize: Res.SubTitleFontSize),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 3,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey[200]!,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "${localizations.price}:",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Res.SubTitleFontSize),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "${widget.price}  ${localizations.oMR}",
                  style: TextStyle(
                      fontSize: Res.SubTitleFontSize, color: Res.kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey[200]!,
            ),
            const SizedBox(
              height: 15,
            ),

            Text(
              "${localizations.order}:",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Res.SubTitleFontSize),
            ),

            const SizedBox(
              height: 10,
            ),
            //  package, //orderedPackage(),
            orderedPackage(
              price: PRProvider.priceAdawer!,
              iamge: PRProvider.imageAdawer!,
              name: PRProvider.nameAdawer!,
            ),
            SizedBox(
              height: 10,
            ),
            if (PRProvider.requestType != 1)
              Text(
                localeCode == 'ar' ? 'كود الخصم' : "Promo Code :",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Res.SubTitleFontSize),
              ),
            if (PRProvider.requestType != 1)
              SizedBox(
                height: 10,
              ),
            if (PRProvider.requestType != 1)
              TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  controller: promoCodeTextEditingController,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () async {
                        var req = await PropertyRequest().sentPromoCode(
                            promoCodeTextEditingController.text,
                            widget.price.toString());
                        var jsonData = json.decode(req.body);
                        if (req.statusCode == 200) {
                          setState(() {
                            widget.price = jsonData['content']['date']['price'];
                          });
                        } else {
                          print('data error :: ${jsonData}');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(jsonData['description'])),
                          );
                        }
                      },
                      child: Container(
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Res.kPrimaryColor,
                              Res.kPrimaryColor.withOpacity(0.6),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            localeCode == 'ar' ? 'تحقق' : "check",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Res.SubTitleFontSize,
                                color: Res.whiteColor),
                          ),
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Res.kPrimaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Res.kPrimaryColor,
                      ),
                    ),
                    border: InputBorder.none,
                    disabledBorder: null,
                    hintText: localeCode == 'ar' ? 'كود' : 'Code',
                    fillColor: Res.whiteColor,
                    filled: true,
                  )),
            const SizedBox(
              height: 40,
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
                      localizations.confirm,
                      style: const TextStyle(
                          fontSize: Res.SubTitleFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    if (PRProvider.requestType == 1) {
                      PropertyRequest().propertyRequestt(
                        sectorid: PRProvider.sectorType,
                        stateid: PRProvider.governorate,
                        cityid: PRProvider.wilaya,
                        priceLow: PRProvider.priceLow,
                        priceHigh: PRProvider.pricehigh,
                        bathrooms: PRProvider.bathrooms.toString(),
                        bedrooms: PRProvider.bedrooms.toString(),
                        builtYearFrom: PRProvider.builtYearfrom,
                        builtYearTo: PRProvider.builtYearTo,
                        buildingSize: PRProvider.buildingSize,
                        landSize: PRProvider.landSize,
                        moreDetails: PRProvider.moreDetail,
                        propertyRequestTypeId:
                            PRProvider.requestType.toString(),
                        sectorDetailSlug: PRProvider.sectorDetailSlug,
                        type: PRProvider.listingType,
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyOffers()),
                      );
                    } else {
                      final thawaniRepository = const ThawaniRepository();

                      final payload = <String, dynamic>{
                        "client_reference_id": '123412',
                        "mode": "payment",
                        "products": [
                          {
                            "name": "Total",
                            "quantity": 1,
                            "unit_amount": (widget.price * 1000).toInt(),
                          }
                        ],
                        "success_url": 'https://mskn.om/',
                        "cancel_url": 'https://company.com/cancel',
                        "metadata": {
                          "order_id": PRProvider.requestType,
                          "customer_email": profile?.email ?? '',
                          "customer_phone": profile?.phone ?? '',
                          "customer_name": profile?.name ?? '',
                        },
                      };

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentPackage(
                                type: 1,
                                thawaniRepository: thawaniRepository,
                                payload: payload,
                                packageId: widget.packageId,
                                onSuccess: () =>
                                    Navigator.of(context).pop(true),
                                onFailure: () =>
                                    Navigator.of(context).pop(false),
                              )));
                    }
                  }),
            ),
          ],
        ),
      )),
    );
  }
}

class orderedPackage extends StatelessWidget {
  final int price;
  final String iamge;
  final String name;
  orderedPackage({
    required this.price,
    required this.iamge,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200]!,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(children: [
        Container(
          child: Column(
            children: [
              Container(
                width: 83,
                height: 67,
                color: Res.grey200,
                child: Image.network(
                  iamge,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "$price OMR",
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: Res.SubTitleFontSize),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Res.SubTitleFontSize),
            ),
          ],
        ),
      ]),
    );
  }
}
