import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maskkn/models/details_property_model.dart';
import 'package:maskkn/models/my_offer_model.dart';
import 'package:maskkn/network-services/base_api.dart';
import 'package:maskkn/models/details_off_plan_model.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';

class MyOfferApi extends BaseAPI {
  Future<List<MyOfferModel>> getOffers() async {
    var baseUrl = super.myOfferApi;
    var token = await SecureStorage.getStorage();
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['content']['data']['data'];
      print('data :: $data');

      return data
          .map<MyOfferModel>((entry) => MyOfferModel.fromJson(entry))
          .toList();
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future<http.Response> deleteOffers(int id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.deleteOfferApi;

    // var body = jsonEncode({'email': email, 'password': password});
    http.Response response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "X-Mskkn-Mob": "true",
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<DetailsPropertyModel> getPropertDetailsId(id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.myOfferApi;
    http.Response response =
        await http.get(Uri.parse('$baseUrl/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['content']['data'];
      print('data 123:: ${response.body}');

      // قد تحتاج إلى التأكد من تنسيق البيانات ومطابقتها مع نموذجك هنا
      // يمكنك تحقق من أن نموذجك يتوقع البيانات بشكل صحيح وتطابق الأسماء

      return DetailsPropertyModel.fromJson(
          data); // تأكد من أن نموذجك يدعم هذا التحويل بشكل صحيح
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future<DetailsOffPlanModel> getPropertywithId(id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.detailsPropertyOffPlanApi;
    http.Response response =
        await http.get(Uri.parse('$baseUrl/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['content']['data'][0];
      print('data 123:: ${response.body}');

      // قد تحتاج إلى التأكد من تنسيق البيانات ومطابقتها مع نموذجك هنا
      // يمكنك تحقق من أن نموذجك يتوقع البيانات بشكل صحيح وتطابق الأسماء

      return DetailsOffPlanModel.fromJson(
          data); // تأكد من أن نموذجك يدعم هذا التحويل بشكل صحيح
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }
}
