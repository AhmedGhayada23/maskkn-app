import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../appConfig.dart';




class MapPage extends StatefulWidget {
  const MapPage();

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late Stream<QuerySnapshot> _realEstateInfo;
  final Completer<GoogleMapController> _mapController = Completer();

  @override
  void initState() {
    super.initState();
    _realEstateInfo = FirebaseFirestore.instance
        .collection('realEstates')
      //  .orderBy('name')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _realEstateInfo,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}}'));
          if (!snapshot.hasData) return Center(child: Text('Loading...'));

          return Column(
            children: [
              Flexible(
                flex: 2,
                child: StoreMap(
                  documents: (snapshot.data! as QuerySnapshot).docs,
                  initialPosition: const LatLng(21.694358, 56.765019),
                  mapController: _mapController,
                ),
              ),
              Flexible(
                  flex: 3,
                  child: StoreList(
                    documents: (snapshot.data! as QuerySnapshot).docs,
                    mapController: _mapController,
                  )),
            ],
          );
        },
      ),
    );
  }
}



class StoreMap extends StatelessWidget {
  const StoreMap({
     Key? key,
    required this.documents,
    required this.initialPosition,
    required this.mapController,
  }) : super(key: key);

  final List<DocumentSnapshot> documents;
  final LatLng initialPosition;
  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: initialPosition,
        zoom: 7,
      ),
      markers: documents
          .map((document) => Marker(
        markerId: MarkerId(document['title']),
      //  icon: BitmapDescriptor.defaultMarkerWithHue(_pinkHue),
        position: LatLng(
          document['Maplocation'].latitude,
          document['Maplocation'].longitude,
        ),
        infoWindow: InfoWindow(
          title: document['title'],
          snippet: document['category'],
        ),
      ))
          .toSet(),
      onMapCreated: (mapController) {
        this.mapController.complete(mapController);
      },
    );
  }
}

class StoreList extends StatelessWidget {
  const StoreList({
    Key? key,
    required this.documents,
    required this.mapController,
  }) : super(key: key);

  final List<DocumentSnapshot> documents;
  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (builder, index) {
        final document = documents[index];
        return Card(
          child: StoreListTile(
            document: document,
            mapController: mapController,
          ),
        );
      },
    );
  }
}

class StoreListTile extends StatefulWidget {
  const StoreListTile({
    Key? key,
    required this.document,
    required this.mapController,
  }) : super(key: key);

  final DocumentSnapshot document;
  final Completer<GoogleMapController> mapController;

  @override
  _StoreListTileState createState() => _StoreListTileState();
}

class _StoreListTileState extends State<StoreListTile> {
  String _placePhotoUrl = '';
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    //_retrievePlacesDetails();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.document['title']),
      subtitle: Text(widget.document['category']),
      leading: Container(
        child: _placePhotoUrl.isNotEmpty
            ? CircleAvatar(
          backgroundImage: NetworkImage(_placePhotoUrl),
        )
            : Container(),
        width: 60,
        height: 60,
      ),
      onTap: () async {
        final controller = await widget.mapController.future;
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                widget.document['Maplocation'].latitude,
                widget.document['Maplocation'].longitude,
              ),
              zoom: 16,
            ),
          ),
        );
      },
    );
  }
}