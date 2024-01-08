


import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../appConfig.dart';
import '../../map_screens/map.dart';

class LocationOfRealEstate extends StatelessWidget {
  LocationOfRealEstate({required this.lan, required this.lat,
  required this.id, required this.location, required this.title});
  String? lat;
  String? lan;
  int? id;
  String? title;
  String? location;
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                localizations.location,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Res.SubTitleFontSize,
                    color: Res.kPrimaryColor),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Res.grey200!),
                  borderRadius: BorderRadius.circular(5),
                ),
              //  padding: EdgeInsets.symmetric(horizontal: 1, vertical:1),
                child: Center(child: TextButton(
                  child: Text(localizations.exploreMap, style: TextStyle(color: Res.sPrimaryColor),),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: ((context) => GoogleMapCu())));
                  },)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              border: Border.all( color:Res.lGrayColor,)
              ),
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child:GoogleMap(
                  mapType: MapType.normal,
                  //onMapCreated: _onMapCreated,
                  initialCameraPosition:  CameraPosition(
                    target: LatLng(double.parse(lat!), double.parse(lan!)),
                    zoom: 7,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId(id.toString()),
                      position: LatLng(double.parse(lat!), double.parse(lan!)),
                      infoWindow: InfoWindow(title: title, snippet: location),
                    ),
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}