import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/models/profile.dart';
import 'package:maskkn/network-services/profile.dart';
import 'package:maskkn/repositories/repositories.dart';
import 'package:maskkn/screens/service-screens/photography/payment.dart';
import '../../../appConfig.dart';

class ConfirmOrder extends StatefulWidget {
  ConfirmOrder(
      {required this.packageId,
      required this.price,
      required this.discount,
      required this.photography,
      required this.ads,
      required this.package});
  int packageId;
  String discount;
  String photography;
  double price;
  String ads;
  Widget package;

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  Profile? profile;

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
            widget.package, //orderedPackage(),
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
                      var thawaniRepository = const ThawaniRepository();

                      final payload = <String, dynamic>{
                        "client_reference_id": '123412',
                        "mode": "payment",
                        "products": [
                          {
                            "name": "Total",
                            "quantity": 1,
                            "unit_amount": (widget.price).toInt(),
                          }
                        ],
                        "success_url": 'https://mskn.om/',
                        "cancel_url": 'https://company.com/cancel',
                        "metadata": {
                          "order_id": widget.packageId,
                          "customer_email": profile?.email ?? '',
                          "customer_phone": profile?.phone ?? '',
                          "customer_name": profile?.name ?? '',
                        },
                      };

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentPackage(
                                type: 2,
                                thawaniRepository: thawaniRepository,
                                payload: payload,
                                packageId: widget.packageId,
                                onSuccess: () =>
                                    Navigator.of(context).pop(true),
                                onFailure: () =>
                                    Navigator.of(context).pop(false),
                              )));
                    })),
          ],
        ),
      )),
    );
  }
}

class orderedPackage extends StatelessWidget {
  orderedPackage(
      {required this.photography,
      required this.ads,
      required this.discount,
      required this.price,
      required this.id});
  int? id;
  String photography;
  String ads;
  String discount;
  String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200]!,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mask package",
                  style: const TextStyle(
                      fontSize: Res.SubTitleFontSize,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.campaign,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "$ads Ads",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.article,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "Property requires",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.collections_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      photography,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$discount% off",
                style: TextStyle(
                    fontSize: Res.SubTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Res.sPrimaryColor),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "$price OMR",
                style: TextStyle(
                    fontSize: Res.SubTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Res.kPrimaryColor),
              )
            ],
          )),
        ],
      ),
    );
  }
}
