import 'dart:developer';

import 'package:maskkn/models/agent_model.dart';
import 'package:maskkn/models/property_management.dart';
import 'package:maskkn/models/property_request_types_model.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';

import '../models/property_request_type.dart';
import 'base_api.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class PropertyRequest extends BaseAPI {
  Future<List<PropertyRequestType>> getPropertyRequestOffers() async {
    var baseUrl = super.propertyRequestTypes;
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];

      return data.map((json) => PropertyRequestType.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<PropertyManagementModel>> getPropertyManagement(
      String? cityId, String? stateId) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.propertyManagementApi;

    // Map<String, dynamic> queryParams = {
    //   'city_id': cityId,
    //   'state_id': stateId,
    // };
    http.Response response = await http.get(
        Uri.parse(
            '$baseUrl?city_id=${cityId ?? ''}&state_id?${stateId ?? ''}=&bank_id?='),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['agencies'];
      log('data pro :: ${response.body}');

      return data
          .map((json) => PropertyManagementModel.fromJson(json))
          .toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<PropertyManagementModel>> getAppraisal(
      String? bank, String? state) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.propertyManagementApi;
    http.Response response = await http.get(
        Uri.parse('$baseUrl?bank_id=${bank ?? ''}&state_id?=${state ?? ''}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['agencies'];
      log('data pro :: ${response.body}');

      return data
          .map((json) => PropertyManagementModel.fromJson(json))
          .toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<AgentModel> getPropertyManagementDetails(int id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.propertyManagementDetailsApi;
    http.Response response =
        await http.get(Uri.parse('$baseUrl/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['content'];
      log('data pro :: $data');

      return AgentModel.fromJson(data);
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<List<PropertyRequestTypesModel>> getPropertyType() async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.propertyRequestTypesApi;
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];
      log('data pro :: $data');

      return data
          .map((json) => PropertyRequestTypesModel.fromJson(json))
          .toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  Future<void> propertyRequestt({
    String? sectorid,
    String? stateid,
    String? cityid,
    String? sectorDetailSlug,
    String? bedrooms,
    String? bathrooms,
    String? landSize,
    String? buildingSize,
    String? builtYearFrom,
    String? builtYearTo,
    String? moreDetails,
    String? priceLow,
    String? priceHigh,
    String? propertyRequestTypeId,
    String? type,
  }) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.propertyRequest;
    var body = {
      'sector_id': sectorid,
      'state_id': stateid,
      'city_id': cityid,
      'sector_detail_slug': sectorDetailSlug,
      'more_details': moreDetails,
      'price_low': priceLow,
      'price_high': priceHigh,
      'property_request_type_id': propertyRequestTypeId,
      'type': type,
    };

    // Conditionally add bedrooms and bathrooms based on sectorDetailSlug
    if (sectorDetailSlug == 'apartment' || sectorDetailSlug == 'villa') {
      body['bedrooms'] = bedrooms;
      body['bathrooms'] = bathrooms;
    }

    // Conditionally add land_size and building_size based on sectorDetailSlug
    if (sectorDetailSlug == 'land' || sectorDetailSlug == 'villa') {
      body['land_size'] = landSize;
    }

    if (sectorDetailSlug == 'villa' ||
        sectorDetailSlug == 'office' ||
        sectorDetailSlug == 'shop' ||
        sectorDetailSlug == 'store') {
      body['building_size'] = buildingSize;
    }

    // Conditionally add built_year_from and built_year_to based on sectorDetailSlug
    if (sectorDetailSlug == 'villa') {
      body['built_year_from'] = builtYearFrom;
      body['built_year_to'] = builtYearTo;
    }

    var encodedBody = jsonEncode(body);

    http.Response response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer $token'
      },
      body: encodedBody,
    );

    if (response.statusCode == 200) {
      print('طلب عقار تم الدفع بنجاح');
    } else {
      print(response.body);
      print(
          '$propertyRequestTypeId === $sectorid ,, $stateid ,, $cityid ,, $sectorDetailSlug ,, $bathrooms ,, $bedrooms ,, $landSize ,, $buildingSize ,, $builtYearFrom ,, $builtYearTo ,, $priceLow ,, $priceHigh ,, $type');
      throw Exception(
          ">> sth wrong with photography packages, ${response.statusCode}");
    }
  }

  Future<http.Response> sentPromoCode(String promocode, String price) async {
    var token = await SecureStorage.getStorage();
    final Uri uri = Uri.parse(super.promoCodeApi);

    // تعريف ال query parameters
    final Map<String, String> queryParams = {
      'promocode': promocode,
      'price': price,
    };
    http.Response response = await http.get(
      uri.replace(queryParameters: queryParams),
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "X-Mskkn-Mob": "true",
        'Authorization': 'Bearer $token'
      },
    );
    return response;
  }
}
