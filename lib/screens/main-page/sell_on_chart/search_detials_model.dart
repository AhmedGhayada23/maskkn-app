import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/network-services/favorite.dart';
import 'package:maskkn/screens/realEstate_all_details.dart';
import 'package:maskkn/screens/main-page/components/details_icons.dart';
import '../../../appConfig.dart';

class SearchDetialsModel extends StatefulWidget {
  SearchDetialsModel(
      {required this.userName,
      required this.avatar,
      required this.id,
      required this.buildingSize,
      required this.title,
      required this.price,
      required this.location,
      required this.type,
      required this.area,
      required this.viwes,
      required this.isFavorite,
      required this.url_3d,
      required this.bathrooms,
      required this.rooms,
      required this.virtualTour,
      required this.img});

  int? id;
  String? title;
  String? img;
  String? price;
  String? location;
  String? rooms;
  String bathrooms;
  String? area;
  String? buildingSize;
  bool? virtualTour;
  String? type;
  String? viwes;
  String? url_3d;
  bool isFavorite;
  String? userName;
  String? avatar;
  @override
  State<SearchDetialsModel> createState() => _SearchDetialsModelState();
}

class _SearchDetialsModelState extends State<SearchDetialsModel> {
  FavoriteApi favoriteFunctions = FavoriteApi();
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Res.lGrayColor2),
        boxShadow: [
          BoxShadow(blurRadius: 10, spreadRadius: 0.8, color: Colors.grey[200]!)
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => RealEstateAllDetails(id: widget.id!)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage(widget.img!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //https://mskkn.com/public/website-assets/images/logo.png
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
                            decoration: const BoxDecoration(color: Colors.red),
                            child: Text(
                              "${widget.type}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                                await favoriteFunctions.addFavorite(widget.id);
                              } else {
                                await favoriteFunctions
                                    .removeFavorite(widget.id);
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
                                text: widget.price.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                                children: [
                                  TextSpan(
                                      text: ' OMR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Res.SubTextFontSize,
                                          color: Colors.white),
                                      children: [])
                                ])),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.url_3d != "nothing")
                                Image.asset(
                                  "assets/icon/3d-model.png",
                                  color: Res.whiteColor,
                                  width: 25,
                                ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Res.whiteColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.viwes!,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.title!,
                style: TextStyle(
                    color: Res.blackColor, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Res.dGrayColor.withOpacity(0.8),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.8,
                            child: Text(
                              widget.location!,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.userName!,
                        style:
                            TextStyle(color: Res.dGrayColor.withOpacity(0.8)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(widget.avatar!),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DetialedIcon(
                      icon: Icons.bed,
                      size: 25,
                      number: widget.bathrooms.toString(),
                      unit: "",
                    ),
                  ),
                  Expanded(
                    child: DetialedIcon(
                      size: 25,
                      icon: Icons.bathtub_outlined,
                      number: widget.bathrooms.toString(),
                      unit: "",
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset('assets/icon/building_size.png',
                              width: 25,
                              color: Res.dGrayColor.withOpacity(0.8)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              widget.buildingSize.toString() + " " + "Sqm",
                              style: TextStyle(
                                  fontSize: Res.SubTextFontSize,
                                  color: Res.dGrayColor),
                            ),
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
                            widget.area.toString() + " " + "Sqm",
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
            ],
          ),
        ),
      ),
    );
  }
}
