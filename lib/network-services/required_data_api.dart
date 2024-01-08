/*this file will contain all reqired data for the app
* it will run at the main page to fast the process*/

import 'dart:convert';
import 'dart:io';
import 'package:maskkn/network-services/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../models/general_details.dart';
import '../screens/authorization_screens/storage.dart';

class RequairedData extends BaseAPI{

  //get sector details
  Future<List<SectorType>> getSectorDetails() async {
    String filename = "sectorsDetails.json";
    var dir = await getTemporaryDirectory();
    Duration cacheDuration = Duration(days: 30); // set cache duration to 1 day

    File file = File(dir.path + "/"+ filename );

    if(file.existsSync()&& file.lastModifiedSync().isAfter(DateTime.now().subtract(cacheDuration))){
      // file exists and is not expired, read from cache
      print(">>>>>> reading sector detilas from the file");
      //read from cache
      var filedata = jsonDecode(file.readAsStringSync());
      List data = filedata['content']['data'];
      return data.map((json) => SectorType.fromJson(json)).toList();
    }else{
      if (file.existsSync()) {
        // delete expired file
        file.deleteSync();
      }

      var baseUrl = super.sectorDetails;
      http.Response response = await http.get(
          Uri.parse(baseUrl), headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json'});

      if (response.statusCode == 200) {
        print(">>>>>>fetching from api");
        //saving to json cache
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
        var jsonData = json.decode(response.body);
        List data = jsonData['content']['data'];
        return data.map((json) => SectorType.fromJson(json)).toList();
      }else{
        throw Exception(">> sth wrong, ${response.statusCode}");
      }
    }

  }

 //get the room types
  Future<List<RoomType>> getRoomTypes() async {
    String filename = "RoomTypes.json";
    var dir = await getTemporaryDirectory();
    Duration cacheDuration = Duration(days: 30); // set cache duration to 30 day
    File file = File(dir.path + "/" + filename);

    if (file.existsSync() && file.lastModifiedSync().isAfter(
        DateTime.now().subtract(cacheDuration))) {
      // file exists and is not expired, read from cache
      print(">>>>>> reading room types from the file");
      //read from cache
      var filedata = jsonDecode(file.readAsStringSync());
      List data = filedata['content']['data'];
      return data.map((json) => RoomType.fromJson(json)).toList();
    } else {
      if (file.existsSync()) {
        // delete expired file
        file.deleteSync();
      }

      var baseUrl = super.roomTypes;
      http.Response response = await http.get(
          Uri.parse(baseUrl), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'});

      if (response.statusCode == 200) {
        print(">>>>>>fetching from api");
        //saving to json cache
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
        var jsonData = json.decode(response.body);
        List data = jsonData['content']['data'];
        return data.map((json) => RoomType.fromJson(json)).toList();
      } else {
        throw Exception(">> sth wrong, ${response.statusCode}");
      }
    }
  }

//get the features of property
  Future<List<Feature>> getFeatures() async {
    String filename = "features.json";
    var dir = await getTemporaryDirectory();
    Duration cacheDuration = Duration(days: 30); // set cache duration to 30 day

    File file = File(dir.path + "/" + filename);
    var token = await SecureStorage.getStorage();
    var baseUrl = super.features;


    if (file.existsSync() && file.lastModifiedSync().isAfter(
        DateTime.now().subtract(cacheDuration))) {
      // file exists and is not expired, read from cache
      print(">>>>>> reading features detilas from the file");
      //read from cache
      var filedata = jsonDecode(file.readAsStringSync());
      List data = filedata['content']['data'];
      return data.map((json) => Feature.fromJson(json)).toList();
    } else {
      if (file.existsSync()) {
        // delete expired file
        file.deleteSync();
      }

      http.Response response = await http.get(
          Uri.parse(baseUrl), headers: {'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        print(">>>>>>fetching from api");
        //saving to json cache
        file.writeAsStringSync(
            response.body, flush: true, mode: FileMode.write);
        var jsonData = json.decode(response.body);
        List data = jsonData['content']['data'];
        return data.map((json) => Feature.fromJson(json)).toList();
      } else {
        throw Exception(">> sth wrong, ${response.statusCode}");
      }
    }
  }
}