import 'dart:io';

import 'package:flutter/material.dart';

class ListPropertyProvider extends ChangeNotifier {
  int id = 0;
  String sellAndRent = "";
  String listingType = ""; //zero for sell & one for rent
  String governorate = "";
  String propertyTitle = "";
  String wilaya = "";
  String village = "";
  String sectorType = "";
  String propertyType = "";
  String price = '';
  int bedrooms = 0;
  int bathrooms = 0;
  int builtYear = 0;
  String areaSize = '';
  String buildingSize = '';
  String description = "";
  String laundryRoom = "";
  String maidRoom = "";
  String location = "";
  String sectorDetailSlug = "";
  double lat = 0.0;
  double long = 0.0;
  List features = [];

  String tourLink = "";
  String url3d = "";
  List<File> photos = [];
  List<String> photosUrl = [];

  String landPlan = "";
  String buildingPlan = "";

//getters:
  int get getId => id;
  String get getSellAndRent => sellAndRent;
  String get getlistingType => listingType;
  String get getTourLink => tourLink;
  String get geturl3d => url3d;

  String get getlandPlan => landPlan;
  String get getbuildingPlan => buildingPlan;

  String get getgovernorate => governorate;
  String get getwilaya => wilaya;
  String get getsectorType => sectorType;
  String get getdescription => description;
  String get getpropertyType => propertyType;
  String get getvillage => village;
  int get getbuiltYear => builtYear;
  String get getlocation => location;
  int get getbedrooms => bedrooms;
  int get getbathrooms => bathrooms;
  String get getPrice => price;
  String get getareaSize => areaSize;
  String get getSectorDetailSlug => sectorDetailSlug;
  String get getbuildingSize => buildingSize;
  String get getlaundryRoom => laundryRoom;
  String get getmaidRoom => maidRoom;
  List get getfeatures => features;
  double get getLat => lat;
  double get getLong => long;
  List get getphotos => photos;
  List get getphotosUrl => photosUrl;

//Setters:

  void changeId(int val) {
    id = val;
    notifyListeners();
  }

  void changelistingSellAndRent(String val) {
    sellAndRent = val;
    notifyListeners();
  }

  void changeSectorDetailSlug(String val) {
    sectorDetailSlug = val;
    notifyListeners();
  }

  void changelistingType(String val) {
    listingType = val;
    notifyListeners();
  }

  void changegovernorate(String val) {
    governorate = val;
    notifyListeners();
  }

  void changelocation(String val) {
    location = val;
    notifyListeners();
  }

  void changewilaya(String val) {
    wilaya = val;
    notifyListeners();
  }

  void changesectorType(String val) {
    sectorType = val;
    notifyListeners();
  }

  void changedescription(String val) {
    description = val;
    notifyListeners();
  }

  void changepropertyType(String val) {
    propertyType = val;
    notifyListeners();
  }

  void changevillage(String val) {
    village = val;
    notifyListeners();
  }

  void changebuiltYear(int val) {
    builtYear = val;
    notifyListeners();
  }

  void changebedrooms(int val) {
    bedrooms = val;
    notifyListeners();
  }

  void changebathrooms(int val) {
    bathrooms = val;
    notifyListeners();
  }

  void changeprice(String val) {
    price = val;
    notifyListeners();
  }

  void changeareaSize(String val) {
    areaSize = val;
    notifyListeners();
  }

  void changebuildingSize(String val) {
    buildingSize = val;
    notifyListeners();
  }

  void changelaundryRoom(String val) {
    laundryRoom = val;
    notifyListeners();
  }

  void changemaidRoom(String val) {
    maidRoom = val;
    notifyListeners();
  }

  void changefeatures(List val) {
    features = val;
    notifyListeners();
  }

  void changetourLink(String val) {
    tourLink = val;
    notifyListeners();
  }

  void changeUrl3d(String val) {
    url3d = val;
    notifyListeners();
  }

  void changephotos(List<File> val) {
    photos = val;
    notifyListeners();
  }

  void changephotosUrl(List<String> val) {
    photosUrl = val;
    notifyListeners();
  }

  void changelandPlan(String val) {
    landPlan = val;
    notifyListeners();
  }

  void changebuildingPlan(String val) {
    buildingPlan = val;
    notifyListeners();
  }

  void changeLat(double val) {
    lat = val;
    notifyListeners();
  }

  void changeLong(double val) {
    long = val;
    notifyListeners();
  }

  void changepropertyTitle(String val) {
    propertyTitle = val;
    notifyListeners();
  }
}
