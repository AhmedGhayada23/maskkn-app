import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../models/property_full_details.dart';
import '../models/property_short_details.dart';
import '../screens/authorization_screens/storage.dart';
import 'base_api.dart';

class RealEstateApi extends BaseAPI {
  static bool searchLodding = false;
  Future<List<PropertyShortDetails>> getSeatch(
      String? keyword,
      String? sectorId,
      String? sectorDetailId,
      String? stateId,
      String? cityId,
      String? saleStatus,
      String? priceMax,
      String? priceMin,
      String? minArea,
      String? maxArea) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.search;
    searchLodding = true;
    Map<String, dynamic> queryParams = {
      'keyword': keyword,
      'sector_id': sectorId,
      'sector_detail_id': sectorDetailId,
      'state_id': stateId,
      'city_id': cityId,
      'sale_status': saleStatus,
      'price_max': priceMax,
      'price_min': priceMin,
      'min_area': minArea,
      'max_area': maxArea,
      'limit': '',
    };
    http.Response response = await http.get(
        Uri.parse(baseUrl).replace(
          queryParameters: queryParams,
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      searchLodding = false;
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data']['data'];
      List<PropertyShortDetails> myobj =
          data.map((json) => PropertyShortDetails.fromJson(json)).toList();
      return myobj;
    } else {
      searchLodding = false;

      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future<List<PropertyShortDetails>> getProperties(limit, page) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = "${super.properties}?limit=$limit&page=$page";
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data']['data'];
      List<PropertyShortDetails> myobj =
          data.map((json) => PropertyShortDetails.fromJson(json)).toList();
      return myobj;
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future<PropertyFullDetails> getPropertywithId(id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.properties + '/$id';
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['content']['data'];
      print('data :: ${response.body}');
      return PropertyFullDetails.fromJson(data);
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future<List<PropertyShortDetails>> postProperties() async {
    var baseUrl = super.properties;
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];

      return data.map((json) => PropertyShortDetails.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future<List<PropertyShortDetails>> getbestApartments() async {
    var baseUrl = super.bestAppartments;
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];
      return data.map((json) => PropertyShortDetails.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future<List<PropertyShortDetails>> getbestVillas() async {
    var baseUrl = super.bestVillas;
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];
      return data.map((json) => PropertyShortDetails.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }
}
