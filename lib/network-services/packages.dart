import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/packages.dart';
import '../models/photography_package.dart';
import '../screens/authorization_screens/storage.dart';
import 'base_api.dart';

class PackagesApi extends BaseAPI {
  Future<List<Package>> getAllPackages() async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.packages;
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data']['data'];
      return data.map((json) => Package.fromJson(json)).toList();
    } else {
      throw Exception(
          ">> sth wrong with photography packages, ${response.statusCode}");
    }
  }

  Future<Package> getPackageWhithId(int id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.packages;
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return Package.fromJson(jsonData['content']['data']);
    } else {
      throw Exception(
          ">> sth wrong with photography packages, ${response.statusCode}");
    }
  }

  Future<List<PhotographyPackage>> getPhotographyPackages() async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.photographyPackages;
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List data = jsonData['content']['data'];
      return data.map((json) => PhotographyPackage.fromJson(json)).toList();
    } else {
      throw Exception(
          ">> sth wrong with photography packages, ${response.statusCode}");
    }
  }

  Future<PhotographyPackage> getPhotographyPackageWhithId(String id) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.photographyPackages;
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return PhotographyPackage.fromJson(jsonData['content']['data']);
    } else {
      throw Exception(
          ">> sth wrong with photography packages, ${response.statusCode}");
    }
  }

  Future<void> paymentPackage(int orderId) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.checkPayment;

    // Map<String, dynamic> queryParams = {
    //   'order_id': 1,
    // };

    http.Response response =
        await http.get(Uri.parse('$baseUrl?order_id=1'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      print('تم الدفع بنجاح');
    } else {
      throw Exception(
          ">> sth wrong with photography packages, ${response.statusCode}");
    }
  }

  Future<void> PackageCheckout(int price, packageid, discount) async {
    var token = await SecureStorage.getStorage();
    var baseUrl = super.packageCheckout;

    // Map<String, dynamic> queryParams = {
    //   'price': price,
    //   'days': 1,
    //   'discount': discount,
    //   'package_id': packageid,
    //   'payment_method': 'thawani',
    //   'payment_done': 1,
    //   'payment_status': 'new',
    //   'slip': '',
    // };

    http.Response response = await http.post(
        Uri.parse(
            '$baseUrl?price=$price&days=9&discount=$discount&package_id=$packageid&payment_method=thawani&payment_done=1&payment_status=new&slip'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      print('تم الدفع بنجاح');
    } else {
      print(response.body);
      print(response.request);
      print(response.statusCode);
    }
  }
}
