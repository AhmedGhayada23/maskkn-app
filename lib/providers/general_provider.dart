
import 'package:flutter/material.dart';
import 'package:maskkn/models/general_details.dart';


class GeneralProvider extends ChangeNotifier {
  List<String> governorate =[
    'items 1',
    'items 2',
    'items 3',

  ];
  List<String>  willays=[];
  List<SectorType> sectorTypes = [];
  List<Feature> features = [];
  List<RoomType> roomTypes = [];


  List<String> get getGovernorates => governorate;
  List<String> get getWillayas => willays;

  List<SectorType> get getsectorTypes => sectorTypes;
  List<Feature> get getfeatures => features;
  List<RoomType> get getroomTypes => roomTypes;




 void changesectorTypes(List<SectorType> val ){
   sectorTypes = val;
   notifyListeners();
  }


  void changefeatures(List<Feature> val ){
    features = val;
    notifyListeners();
  }

  void changeroomTypes(List<RoomType> val ){
    roomTypes = val;
    notifyListeners();
  }

  void changegovernorate(List<String> val) {
    governorate = val;
    notifyListeners();
  }

  void changewillays(List<String> val) {
    willays = val;
    notifyListeners();
  }
}