import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/models/my_offer_model.dart';
import 'package:maskkn/network-services/my_offers.dart';
import 'package:maskkn/screens/details_myoffers/details_myoffer.dart';
import 'package:maskkn/screens/main-page/components/details_icons.dart';
import 'package:maskkn/screens/main-page/main-page.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyOffers extends StatefulWidget {
  const MyOffers({super.key});

  @override
  State<MyOffers> createState() => _MyOffersState();
}

class _MyOffersState extends State<MyOffers> {
  bool lodding = true;
  MyOfferApi myOfferApi = MyOfferApi();
  List<MyOfferModel> myOfferData = [];

  fetchData() async {
    var myOffer = await myOfferApi.getOffers();
    setState(() {
      myOfferData.addAll(myOffer);
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

    return Scaffold(
      backgroundColor: Res.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Res.blackColor,
          ),
        ),
        title: Text(localizations.myoffers),
        centerTitle: true,
        foregroundColor: Res.blackColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: lodding == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : myOfferData.isNotEmpty
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        // Row(
                        //   children: [
                        //     for (int i = 0; i < 3; i++)
                        //       Expanded(
                        //         child: InkWell(
                        //           borderRadius: BorderRadius.circular(10),
                        //           onTap: () {
                        //             setState(() {
                        //               currWidget = i;
                        //             });
                        //           },
                        //           child: Container(
                        //             height: 35,
                        //             padding: const EdgeInsets.symmetric(horizontal: 10),
                        //             margin: const EdgeInsets.symmetric(horizontal: 10),
                        //             decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 border: Border.all(
                        //                         color: currWidget != i
                        //                         ? Colors.grey[300]!
                        //                         : Colors.transparent),
                        //                 color: currWidget == i
                        //                     ? Res.kPrimaryColor
                        //                     : Colors.transparent),
                        //             child: Center(
                        //                 child: Text(
                        //                   i == 0
                        //                       ?localizations.previous
                        //                       : i == 1
                        //                       ? localizations.current
                        //                       : localizations.finished,
                        //                   style: TextStyle(
                        //                       color: currWidget == i
                        //                           ? Res.whiteColor
                        //                           : Res.dGrayColor),
                        //                 )),
                        //           ),
                        //         ),
                        //       ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsMyOffer(
                                                    id: myOfferData[index]
                                                        .id!)));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Res.whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 2,
                                              spreadRadius: 0.1,
                                              offset: Offset(0.0, 1)),
                                        ]),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 87,
                                              height: 62,
                                              decoration: BoxDecoration(
                                                  color: Res.kPrimaryColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight: localeCode ==
                                                            'ar'
                                                        ? Radius.circular(10)
                                                        : Radius.circular(0),
                                                    topRight: localeCode == 'ar'
                                                        ? Radius.circular(10)
                                                        : Radius.circular(0),
                                                    bottomLeft: localeCode ==
                                                            'en'
                                                        ? Radius.circular(10)
                                                        : Radius.circular(0),
                                                    topLeft: localeCode == 'en'
                                                        ? Radius.circular(10)
                                                        : Radius.circular(0),
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  myOfferData[index].type ==
                                                          'is_rent'
                                                      ? localeCode == 'ar'
                                                          ? 'ايجار'
                                                          : 'Rent'
                                                      : localeCode == 'ar'
                                                          ? 'بيع'
                                                          : 'Sell',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          Res.TitleFontSize,
                                                      color: Res.whiteColor),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            SizedBox(
                                              width: 250,
                                              child: Expanded(
                                                child: Text(
                                                  localeCode == 'ar'
                                                      ? myOfferData[index]
                                                              .descriptionAr ??
                                                          myOfferData[index]
                                                              .descriptionEn ??
                                                          '-'
                                                      : myOfferData[index]
                                                              .descriptionEn ??
                                                          myOfferData[index]
                                                              .descriptionAr ??
                                                          '-',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          Res.TitleFontSize,
                                                      color: Res.kPrimaryColor),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            PopupMenuButton(
                                                onSelected: (value) async {
                                                  var req = await MyOfferApi()
                                                      .deleteOffers(
                                                          myOfferData[index]
                                                              .id!);
                                                  var jsonData =
                                                      json.decode(req.body);

                                                  if (req.statusCode == 200) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              jsonData[
                                                                  'message'])),
                                                    );
                                                    setState(() {
                                                      myOfferData
                                                          .removeAt(index);
                                                    });
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              jsonData[
                                                                  'message'])),
                                                    );
                                                  }
                                                },
                                                itemBuilder: (context) => [
                                                      PopupMenuItem(
                                                        value: 'delete',
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              localeCode == 'ar'
                                                                  ? 'حذف'
                                                                  : 'Delete',
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                iconSize: 15),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Spacer(),
                                              Text(
                                                'OMR ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Res.TitleFontSize,
                                                    color: Res.kPrimaryColor),
                                              ),
                                              Text(
                                                '${myOfferData[index].priceLow ?? '0'} - ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Res.TitleFontSize,
                                                    color: Res.kPrimaryColor),
                                              ),
                                              Text(
                                                '${myOfferData[index].priceHigh ?? '0'}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Res.TitleFontSize,
                                                    color: Res.kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: DetialedIcon(
                                                  icon: Icons.bed,
                                                  size: 25,
                                                  number:
                                                      '${myOfferData[index].bedrooms ?? '0'}',
                                                  unit: "",
                                                ),
                                              ),
                                              Expanded(
                                                child: DetialedIcon(
                                                  size: 25,
                                                  icon: Icons.bathtub_outlined,
                                                  number:
                                                      '${myOfferData[index].bathrooms ?? '0'}',
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
                                                        color: Res.dGrayColor
                                                            .withOpacity(0.8),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '${myOfferData[index].buildingSize ?? '0'}' +
                                                            " " +
                                                            "Sqm",
                                                        style: TextStyle(
                                                            fontSize: Res
                                                                .SubTextFontSize,
                                                            color:
                                                                Res.dGrayColor),
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
                                                        color: Res.dGrayColor
                                                            .withOpacity(0.8),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '${myOfferData[index].landSize ?? '0'}' +
                                                            " " +
                                                            "Sqm",
                                                        style: TextStyle(
                                                            fontSize: Res
                                                                .SubTextFontSize,
                                                            color:
                                                                Res.dGrayColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 8,
                                ),
                            itemCount: myOfferData.length),

                        //widgets[currWidget]
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Text('NO Data'),
                ),
    );
  }
}

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 110,
              height: 35,
              child: DropdownButtonFormField<String>(
                items: ["Muscat", "Oman", "India"]
                    .map((e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (v) {},
                icon: const Icon(Icons.expand_more),
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(color: Colors.grey[300]!, width: 0.5)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(color: Colors.grey[300]!, width: 0.5))),
                value: "Muscat",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const MonthlyPackageWidget()
        ],
      ),
    );
  }
}

class MonthlyPackageWidget extends StatelessWidget {
  final bool isExtended;
  const MonthlyPackageWidget({super.key, this.isExtended = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Monthly 1st Free Trial",
                        style: TextStyle(
                            fontSize: Res.SubTitleFontSize,
                            fontWeight: FontWeight.bold,
                            color: Res.kPrimaryColor.withOpacity(0.3))),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(isExtended ? "Package Mskn Plus" : "Package Mskn",
                        style: const TextStyle(
                            fontSize: Res.SubTitleFontSize,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.campaign,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "20 Ads",
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
                      children: [
                        const Icon(
                          Icons.article,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "Property requires",
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
                      children: [
                        const Icon(
                          Icons.collections_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Expanded(
                          child: Text(
                            "2 Photography shot monthly",
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
                        const Icon(
                          Icons.schedule,
                          color: Colors.grey,
                          size: 10,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Expanded(
                          child: Text(
                            "11 minutes ago",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Res.SubTextFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isExtended) ...[
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.bar_chart_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Expanded(
                            child: Text(
                              "Appraisel",
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
                          const Icon(
                            Icons.store,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Expanded(
                            child: Text(
                              "Property Management",
                              style: TextStyle(
                                color: Colors.grey,
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
                    PopupMenuButton(itemBuilder: (context) => []),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      isExtended ? "50 OMR" : "20 OMR",
                      style: TextStyle(
                          fontSize: Res.SubTitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Res.kPrimaryColor),
                    )
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentWidget extends StatelessWidget {
  final bool isExtended;
  const CurrentWidget({super.key, this.isExtended = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75),
          builder: (context) => OrderSheet(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Monthly 1st Free Trial",
                          style: TextStyle(
                              fontSize: Res.SubTitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Res.kPrimaryColor.withOpacity(0.3))),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(isExtended ? "Package Mskn Plus" : "Package Mskn",
                          style: const TextStyle(
                              fontSize: Res.SubTitleFontSize,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.campaign,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "20 Ads",
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
                        children: [
                          const Icon(
                            Icons.article,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Property requires",
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
                        children: [
                          const Icon(
                            Icons.collections_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Expanded(
                            child: Text(
                              "2 Photography shot monthly",
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
                          const Expanded(
                            child: Text(
                              "9/29/22",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Res.SubTextFontSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (isExtended) ...[
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.bar_chart_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Expanded(
                              child: Text(
                                "Appraisel",
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
                            const Icon(
                              Icons.store,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Expanded(
                              child: Text(
                                "Property Management",
                                style: TextStyle(
                                  color: Colors.grey,
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
                      PopupMenuButton(itemBuilder: (context) => []),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        color: Res.kPrimaryColor,
                        width: 65,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            child: Text(
                              "18 Left",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Res.kPrimaryColor,
                        width: 65,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            child: Text(
                              "0",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Res.kPrimaryColor,
                        width: 65,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            child: Text(
                              "1 Left",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Request",
                            style: TextStyle(color: Res.kPrimaryColor),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Res.kPrimaryColor,
                            size: 18,
                          )
                        ],
                      )
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderSheet extends StatefulWidget {
  OrderSheet({super.key});

  @override
  State<OrderSheet> createState() => _OrderSheetState();
}

class _OrderSheetState extends State<OrderSheet> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Res.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.75,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                height: 4,
                width: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Package Mskn",
                    style: TextStyle(
                        fontSize: Res.SubTitleFontSize,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.campaign,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "20 Ads",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Res.grey200,
                              borderRadius: BorderRadius.circular(5)),
                          height: 25,
                          width: 25,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: const Center(
                                child: Icon(
                              Icons.remove,
                              size: 15,
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 3.0),
                          child: Text("5"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Res.kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          height: 25,
                          width: 25,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.article,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Property requires",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Res.grey200,
                              borderRadius: BorderRadius.circular(5)),
                          height: 25,
                          width: 25,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: const Center(
                                child: Icon(
                              Icons.remove,
                              size: 15,
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 3.0),
                          child: Text("5"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Res.kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          height: 25,
                          width: 25,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.collections_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Expanded(
                      child: Text(
                        "2 Photography shot monthly",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Res.grey200,
                              borderRadius: BorderRadius.circular(5)),
                          height: 25,
                          width: 25,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: const Center(
                                child: Icon(
                              Icons.remove,
                              size: 15,
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 3.0),
                          child: Text("5"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Res.kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          height: 25,
                          width: 25,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Select a date"),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 0.8,
                            color: Colors.grey[200]!)
                      ]),
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 1000)),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.month,
                    weekNumbersVisible: false,
                    pageAnimationEnabled: true,
                    headerStyle: const HeaderStyle(
                        formatButtonShowsNext: false,
                        formatButtonVisible: false),
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          isSelected = true;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: FadeInUp(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: const Center(
                            child: Text(
                          'Order',
                          style: TextStyle(fontSize: 17),
                        ))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
