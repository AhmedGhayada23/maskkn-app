import 'package:flutter/material.dart';

import '../models/property_request_type.dart';

class RequestPropertyProvider extends ChangeNotifier {
  //get the property request offer tyepes from the api
  List<PropertyRequestType> PROffers = [];

  int? priceAdawer;
  String? imageAdawer;
  String? nameAdawer;

  int? requestType;
  String? listingType;
  String? governorate;
  String? wilaya;
  String? village;
  String? sectorType;
  String? propertyType;
  RangeValues price = RangeValues(0, 0);
  String? priceLow;
  String? pricehigh;
  String? sectorDetailSlug;
  int? bedrooms = 0;
  int? bathrooms = 0;
  String? builtYearfrom;
  String? builtYearTo;
  String? landSize;
  String? buildingSize;
  String? details;
  String? roomType;
  String? moreDetail;
  String? selectedPropertyType;

//getters:
  int? get getPriceAdawer => priceAdawer;
  String? get getimageAdawer => imageAdawer;
  String? get getNmaeAdawer => nameAdawer;
  int? get getrequestType => requestType;
  String? get getlistingType => listingType;
  String? get getroomType => roomType;
  String? get getgovernorate => governorate;
  String? get getwilaya => wilaya;
  String? get getsectorType => sectorType;
  String? get getdetails => details;
  String? get getpropertyType => propertyType;
  String? get getvillage => village;
  String? get getbuiltYearfrom => builtYearfrom;
  String? get getbuiltYearTo => builtYearTo;
  String? get getSelectedPropertyType => selectedPropertyType;
  int? get getbedrooms => bedrooms;
  int? get getbathrooms => bathrooms;
  RangeValues get getPrice => price;
  String? get getpriceLow => priceLow;
  String? get getpriceHigh => pricehigh;
  String? get getSectorDetailSlug => sectorDetailSlug;
  String? get getlandSize => landSize;
  String? get getbuildingSize => buildingSize;
  String? get getMoreDetail => moreDetail;
  List<PropertyRequestType> get getPROffers => PROffers;
  //requestType
//Setters:

  void changePriceAdawer(int val) {
    priceAdawer = val;
  }

  void changeImageAdawer(String val) {
    imageAdawer = val;
  }

  void changeNameAdawer(String val) {
    nameAdawer = val;
  }

  void changeSelectedPropertyType(String val) {
    selectedPropertyType = val;
  }

  void changePROffers(List<PropertyRequestType> val) {
    PROffers = val;
    notifyListeners();
  }

  void changerequestType(int val) {
    requestType = val;
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

  void changewilaya(String val) {
    wilaya = val;
    notifyListeners();
  }

  void changesectorType(String val) {
    sectorType = val;
    notifyListeners();
  }

  void changedetails(String val) {
    details = val;
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

  void changeRoomType(String val) {
    roomType = val;
    notifyListeners();
  }

  void changebuiltYearfrom(String val) {
    builtYearfrom = val;
    notifyListeners();
  }

  void changebuiltYearTo(String val) {
    builtYearTo = val;
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

  void changepriceLow(String val) {
    priceLow = val;
    notifyListeners();
  }

  void changepriceHigh(String val) {
    pricehigh = val;
    notifyListeners();
  }

  void changeSectorDetailSlug(String val) {
    sectorDetailSlug = val;
    notifyListeners();
  }

  void changelandSize(String val) {
    landSize = val;
    notifyListeners();
  }

  void changebuildingSize(String val) {
    buildingSize = val;
    notifyListeners();
  }

  void changeMoreDetail(String val) {
    moreDetail = val;
    notifyListeners();
  }
}
