import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/models/property_off_plan.dart';
import 'package:maskkn/network-services/favorite.dart';
import 'package:maskkn/screens/main-page/sell_on_chart/details_off_plan.dart';
import 'package:maskkn/screens/realEstate_all_details.dart';
import '../../../appConfig.dart';
import '../../../models/chart_item.dart';

import '../../../AppIcons/icons.dart';
import '../components/details_icons.dart';

class SellChartCard extends StatefulWidget {
  SellChartCard(this.item, this.onTap, this.index, this.isFavorite, {Key? key})
      : super(key: key);
  PropertyOffPlanModel item;
  int index;
  bool isFavorite;
  Function()? onTap;

  @override
  State<SellChartCard> createState() => _SellChartCardState();
}

class _SellChartCardState extends State<SellChartCard> {
  bool addedToFavouriate = false;
  FavoriteApi favoriteFunctions = FavoriteApi();
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Res.lGrayColor),
        boxShadow: [
          BoxShadow(blurRadius: 10, spreadRadius: 0.8, color: Colors.grey[200]!)
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => DetailsOffPlan(id: widget.item.id!)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage(widget.item.medium!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 0),
                            decoration: BoxDecoration(color: Res.sPrimaryColor),
                            child: Text(
                              localizations.offplan,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: IconButton(
                            icon: widget.isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 25,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                            onPressed: () async {
                              setState(() {
                                widget.isFavorite = !widget.isFavorite;
                              });
                              if (widget.isFavorite) {
                                await favoriteFunctions
                                    .addFavorite(widget.item.id);
                              } else {
                                await favoriteFunctions
                                    .removeFavorite(widget.item.id);
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Res.kPrimaryColor,
                            ),
                            child: Text.rich(TextSpan(
                                text:
                                    "${widget.item.minPrice} - ${widget.item.maxPrice}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                                children: [
                                  TextSpan(
                                      text: localizations.oMR,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Res.SubTextFontSize,
                                          color: Colors.white),
                                      children: [])
                                ])),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 10, vertical: 10),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         Icon(
                      //           Icons.photo_library_outlined,
                      //           color: Res.whiteColor,
                      //           size: 20,
                      //         ),
                      //         const SizedBox(
                      //           width: 4,
                      //         ),
                      //         Text(
                      //           '',
                      //           style: TextStyle(color: Colors.white),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.item.titleAr.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Res.dGrayColor,
                  ),
                  Text(''),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "  " +
                        widget.item.buildingCompleted.toString() +
                        "% " +
                        localizations.completedPercent,
                    style: TextStyle(fontSize: Res.TextFontSize),
                  ),
                  Text(
                    widget.item.salePercentage.toString() +
                        "% " +
                        localizations.sale,
                    style: TextStyle(fontSize: Res.TextFontSize),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetialedIconOffPlan(
                    icon: CustomizedIcons.mskn_app_icon_building_size,
                    number: widget.item.typeCount.toString(),
                    subText: localizations.types,
                    iconSize: 35,
                  ),
                  DetialedIconOffPlan(
                    iconSize: 20,
                    icon: Icons.attach_money_rounded,
                    number: widget.item.financeMonths.toString(),
                    subText: localizations.monthFinance,
                  ),
                  DetialedIconOffPlan(
                    icon: CustomizedIcons.mskn_app_icon_land_size,
                    number: widget.item.square.toString(),
                    subText: "Sqm",
                    iconSize: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetialedIconOffPlan extends StatelessWidget {
  DetialedIconOffPlan(
      {required this.icon,
      required this.iconSize,
      required this.number,
      required this.subText});
  IconData icon;
  double iconSize;
  String number;
  String subText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(icon, color: Res.dGrayColor, size: iconSize),
          Text(
            number + " " + subText,
            style:
                TextStyle(fontSize: Res.SubTextFontSize, color: Res.dGrayColor),
          ),
        ],
      ),
    );
  }
}
