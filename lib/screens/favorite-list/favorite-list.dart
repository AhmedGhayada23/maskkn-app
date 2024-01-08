import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../network-services/favorite.dart';

import '../main-page/property_short_detials.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

FavoriteApi favoriteProperties = FavoriteApi();

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: favoriteProperties.getFavoriteProperties(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PropertyShortDetailsCard(
                              userName: snapshot.data![index].user.name,
                              avatar: snapshot.data![index].user.avatar,
                              isFavorite: true,
                              id: snapshot.data![index].id,
                              buildingSize:
                                  snapshot.data?[index].buildingSize ?? 0,
                              area: snapshot.data?[index].area ?? 0,
                              title: localeCode == 'ar'
                                  ? snapshot.data![index].titleAr
                                  : snapshot.data![index].titleEn,
                              bathrooms:
                                  snapshot.data?[index].numberBathrooms ?? 0,
                              img: snapshot.data?[index].medium ?? '',
                              price: snapshot.data?[index].salePrice ?? '',
                              virtualTour: false,
                              location: " ",
                              type: snapshot.data![index].isRent == 1
                                  ? localizations.rent
                                  : localizations.sell,
                              rooms: snapshot.data![index].numberRooms ?? 0,
                              viwes: snapshot.data?[index].views ?? '',
                              url_3d: snapshot.data?[index].url3d ?? '',
                            );
                          }),
                    ),
                  ),
                ],
              );
            }

            if (snapshot.hasError) {
              print("error is >> ${snapshot.error}");
              print("error data >> ${snapshot.hasData}");
              return Center(
                  child: Icon(
                Icons.error,
                color: Colors.red,
                size: 82.0,
              ));
            }

            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  height: 20.0,
                ),
                Text("Loading at the moment, please hold the line.")
              ],
            ));
          },
        ),
      ),
    );
  }
}
