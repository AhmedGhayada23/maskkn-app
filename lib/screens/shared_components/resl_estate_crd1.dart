import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../models/item.dart';
import '../../AppIcons/icons2_icons.dart';
import '../main-page/components/details_icons.dart';
import '../../AppIcons/icons.dart';

class RealEstateCard extends StatefulWidget {
  final int index;
  final Item item;
  final Function()? onTap;
  const RealEstateCard(this.item, this.onTap, this.index, {Key? key})
      : super(key: key);

  @override
  State<RealEstateCard> createState() => _RealEstateCardState();
}

class _RealEstateCardState extends State<RealEstateCard> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(blurRadius: 10, spreadRadius: 0.8, color: Res.grey200!)
          ],
          color: Res.whiteColor),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: 'image_${widget.index} ',
                      child: Image.asset(
                        Res.interior_1,
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        decoration: BoxDecoration(color: Colors.red),
                        child: Text(
                          localizations.sell,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Res.kPrimaryColor.withOpacity(0.5)),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            size: 25,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Res.kPrimaryColor),
                        child: Text.rich(TextSpan(
                            text: '55',
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
                              )
                            ])),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Res.threeDimIcPng,
                            color: Colors.white,
                            height: 17,
                            width: 17,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.image_outlined,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '7',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Eva Hostels',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      Spacer(),
                      Text(
                        'MSKN',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 15,
                        backgroundImage: AssetImage(Res.logo),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons2.location,
                        color: Res.grey200,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Muscat, Seeb',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons2.bed,
                            size: 18,
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            '1',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DetialedIcon(
                            size: 35,
                            icon: CustomizedIcons.mskn_app_icon_bed,
                            number: widget.item.bathroom_num.toString(),
                            unit: "",
                          ),
                          DetialedIcon(
                            size: 35,
                            icon: CustomizedIcons.mskn_app_icon_bathroom,
                            number: widget.item.room_num.toString(),
                            unit: "",
                          ),
                          DetialedIcon(
                            size: 35,
                            icon: CustomizedIcons.mskn_app_icon_land_size,
                            number: widget.item.building_space.toString(),
                            unit: "Sqm",
                          ),
                          DetialedIcon(
                            size: 35,
                            icon: CustomizedIcons.mskn_app_icon_building_size,
                            number: widget.item.land_space.toString(),
                            unit: "Sqm",
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
        onTap: () {
          /* Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ScreenOne(),
                    ));*/
        },
      ),
    );
  }
}
