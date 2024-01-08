

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'base_api.dart';


class StatApi extends BaseAPI{

   Future<List<String>> getAllStates(languageCode) async {

     var baseUrl =super.statsPath;
     List<String> statsList = [];
     for (int i = 1; i< 12; i++){
       http.Response response = await http.get(Uri.parse(baseUrl + i.toString()));
       if (response.statusCode == 200) {
         var jsonData = json.decode(response.body);
         Map data = jsonData['content']['data'];
         if (languageCode == 'ar'){
           statsList.add(data['state_ar']);
         }
         else{statsList.add(data['state']);}
       }
     }
     //print(statsList);
     return statsList;
   }


  Future<List<String>> getAllCites(languageCode) async {
    var baseUrl =super.citiesPath;
    http.Response response = await http.get(Uri.parse(baseUrl));
    List<String> citieslist = [];
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
       List data = jsonData['content']['data'];
      for (int i = 0; i< data.length; i++){
        if (languageCode == 'ar'){
          citieslist.add(data[i]['city_ar']);
        }
        else{citieslist.add(data[i]['city']);}
      }
      return citieslist;
    }
    return citieslist;
  }
}