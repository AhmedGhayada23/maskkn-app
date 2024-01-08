// TODO Implement this library.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maskkn/models/property_short_details.dart';
import 'package:maskkn/network-services/favorite.dart';
import 'package:maskkn/network-services/real_estate.dart';
import 'package:maskkn/screens/main-page/components/details_icons.dart';
import 'package:maskkn/screens/realEstate_all_details.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../appConfig.dart';

class GoogleMapCu extends StatefulWidget {
  const GoogleMapCu({super.key});

  @override
  State<GoogleMapCu> createState() => _MapState();
}

class _MapState extends State<GoogleMapCu> {
  RealEstateApi realEstates = RealEstateApi();
  bool isProcessing = true;
  List<PropertyShortDetails> propertiesList = [];

  /*Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }*/

  int _page = 0;

  final _controller = PageController(viewportFraction: 1.0);

  CameraPosition? cameraPosition;

  GoogleMapController? mapController;

  Set<Marker> markers = {};

  double? lat = 0.0, lng = 0.0;

  @override
  void initState() {
    getUserCurrentLocation();
    super.initState();
    print('test2');
  }

  void getUserCurrentLocation() async {
    var status = await Permission.location.request();

    if (status == PermissionStatus.granted) {
      await Geolocator.getCurrentPosition().then((value) async {
        lat = value.latitude;
        lng = value.longitude;
        fetchData();
      });
    } else {
      Res.showToast(
          'You need to allow location permission in order to continue');
    }
  }

  fetchData() async {
    var properties = await realEstates.getProperties(20, 1);
    propertiesList.addAll(properties);
    isProcessing = false;
    debugPrint("lat : $lat , lng : $lng");
    debugPrint("length is>> ${propertiesList.length}");
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId("myLocation"), position: LatLng(lat!, lng!)));
    setState(() {});
    addMarkers();
  }

  void addMarkers() async {
    for (int i = 0; i < propertiesList.length; i++) {
      String distance = await getDistance(
          double.parse(propertiesList[i].locationLat.toString()),
          double.parse(propertiesList[i].locationLong.toString()));
      markers.add(
        Marker(
            markerId: MarkerId(propertiesList[i].id.toString()),
            position: LatLng(
                double.parse(propertiesList[i].locationLat.toString()),
                double.parse(propertiesList[i].locationLong.toString())),
            icon: BitmapDescriptor.defaultMarker),
      );

      setState(() {});
    }
  }

  Widget createMarkerWidget(title, int i) {
    //"assets/icon/building.png"

    return IntrinsicHeight(
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          color: Res.kPrimaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            Image.asset(
                i % 2 == 0 ? "assets/icon/home.png" : "assets/icon/plot.png",
                height: 20,
                width: 20,
                color: Res.blackColor),
            const SizedBox(height: 5),
            Text(
              "${title}K",
              style: TextStyle(
                  color: Res.blackColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getDistance(double lat1, double lng1) async {
    var response = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$lat1,$lng1&destinations"
        "=$lat,$lng&key=${Res.googleMapsApiKey}"));
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    debugPrint("$jsonResponse");

    if (jsonResponse['rows'][0]['elements'][0]['distance'] == null) {
      return "0";
    }

    String data =
        jsonResponse['rows'][0]['elements'][0]['distance']['value'].toString();
    double distanceInKm = double.parse(data.replaceAll(",", "").split(' ')[0]) /
        1000; // * 1.60934

    return distanceInKm.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     color: Res.blackColor,
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 1,
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            if (isProcessing) const Center(child: CircularProgressIndicator()),
            if (!isProcessing)
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: LatLng(lat!, lng!), zoom: 17),
                markers: markers,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onMapCreated: (controller) {
                  //method called when map is created
                  setState(() {
                    mapController = controller;
                  });
                },
              
              ),
            if (!isProcessing)
              Positioned(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
                child: Container(
                  height: 190.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Res.whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (page) async {
                      _page = page;
                      debugPrint("$_page");
                      double lat = double.parse(
                          propertiesList[_page].locationLat.toString());
                      double lng = double.parse(
                          propertiesList[_page].locationLong.toString());
                      cameraPosition =
                          CameraPosition(target: LatLng(lat, lng), zoom: 17);

                      mapController!.animateCamera(
                          CameraUpdate.newCameraPosition(cameraPosition!));
                      //mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(currentLocation.latitude, currentLocation.longitude), 14));
                    },
                    children: [
                      for (int i = 0; i < propertiesList.length; i++)
                        ShowCardWidget(propertyDetails: propertiesList[i])
                    ],
                  ),
                ),
              ),
            Positioned(
              top: 10,
              left: -1,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Res.blackColor,
                ),
                color: Res.blackColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  RPSCustomPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var arrowPath = Path();
    arrowPath.moveTo((size.width + 40) / 2 - 15, size.height + 20);
    arrowPath.lineTo((size.width + 40) / 2, size.height + 40);
    arrowPath.lineTo((size.width + 40) / 2 + 15, size.height + 20);
    arrowPath.close();
    canvas.drawPath(
        arrowPath, Paint()..color = Res.kPrimaryColor.withOpacity(0.5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ShowCardWidget extends StatefulWidget {
  final PropertyShortDetails? propertyDetails;

  const ShowCardWidget({Key? key, this.propertyDetails}) : super(key: key);

  @override
  State<ShowCardWidget> createState() => _ShowCardWidgetState();
}

class _ShowCardWidgetState extends State<ShowCardWidget> {
  bool isFavorite = false;
  FavoriteApi favoriteFunctions = FavoriteApi();
  AppLocalizations? localizations;
  String? localeCode;

  @override
  Widget build(BuildContext context) {
    debugPrint('Map Name: ${widget.propertyDetails!.id}');
    // localizations = AppLocalizations.of(context)!;
    // localeCode = Localizations.localeOf(context).languageCode;
    return showCardWidget(widget.propertyDetails!);
  }

  showCardWidget(PropertyShortDetails propertyDetails) {
    return InkWell(
      onTap: () {
        print('id : ${propertyDetails.id}');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => RealEstateAllDetails(id: propertyDetails.id!)));
      },
      child: SizedBox(
        height: 190.0,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: [
                    Image.network(
                      propertyDetails.small!,
                      height: 170.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/building.png",
                            height: 190.0,
                            width: double.infinity,
                            fit: BoxFit.cover);
                      },
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: const BoxDecoration(color: Colors.red),
                          child: Text(
                            propertyDetails.isRent == 1 ? "Rent" : "Sell",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          if (isFavorite) {
                            await favoriteFunctions
                                .addFavorite(propertyDetails.id);
                          } else {
                            await favoriteFunctions
                                .removeFavorite(propertyDetails.id);
                          }
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Res.kPrimaryColor),
                          child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors
                                  .white), //  Icons.favorite: Icons.favorite_border,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5.0,
                      left: 10.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        child: Row(
                          children: const [
                            Icon(Icons.photo_library_outlined,
                                size: 15, color: Colors.white),
                            SizedBox(width: 5),
                            Icon(Icons.ondemand_video_outlined,
                                size: 15, color: Colors.white),
                            SizedBox(width: 5),
                            Text("7", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(propertyDetails.user!.name!,
                              textAlign: TextAlign.end,
                              style: const TextStyle(color: Colors.black)),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                            radius: 15,
                            backgroundImage:
                                NetworkImage(propertyDetails.user!.avatar!)),
                      ],
                    ),
                    Text(
                        localeCode == 'ar'
                            ? propertyDetails.titleAr.toString()
                            : propertyDetails.titleEn.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Res.dGrayColor.withOpacity(0.8), size: 15),
                        Text("Al Hail, Seeb, Muscat",
                            style: TextStyle(
                                color: Res.dGrayColor.withOpacity(0.8))),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DetialedIcon(
                              icon: Icons.bed_outlined,
                              size: 25,
                              number: propertyDetails.numberBedrooms.toString(),
                              unit: ""),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset('assets/icon/building_size.png',
                                  width: 25,
                                  color: Res.dGrayColor.withOpacity(0.8)),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "${propertyDetails.buildingSize.toString()} Sqm",
                                  style: TextStyle(
                                      fontSize: Res.SubTextFontSize,
                                      color: Res.dGrayColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DetialedIcon(
                              icon: Icons.bathtub_outlined,
                              size: 25,
                              number:
                                  propertyDetails.numberBathrooms.toString(),
                              unit: ""),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset('assets/icon/area.png',
                                  width: 25,
                                  color: Res.dGrayColor.withOpacity(0.8)),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "${propertyDetails.area.toString()} Sqm",
                                  style: TextStyle(
                                      fontSize: Res.SubTextFontSize,
                                      color: Res.dGrayColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text: propertyDetails.salePrice.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Res.kPrimaryColor),
                        children: [
                          TextSpan(
                            text: ' OMR',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Res.SubTextFontSize,
                                color: Res.kPrimaryColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
