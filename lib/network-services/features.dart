import 'dart:convert';

import 'package:maskkn/models/Features.dart';
import 'package:maskkn/network-services/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:maskkn/screens/authorization_screens/storage.dart';

class FeaturesApi extends BaseAPI {
   Future<List<FeaturesAll>> getFeatures() async {
    var baseUrl = super.featuresApi;
    var token = await SecureStorage.getStorage();
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['content']['data'];

      return data
          .map<FeaturesAll>((entry) => FeaturesAll.fromJson(entry))
          .toList();
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }
}
