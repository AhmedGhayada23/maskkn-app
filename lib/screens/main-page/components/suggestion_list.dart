import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';
import '../../../models/property_short_details.dart';
import '../allProperties.dart';
import '../property_short_detials.dart';

class SuggestedListItems extends StatefulWidget {
  SuggestedListItems(this.title, this.allProperties);
  String title;
  List<PropertyShortDetails> allProperties;
  @override
  State<SuggestedListItems> createState() => _SuggestedListItemsState();
}

class _SuggestedListItemsState extends State<SuggestedListItems> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;
    // if (widget.allProperties.length < 1) {
    //   return Center(
    //     child: CircularProgressIndicator(
    //       color: Res.kPrimaryColor,
    //       backgroundColor: Res.grey200,
    //     ),
    //   );
    // }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Res.SubTitleFontSize),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const AllProperties())));
                  },
                  child: Text(
                    localizations.seemore,
                    style: TextStyle(color: Res.kPrimaryColor),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.allProperties.length,
              itemBuilder: (context, index) => PropertyShortDetailsCard(
                    userName: widget.allProperties[index].user!.name,
                    avatar: widget.allProperties[index].user!.avatar,
                    isFavorite: false,
                    id: widget.allProperties[index].id,
                    buildingSize: widget.allProperties[index].buildingSize,
                    area: widget.allProperties[index].area,
                    title: localeCode == 'ar'
                        ? widget.allProperties[index].titleAr
                        : widget.allProperties[index].titleEn,
                    bathrooms: widget.allProperties[index].numberBathrooms,
                    img: widget.allProperties[index].medium,
                    price: widget.allProperties[index].salePrice,
                    virtualTour: false,
                    location: " ",
                    type: widget.allProperties[index].isRent == 1
                        ? localizations.rent
                        : localizations.sell,
                    rooms: widget.allProperties[index].numberRooms,
                    viwes: widget.allProperties[index].views,
                    url_3d: widget.allProperties[index].url3d,
                  )),
        )
      ],
    );
  }
}
