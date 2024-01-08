import 'package:flutter/material.dart';


class UserInfoProvider extends ChangeNotifier {

  int id = 1;
  String email =" ";
  String phone=" ";
  String name=" ";
  String token=" ";
  String role=" ";
  String photoUrl=" ";
  List ads = [];
  List favorite_items = [];
  Map services ={};
  List packages = [];

//getters:
  int get getid => id;

  String get getemail => email;

  String get getphone => phone;

  String get getname => name;

  String get gettoken => token;

  String get getrole => role;

  String get getphotoUrl => photoUrl;

  List get getads => ads;

  List get getfavorite_items => favorite_items;

  List get getpackages => packages;

  Map get getServices => services;


//Setters:
  void changeid(int val) {
    id = val;
    notifyListeners();
  }

  void changeemail(String val) {
    email = val;
    notifyListeners();
  }

  void changephone(String val) {
    phone = val;
    notifyListeners();
  }

  void changetokenType(String val) {
    token = val;
    notifyListeners();
  }

  void changename(String val) {
    name = val;
    notifyListeners();
  }

  void changerole(String val) {
    role = val;
    notifyListeners();
  }

  void changephotoUrl(String val) {
    photoUrl = val;
    notifyListeners();
  }

  void changeads(List val) {
    ads = val;
    notifyListeners();
  }

  void changefavorite_items(List val) {
    favorite_items = val;
    notifyListeners();
  }

  void changeservices(Map val) {
    services = val;
    notifyListeners();
  }

  void changepackages(List val) {
    packages = val;
    notifyListeners();
  }
}