import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maskkn/models/property_off_plan.dart';
import 'package:maskkn/network-services/base_api.dart';
import 'package:maskkn/screens/authorization_screens/sign_in.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';

class MapsApi extends BaseAPI {
  Future<List<PropertyOffPlanModel>> getOffPlan(BuildContext context) async {
    var baseUrl = super.propertyOffPlanApi;
    var token = await SecureStorage.getStorage();
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['content']['data']['data'];

      return data
          .map<PropertyOffPlanModel>(
              (entry) => PropertyOffPlanModel.fromJson(entry))
          .toList();
    } else if (response.statusCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('انتهت صلاحية التسجيل')),
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
      throw Exception(">> sesion, ${response.statusCode}");
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }
}
