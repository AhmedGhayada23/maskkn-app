import 'dart:convert';

import 'package:maskkn/network-services/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:maskkn/screens/authorization_screens/storage.dart';

class SchedualTour extends BaseAPI {
  Future<http.Response> sentSchedualTourr(String name, String phone,
      String date, String time, int propertyId) async {
    var token = await SecureStorage.getStorage();
    var body = jsonEncode({
      'name': name,
      'phone': phone,
      'date': date,
      'time': time,
      'property_id': propertyId
    });
    http.Response response = await http.post(Uri.parse(super.sentSchedualTour),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "X-Mskkn-Mob": "true",
          'Authorization': 'Bearer $token'
        },
        body: body);
    return response;
  }
}
