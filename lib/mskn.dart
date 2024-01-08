import 'dart:convert';
import 'dart:io';

class MsknData{

  Future<List> readBankData(filePath, langugeCode) async {
    String input = await File(filePath).readAsString();
    Map<String, dynamic> data  = jsonDecode(input);

    return data[langugeCode];
  }

}