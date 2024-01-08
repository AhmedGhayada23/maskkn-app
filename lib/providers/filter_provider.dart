

import 'package:flutter/material.dart';


class FilterProvider extends ChangeNotifier {

  String listingType = "";  //zero for sell & one for rent
  String governorate= "";
  String wilaya= "";
  String sectorType= "";
  String propertyType= "";
  RangeValues price =RangeValues(0,0);
  double areaSize= 0;


//getters:

  String get getlistingType => listingType;
  String get getgovernorate => governorate;
  String get getwilaya => wilaya;
  String get getsectorType => sectorType;
  String get getpropertyType => propertyType;
  RangeValues get getPrice => price;
  double get getareaSize => areaSize;

  //requestType
//Setters:


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

  void changepropertyType(String val) {
    propertyType = val;
    notifyListeners();
  }

  void changeprice(RangeValues val) {
    price = val;
    notifyListeners();
  }
  void changeareaSize(double val) {
    areaSize = val;
    notifyListeners();
  }
}