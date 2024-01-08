import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/providers/list_property_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class UpdateLocation extends StatefulWidget {
  const UpdateLocation({super.key});

  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  CameraPosition? cameraPosition;

  GoogleMapController? mapController;

  Set<Marker> markers = {};

  double lat = 0.0, lng = 0.0;

  @override
  void initState() {
    getUserCurrentLocation();
    super.initState();
  }

  void getUserCurrentLocation() async {
    var status = await Permission.location.request();

    if (status == PermissionStatus.granted) {
      await Geolocator.getCurrentPosition().then((value) async {
        lat = value.latitude;
        lng = value.longitude;
      });
    } else {
      Res.showToast(
          'You need to allow location permission in order to continue');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ARProvider = Provider.of<ListPropertyProvider>(context);
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(lat, lng), zoom: 17),
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
        onTap: (argument) {
          setState(() {
            markers.clear(); // قم بإزالة العلامات الحالية إذا كانت موجودة
            markers.add(Marker(
              markerId: MarkerId('newMarker'),
              icon: BitmapDescriptor.defaultMarker,
              position: argument,
            ));
            print('loca :: ${argument.latitude}');
            ARProvider.changeLat(argument.latitude);
            ARProvider.changeLong(argument.longitude);
            Navigator.pop(context);
          });
        },
      ),
    );
  }
}
