import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/screens/realEstate_all_details.dart';
import '../../appConfig.dart';
import 'ads_details_widget.dart';

class myAdsDetails extends StatelessWidget {
  myAdsDetails({
    required this.typeOfAd,
    required this.title,
    required this.location,
    required this.imgPath,
    required this.price,
    required this.id,
    this.onSelected,
    //required this.date
  });
  String typeOfAd;
  String title;
  String imgPath;
  String location;
  String price;
  int id;
  Function(dynamic)? onSelected;
  // String date;

  var time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => RealEstateAllDetails(id: id)));
      },
      child: Container(
        //height: 145,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Res.whiteColor,
            boxShadow: [
              BoxShadow(color: Res.grey200!, spreadRadius: 0.8, blurRadius: 5)
            ]),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Image.network(
                  imgPath,
                  fit: BoxFit.cover,
                  height: 145,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  typeOfAd,
                                  style: TextStyle(color: Colors.red[800]),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Res.SubTitleFontSize),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.place_outlined,
                                color: Res.dGrayColor,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                location,
                                style: TextStyle(color: Res.dGrayColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${price} ${localizations.oMR}",
                            style: TextStyle(
                                color: Res.kPrimaryColor,
                                fontSize: Res.SubTitleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.schedule,
                          //       color: Res.dGrayColor,
                          //       size: 15,
                          //     ),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text(
                          //      date,
                          //       style: TextStyle(color: Res.dGrayColor),
                          //     )
                          //   ],
                          // ),
                        ]),
                  ),
                  Align(
                    alignment: localeCode == 'ar'
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: Res.blackColor,
                        ),
                        onSelected: onSelected,
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
                                      localeCode == 'ar' ? 'حذف' : 'Delete',
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      localeCode == 'ar' ? ' تعديل' : 'edit',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                        iconSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
