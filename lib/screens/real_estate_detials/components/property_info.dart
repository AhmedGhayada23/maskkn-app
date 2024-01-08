import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../appConfig.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main-page/components/details_icons.dart';

class PropertyInfo extends StatelessWidget {
   PropertyInfo({required this.avatar, required this.price, required this.description,
   required this.title, required this.location,required this.name,
   required this.buildingSize, required this.bathrooms, required this.areaSize,
   required this.bedrooms, required this.bedNum, required this.floors});

  String? title;
  int? price;
  String? avatar;
  String? location;
  String? name;
  String? description;
  int? bathrooms;
  int? bedrooms;
  int? areaSize;
  int? buildingSize;
  int? bedNum;
  int? floors;


  @override
  Widget build(BuildContext context) {

    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FadeInLeft(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      title!,
                      style:
                      TextStyle(fontSize: Res.SubTitleFontSize, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_outlined,color: Res.dGrayColor,),
                        const SizedBox(
                          width: 5,
                        ),
                       Text(
                          location!,
                          style: TextStyle(fontSize: Res.TextFontSize),
                        )
                      ],
                    )
                  ]),
            ),
            const Spacer(),
            FadeInRight(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$price OMR',
                      style: TextStyle(
                          fontSize: Res.SubTitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Res.kPrimaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Text(
                          name!,
                          style: TextStyle(fontSize: Res.TextFontSize),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(avatar!),
                        )
                      ],
                    )
                  ]),
            ),
          ]),
          const SizedBox(height: 10),
          const Divider(
            height: 2,
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(bedrooms != 0)
              Expanded(
                child: DetialedIcon(
                  icon: Icons.bedroom_parent_outlined,
                  size: 25,
                  number: bedrooms.toString(),
                  unit: "",
                ),
              ),
              if(bathrooms != 0)
              Expanded(
                child: DetialedIcon(
                  size: 25,
                  icon: Icons.bathtub_outlined,
                  number: bathrooms.toString(),
                  unit: "",
                ),
              ),
              if(buildingSize != 0)
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Image.asset('assets/icon/building_size.png',width: 25,color: Res.dGrayColor.withOpacity(0.8)),
                      SizedBox(width: 5,),
                      if(areaSize != 0)
                      Expanded(
                        flex: 1,
                        child: Text(areaSize.toString() + " "+ "Sqm", style: TextStyle(
                            fontSize: Res.SubTextFontSize,
                            color: Res.dGrayColor
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Container(
                child: Row(
                  children: [
                    Image.asset('assets/icon/area.png',width: 25,color: Res.dGrayColor.withOpacity(0.8) ,),
                    SizedBox(width: 5,),
                    Text( areaSize.toString() + " "+ "Sqm", style: TextStyle(
                        fontSize: Res.SubTextFontSize,
                        color: Res.dGrayColor
                    ),),
                  ],
                ),
              ),),
              if(bedNum != 0)
                Expanded(
                  child: DetialedIcon(
                    icon: Icons.bed_outlined,
                    size: 25,
                    number: bedNum.toString(),
                    unit: "",
                  ),
                ),
              if(floors != 0)
                Expanded(
                  child: DetialedIcon(
                    icon: Icons.stairs_outlined,
                    size: 25,
                    number: bedrooms.toString(),
                    unit: "",
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(localizations.description, style: TextStyle(
                  fontSize: Res.SubTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Res.kPrimaryColor),
              ),
            ],
          ),
         SizedBox(height: 5,),
         Row(
           children: [
             SizedBox(
               width: MediaQuery.of(context).size.width * 0.8,
                 child: Text(description!, textAlign: TextAlign.justify,)),
           ],
         ),


          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}


class PropertyDetails extends StatelessWidget {
  PropertyDetails({required this.type, required this.yearBuilt});

  String? type;
  int? yearBuilt;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          localizations.propertyDetails,
            style: TextStyle(
                fontSize: Res.SubTitleFontSize,
                fontWeight: FontWeight.bold,
                color: Res.kPrimaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(localizations.type),
                    const Spacer(),
                     Text(type!)
                  ],
                ),
                const Divider(),
               if(yearBuilt != 0)
                Row(
                  children: [
                    Text(localizations.yearb),
                    const Spacer(),
                     Text(yearBuilt.toString())],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}