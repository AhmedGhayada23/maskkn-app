import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../models/profile.dart';
import '../screens/authorization_screens/storage.dart';
import 'base_api.dart';

class ProfileApi extends BaseAPI {
  Future<Profile> getUserInfo() async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.profileInfo;
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
      var data = jsonData['content']['data'];
      return Profile.fromJson(data);
    } else {
      throw Exception(
          "Something went wrong, status code: ${response.statusCode}");
    }
  }

  Future editProfile(
      String email, name, phone, description, File? profileImage) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.updatprofileInfo;
    var uri = Uri.parse(baseUrl);

    // إعداد البيانات الثابتة

    // إذا كانت الصورة متوفرة، قم بإضافتها إلى البيانات
    if (profileImage != null) {
      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Content-Type': 'multipart/form-data',
          'accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer $token',
        });

      request.fields.addAll({
        'email': email,
        'name': name,
        'phone': phone,
        'description': description,
        'state_id': '',
        'city_id': '',
      });

      // إضافة الصورة كملف مرفق

      if (profileImage.existsSync()) {
        request.files.add(
          http.MultipartFile(
            'profile_img',
            profileImage.readAsBytes().asStream(),
            profileImage.lengthSync(),
            filename:
                profileImage.toString(), // Replace with appropriate filename
          ),
        );
      }

      // إرسال الطلب
      var response = await request.send();

      // قراءة الاستجابة والتعامل معها كما في الكود الحالي
      return http.Response.fromStream(response);
    } else {
      // إذا لم تكن الصورة متوفرة، قم بإرسال البيانات بدونها
      var body = jsonEncode({
        'email': email,
        'name': name,
        'phone': phone,
        'description': description,
        'state_id': '',
        'city_id': '',
      });

      var response = await http.post(uri,
          headers: {
            "Content-Type": "application/json",
            "accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            'Authorization': 'Bearer $token',
          },
          body: body);

      return response;
    }
  }
}
// class ProfileApi extends BaseAPI {
//   Future<Profile> getUserInfo() async {
//     var token = await SecureStorage.getStorage();
//     var baseUrl = super.profileInfo;
//     http.Response response = await http.get(Uri.parse(baseUrl), headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     });

//     if (response.statusCode == 200) {
//       var jsonData = json.decode(response.body);
//       var data = jsonData['content']['data'];
//       log('profile data :: ${response.body}');

//       return Profile.fromJson(data);
//     } else {
//       throw Exception(">> sth wrong, ${response.statusCode}");
//     }
//   }





