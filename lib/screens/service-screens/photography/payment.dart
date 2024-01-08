import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/models/packages.dart';
import 'package:maskkn/network-services/packages.dart';
import 'package:maskkn/network-services/property_request.dart';
import 'package:maskkn/providers/request_property_provider.dart';
import 'package:maskkn/repositories/repositories.dart';
import 'package:maskkn/screens/main-page/filter_page.dart';
import 'package:maskkn/screens/main-page/main-page.dart';
import 'package:maskkn/screens/profile/my_adds.dart';
import 'package:maskkn/screens/profile/my_offers.dart';
import 'package:maskkn/screens/service-screens/done_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPackage extends StatefulWidget {
  final ThawaniRepository thawaniRepository;
  final Map<String, dynamic> payload;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;
  final int packageId;
  final int type;
  const PaymentPackage(
      {required this.thawaniRepository,
      required this.payload,
      required this.packageId,
      this.onSuccess,
      this.onFailure,
      required this.type,
      super.key});

  @override
  State<PaymentPackage> createState() => _PaymentPackageState();
}

class _PaymentPackageState extends State<PaymentPackage> {
  String _initialUrl = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    widget.thawaniRepository.createSession(payload: widget.payload).then(
      (url) {
        if (mounted) {
          setState(() {
            _initialUrl = url;
            _isLoading = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final PRProvider = Provider.of<RequestPropertyProvider>(context);
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Res.blackColor,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Payment method',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Res.blackColor,
          ),
        ),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0xffffffff))
          ..setNavigationDelegate(NavigationDelegate(
            onNavigationRequest: (request) {
              print('request :: $request');

              if (request.url.startsWith(widget.payload['success_url'])) {
                Navigator.pop(context);
                OverlayEntry overlayEntry;
                overlayEntry = OverlayEntry(
                    builder: (context) => doneWidget(
                          'Thank you for order',
                          Icons.thumb_up_outlined,
                        ));
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Overlay.of(context)!.insert(overlayEntry);
                  Timer(const Duration(milliseconds: 1500),
                      () => overlayEntry.remove());
                });

                if (widget.type == 1) {
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
                    propertyRequestTypeId: PRProvider.requestType.toString(),
                    sectorDetailSlug: PRProvider.sectorDetailSlug,
                    type: PRProvider.listingType,
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyOffers()),
                  );
                  PRProvider.changerequestType(0);
                } else if (widget.type == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  PackagesApi().paymentPackage(widget.packageId);
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  PackagesApi().PackageCheckout(100, widget.packageId, 10);
                }
              }
              return NavigationDecision.navigate;
            },
          ))
          ..loadRequest(Uri.parse(_initialUrl)),
      ),
    );
  }
}
