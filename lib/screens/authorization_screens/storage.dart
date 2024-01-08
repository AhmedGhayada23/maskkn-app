

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  static const FlutterSecureStorage storage = FlutterSecureStorage();
  static const _keyValue = "token";

  static Future setStorage(String str )async{
    await storage.write(key: _keyValue, value: str);
  }

  static Future getStorage() async {
     String? token = await storage.read(key: _keyValue);
     return token;
  }

   static Future<void> removeStorage() async {
    await storage.delete(key: _keyValue);
  }

}