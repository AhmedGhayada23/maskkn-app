import 'dart:convert';
import 'package:maskkn/models/area_model.dart';
import 'package:maskkn/models/bank.dart';
import 'package:maskkn/models/city.dart';
import 'package:maskkn/models/governorate.dart';
import 'package:maskkn/models/sector.dart';
import 'package:http/http.dart' as http;
import 'package:maskkn/models/sector_details.dart';
import 'package:maskkn/network-services/base_api.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';

class SectorReqest extends BaseAPI {
  Future<List<SectorDetails>> getSectorDetails() async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.sectorsDetailsApi;
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];

      return data.map((json) => SectorDetails.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<SectorDetails>> getSectorDetailsId(int id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.sectorsDetailsIdApi;
    http.Response response = await http.get(
      Uri.parse('${baseUrl}?id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];

      return data.map((json) => SectorDetails.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<Sector>> getSector() async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.sectorsApi;
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];

      return data.map((json) => Sector.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<AreaModel>> getArea(int id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.areasApi;
    http.Response response = await http.get(
      Uri.parse('$baseUrl?city_id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];

      return data.map((json) => AreaModel.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<Governorate>> getGovernorate(int? id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.governorateApi;
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];
      print('dataaaaaa :: ${response.body}');
      return data.map((json) => Governorate.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<Governorate>> getGovernorateId(int? id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.governorateIdApi;
    http.Response response = await http.get(
      Uri.parse('${baseUrl}?state_id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];
      print('dataaaaaa :: ${response.body}');
      return data.map((json) => Governorate.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<City>> getCity(int id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.cityApi;
    http.Response response = await http.get(
      Uri.parse('$baseUrl?state_id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];

      return data.map((json) => City.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<Bank>> getBank() async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.bankApi;
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];

      return data.map((json) => Bank.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }
}
