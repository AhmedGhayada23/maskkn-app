import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/models/property_request_types_model.dart';
import 'package:maskkn/network-services/property_request.dart';
import 'package:maskkn/providers/general_provider.dart';
import 'package:maskkn/screens/service-screens/request-property/request-property-main.dart';
import 'package:provider/provider.dart';
import '../../../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/property_request_type.dart';
import '../../../providers/request_property_provider.dart';

class RequestType extends StatefulWidget {
  const RequestType({Key? key}) : super(key: key);

  @override
  State<RequestType> createState() => _RequestTypeState();
}

class _RequestTypeState extends State<RequestType> {
  bool lodding = true;
  PropertyRequest propertyRequest = PropertyRequest();
  List<PropertyRequestTypesModel> propertyRequestTypesData = [];

  fetchData() async {
    var propertyRequestTypes = await propertyRequest.getPropertyType();
    setState(() {
      propertyRequestTypesData.addAll(propertyRequestTypes);
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
    final PRProvider =
        Provider.of<RequestPropertyProvider>(context, listen: false);
    List<PropertyRequestType> offers = PRProvider.getPROffers;
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
          localizations.requestproperty,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: lodding == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: ListView.builder(
                  itemCount: propertyRequestTypesData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: PropertyTypeWidget(
                              title: localeCode == 'ar'
                                  ? propertyRequestTypesData[index].titleAr!
                                  : propertyRequestTypesData[index].titleEn!,
                              subtitle: localeCode == 'ar'
                                  ? propertyRequestTypesData[index].tagLineAr!
                                  : propertyRequestTypesData[index].titleEn!,
                              description: localeCode == 'ar'
                                  ? propertyRequestTypesData[index]
                                      .descriptionAr!
                                  : propertyRequestTypesData[index]
                                      .descriptionEn!,
                              pathImg: propertyRequestTypesData[index]
                                  .small! /*Res.adawr*/,

                              ///TODO: change the image depend on the title
                              price: propertyRequestTypesData[index].price! == 0
                                  ? localizations.free
                                  : "${offers[index].price!}  OMR"),
                          onTap: () {
                            PRProvider.changerequestType(
                                propertyRequestTypesData[index].id!);
                            PRProvider.changePriceAdawer(
                                propertyRequestTypesData[index].price ?? 0);
                            PRProvider.changeNameAdawer(localeCode == 'ar'
                                ? propertyRequestTypesData[index].titleAr!
                                : propertyRequestTypesData[index].titleEn!);
                            PRProvider.changeImageAdawer(
                                propertyRequestTypesData[index].small!);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PropertyRequestMain(),
                            ));
                          },
                        ),
                      ],
                    );
                  })),
    );
  }
}

class PropertyTypeWidget extends StatelessWidget {
  PropertyTypeWidget(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.price,
      required this.pathImg});

  String title;
  String subtitle;
  String description;
  String price;
  String pathImg;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.90,
      height: height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Res.dGrayColor.withOpacity(0.6), width: 0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                pathImg,
                width: width * 0.4,
                height: height * 0.15,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                price,
                style: TextStyle(
                    color: Res.sPrimaryColor,
                    fontSize: Res.TextFontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: Res.SubTitleFontSize,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(subtitle),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width * 0.4,
                  child: Text(description),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
