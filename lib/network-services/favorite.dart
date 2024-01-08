import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/property_short_details.dart';
import '../screens/authorization_screens/storage.dart';
import 'base_api.dart';

class FavoriteApi extends BaseAPI{

  Future<List<PropertyShortDetails>> getFavoriteProperties() async {
    var baseUrl = super.getFavorite;
    var token = await SecureStorage.getStorage();
    http.Response response = await http.get(
        Uri.parse(baseUrl), headers:  {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];
      return data.map((json) => PropertyShortDetails.fromJson(json)).toList();
    }else{
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future addFavorite(id) async {

    var token = await SecureStorage.getStorage();
    var body = jsonEncode({'property_id':id });
    String url = "${super.postFavorite}";
    http.Response response =
    await http.post(Uri.parse(url), headers:  {
      "Content-Type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $token'
    }, body: body);
    print(response.body);
    return response;
  }

  Future removeFavorite(id) async {
    var token = await SecureStorage.getStorage();
    var body = jsonEncode({'property_id':id });
    String url = "${super.deleteFavorite}";
    http.Response response =
    await http.delete(Uri.parse(url), headers:  {
      "Content-Type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $token'
    }, body: body);
    print(response.body);
    return response;
  }
}