import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/models/my_ads_model.dart';
import 'package:maskkn/network-services/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:maskkn/screens/authorization_screens/storage.dart';
import 'package:maskkn/screens/profile/my_adds.dart';
import 'package:maskkn/screens/service-screens/add_property/add_success.dart';

class AdsApi extends BaseAPI {
  Future<List<MyAdsModel>> getMyAds() async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.myAdsApi;
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
      List data = jsonData['content']['data']['data'];
      log('data My ads :: ${response.body}');

      return data.map((json) => MyAdsModel.fromJson(json)).toList();
    } else {
      throw Exception(">> sth wrong with offers , ${response.statusCode}");
    }
  }

  // Future<http.Response> sendAds({
  //   String? title,
  //   String? description,
  //   String? square,
  //   String? numberRooms,
  //   String? numberBathrooms,
  //   String? yearBuilt,
  //   String? buildingSize,
  //   String? salePrice,
  //   String? isSale,
  //   List? image,
  // }) async {
  //   var token = await SecureStorage.getStorage();
  //   // var body = jsonEncode({
  //   //   'title_ar': title,
  //   //   'title_en': '',
  //   //   'description_ar': description,
  //   //   'description_en': '',
  //   //   'country_id': '1',
  //   //   'state_id': '2',
  //   //   'city_id': '11',
  //   //   'sector_id': '1',
  //   //   'sector_detail_id': '10',
  //   //   'area_id': '40',
  //   //   'url_3d': '',
  //   //   'square': '500', // مساحة الارض
  //   //   'parking': '1', // وقوف السيارات
  //   //   'number_rooms': numberRooms, // عدد الغرف
  //   //   'number_bedrooms': '0', //عدد غرف النوم
  //   //   'number_bathrooms': numberBathrooms, // عدد الحمامات
  //   //   'year_built': yearBuilt, // سنة البناء
  //   //   'location_long': '',
  //   //   'location_lat': '',
  //   //   'building_size': '250', // حجم المبنى
  //   //   'maid_room': '0', // غرفة خادمة
  //   //   'laundry_room': '1', //غرفة الغسيل
  //   //   'is_rent': isSale == '1' ? '0' : '1', // هو الإيجار
  //   //   'is_sale': isSale == '1' ? '1' : '0', // هو للبيع
  //   //   'finance_months': '', // أشهر التمويل
  //   //   'feature_ids[0]': '',
  //   //   'feature_ids[1]': '',
  //   //   'feature_ids[2]': '',
  //   //   'feature_ids[3]': '',
  //   //   'video_type': '',
  //   //   'video_url': '',
  //   //   'is_featured': '0',
  //   //   'auto_renew': '0',
  //   //   'listing_status': 'published',
  //   //   'landing_size': '',
  //   //   'expire_date': '2024-08-11 22:58:07',
  //   //   'rent_period': 'monthly', // فترة الإيجار
  //   //   'rent_price': isSale == '1' ? '' : salePrice, // سعر الإيجار
  //   //   'sale_price': isSale == '1' ? salePrice : '', // سعر البيع
  //   // });
  //   // http.Response response = await http.post(Uri.parse(super.storeProperties),
  //   //     headers: {
  //   //       "Content-Type": "application/json",
  //   //       "accept": "application/json",
  //   //       "Access-Control-Allow-Origin": "*"
  //   //     },
  //   //     body: body);

  //   var request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse(super.storeProperties),
  //   );
  //   request.headers['Authorization'] = 'Bearer $token';
  //   request.headers['Content-Type'] = 'application/json';
  //   request.headers['accept'] = 'application/json';
  //   request.headers['Access-Control-Allow-Origin'] = '*';

  //   if (image != null) {
  //     for (var i = 0; i < image.length; i++) {
  //       var imageFile = File(image[i]);
  //       if (imageFile.existsSync()) {
  //         request.files.add(
  //           http.MultipartFile(
  //             'images[$i]',
  //             imageFile.readAsBytes().asStream(),
  //             imageFile.lengthSync(),
  //             filename: 'image$i.jpg', // Replace with appropriate filename
  //           ),
  //         );
  //       }
  //     }
  //   }
  //   request.fields['title_ar'] = title ?? '';
  //   request.fields['title_en'] = title ?? '';
  //   request.fields['description_ar'] = description ?? '';
  //   request.fields['description_en'] = description ?? '';
  //   request.fields['country_id'] = '1';
  //   request.fields['state_id'] = '2';
  //   request.fields['city_id'] = '11';

  //   request.fields['sector_id'] = '1';
  //   request.fields['sector_detail_id'] = '10';
  //   request.fields['area_id'] = '40';
  //   request.fields['url_3d'] = '';
  //   request.fields['square'] = square ?? '';
  //   request.fields['parking'] = '';
  //   request.fields['number_rooms'] = numberRooms ?? '';
  //   request.fields['number_bedrooms'] = '';
  //   request.fields['number_bathrooms'] = numberBathrooms ?? '';
  //   request.fields['year_built'] = yearBuilt ?? '';
  //   request.fields['location_long'] = '';
  //   request.fields['location_lat'] = '';
  //   request.fields['building_size'] = buildingSize ?? '';
  //   request.fields['maid_room'] = '';
  //   request.fields['laundry_room'] = '';
  //   request.fields['is_rent'] = isSale == '1' ? '0' : '1';
  //   request.fields['is_sale'] = isSale == '1' ? '1' : '0';
  //   request.fields['finance_months'] = '';
  //   request.fields['video_type'] = '';
  //   request.fields['video_url'] = '';
  //   request.fields['is_featured'] = '';
  //   request.fields['auto_renew'] = '';
  //   request.fields['listing_status'] = 'published';
  //   request.fields['landing_size'] = '';
  //   request.fields['expire_date'] = '';
  //   request.fields['rent_period'] = 'annualy';
  //   request.fields['rent_price'] = isSale == '1' ? '' : salePrice!;
  //   request.fields['rent_price'] = isSale == '1' ? salePrice! : '';

  //   try {
  //     var response = await request.send();
  //     if (response.statusCode == 200) {
  //       print('Ad uploaded successfully');
  //     } else {
  //       print(
  //           'Error uploading ad ${response.statusCode} :: ${response.headers} :: ${response.request} :: zz');
  //     }

  //     return http.Response.fromStream(response);
  //   } catch (e) {
  //     print('Error sending request: $e');
  //     return http.Response('Error sending request: $e', 500);
  //   }
  // }

  Future<http.Response> sendAds({
    required BuildContext context,
    String? title,
    String? description,
    String? sectorId,
    String? sectorDetailId,
    String? stateId,
    String? cityId,
    String? square,
    String? numberRooms,
    String? numberBathrooms,
    String? laundryRoom,
    String? maidRoom,
    String? yearBuilt,
    String? buildingSize,
    String? salePrice,
    String? isSale,
    String? ur3d,
    List<dynamic>? featureIds,
    List<File>? imagePaths,
  }) async {
    var token = await SecureStorage.getStorage();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(super.storeProperties),
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields.addAll({
      'title_ar': title ?? '',
      'title_en': title ?? '',
      'description_ar': description ?? '',
      'description_en': description ?? '',
      'country_id': '1',
      'state_id': stateId ?? '',
      'city_id': cityId ?? '',
      'sector_id': sectorId ?? '',
      'sector_detail_id': sectorDetailId ?? '',
      'area_id': '40',
      'url_3d': ur3d ?? '',
      'square': square ?? '', // مساحة الارض
      'parking': '0', // وقوف السيارات
      'number_rooms':  '', // عدد الغرف
      'number_bedrooms': numberRooms ?? '', //عدد غرف النوم
      'number_bathrooms': numberBathrooms ?? '', // عدد الحمامات
      'year_built': yearBuilt ?? '', // سنة البناء
      'location_long': '',
      'location_lat': '',
      'building_size': buildingSize ?? '', // حجم المبنى
      'maid_room': maidRoom ?? '0', // غرفة خادمة
      'laundry_room': laundryRoom ?? '0', //غرفة الغسيل
      'is_rent': isSale == '1' ? '0' : '1', // هو الإيجار
      'is_sale': isSale == '1' ? '1' : '0', // هو للبيع
      'finance_months': '', // أشهر التمويل
      'video_type': '',
      'video_url': '',
      'is_featured': '0',
      'auto_renew': '0',
      'listing_status': 'published',
      'landing_size': '',
      'expire_date': '2024-08-11 22:58:07',
      'rent_period': 'annualy', // فترة الإيجار
      'rent_price': isSale == '1' ? '' : salePrice!, // سعر الإيجار
      'sale_price': isSale == '1' ? salePrice! : '', // سعر البيع
    });
    if (featureIds != null) {
      // Iterate through the selectedIds list and add them as fields
      for (var i = 0; i < featureIds.length; i++) {
        request.fields['feature_ids[$i]'] = featureIds[i].toString();
        print('ids :: ${featureIds[i]}');
      }
    }

    if (imagePaths != null) {
      for (var i = 0; i < imagePaths.length; i++) {
        var imageFile = imagePaths[0];
        print('image :: $imageFile');
        if (imageFile.existsSync()) {
          request.files.add(
            http.MultipartFile(
              'images[0]',
              imageFile.readAsBytes().asStream(),
              imageFile.lengthSync(),
              filename:
                  imageFile.toString(), // Replace with appropriate filename
            ),
          );
        }
      }
    } else {
      print('no image');
    }

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdSuccess(),
          ),
        );
        print('Ad uploaded successfully');
      } else {
        ScaffoldMessenger.of(context);
        print('Error uploading ad');
      }

      return http.Response.fromStream(response);
    } catch (e) {
      print('Error sending request: $e');
      return http.Response('Error sending request: $e', 500);
    }
  }

  // delete

  Future<http.Response> deleteAds(int id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.properties;

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

  // update

  Future<http.Response> updateAds({
    required BuildContext context,
    int? id,
    String? title,
    String? description,
    String? sectorId,
    String? sectorDetailId,
    String? stateId,
    String? cityId,
    String? square,
    String? numberRooms,
    String? numberBathrooms,
    String? laundryRoom,
    String? maidRoom,
    String? yearBuilt,
    String? buildingSize,
    String? salePrice,
    String? isSale,
    String? ur3d,
    List<dynamic>? featureIds,
    List<File>? imagePaths,
  }) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.storeProperties;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/$id'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields.addAll({
      'title_ar': title ?? '',
      'title_en': title ?? '',
      'description_ar': description ?? '',
      'description_en': description ?? '',
      'country_id': '1',
      'state_id': stateId ?? '',
      'city_id': cityId ?? '',
      'sector_id': sectorId ?? '',
      'sector_detail_id': sectorDetailId ?? '',
      'area_id': '40',
      'url_3d': ur3d ?? '',
      'square': square ?? '', // مساحة الارض
      'parking': '0', // وقوف السيارات
      'number_rooms': '', // عدد الغرف
      'number_bedrooms': numberRooms ?? '', //عدد غرف النوم
      'number_bathrooms': numberBathrooms ?? '', // عدد الحمامات
      'year_built': yearBuilt ?? '', // سنة البناء
      'location_long': '',
      'location_lat': '',
      'building_size': buildingSize ?? '', // حجم المبنى
      'maid_room': maidRoom ?? '0', // غرفة خادمة
      'laundry_room': laundryRoom ?? '0', //غرفة الغسيل
      'is_rent': isSale == '1' ? '0' : '1', // هو الإيجار
      'is_sale': isSale == '1' ? '1' : '0', // هو للبيع
      'finance_months': '', // أشهر التمويل
      'video_type': '',
      'video_url': '',
      'is_featured': '0',
      'auto_renew': '0',
      'listing_status': 'published',
      'landing_size': '',
      'expire_date': '2024-08-11 22:58:07',
      'rent_period': 'annualy', // فترة الإيجار
      'rent_price': isSale == '1' ? '' : salePrice!, // سعر الإيجار
      'sale_price': isSale == '1' ? salePrice! : '', // سعر البيع
    });
    if (featureIds != null) {
      // Iterate through the selectedIds list and add them as fields
      for (var i = 0; i < featureIds.length; i++) {
        request.fields['feature_ids[$i]'] = featureIds[i].toString();
        print('ids :: ${featureIds[i]}');
      }
    }

    if (imagePaths != null) {
      for (var i = 0; i < imagePaths.length; i++) {
        var imageFile = imagePaths[0];
        print('image :: $imageFile');
        if (imageFile.existsSync()) {
          request.files.add(
            http.MultipartFile(
              'images[0]',
              imageFile.readAsBytes().asStream(),
              imageFile.lengthSync(),
              filename:
                  imageFile.toString(), // Replace with appropriate filename
            ),
          );
        }
      }
    } else {
      print('no image');
    }

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('id: $id');
        print('title: $title');
        print('description: $description');
        print('sectorId: $sectorId');
        print('sectorDetailId: $sectorDetailId');
        print('stateId: $stateId');
        print('cityId: $cityId');
        print('square: $square');
        print('numberRooms: $numberRooms');
        print('numberBathrooms: $numberBathrooms');
        print('laundryRoom: $laundryRoom');
        print('maidRoom: $maidRoom');
        print('yearBuilt: $yearBuilt');
        print('buildingSize: $buildingSize');
        print('salePrice: $salePrice');
        print('isSale: $isSale');
        print('ur3d: $ur3d');
        print('featureIds: $featureIds');
        print('imagePaths: $imagePaths');

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyAds(),
          ),
        );

        print('Ad uploaded successfully');
      } else {
        ScaffoldMessenger.of(context);
        print('Error uploading ad');
      }

      return http.Response.fromStream(response);
    } catch (e) {
      print('Error sending request: $e');
      return http.Response('Error sending request: $e', 500);
    }
  }
}
