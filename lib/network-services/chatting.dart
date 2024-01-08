import 'package:http/http.dart' as http;
import 'package:maskkn/models/agent_model.dart';
import 'package:maskkn/models/chant_message_model.dart';
import 'package:maskkn/models/chat-message.dart';
import 'package:maskkn/models/user.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';
import 'dart:convert';
import 'dart:async';
import 'base_api.dart';

class ChatsApi extends BaseAPI {
  // Future<List<User>> getChats() async {
  //   var baseUrl = super.allChatUsersPath;
  //   var token = await SecureStorage.getStorage();
  //   http.Response response = await http.get(Uri.parse(baseUrl), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   });
  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body);
  //     var data = jsonData['content']['data'];
  //     print(data);
  //     // return data.entries
  //     //     .map<User>((entry) => User.fromJson(entry.value))
  //     //     .toList();
  //     return data.forEach((key, value) {
  //       data.add(User.fromJson(value));
  //     });
  //   } else {
  //     throw Exception(">> sth wrong, ${response.statusCode}");
  //   }
  // }

  Future<List<UserChant>> getChats() async {
    var baseUrl = super.allChatUsersPath;
    var token = await SecureStorage.getStorage();
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['content']['data'];
      List<UserChant> users = [];

      data.forEach((key, value) {
        users.add(UserChant.fromJson(value));
      });

      return users;
    } else {
      throw Exception(">> sth wrong, ${response.statusCode}");
    }
  }

  Future<int> sendMessage(var userId, var message) async {
    var baseUrl = super.sendMessagePath;
    var token = await SecureStorage.getStorage();
    http.Response response = await http.post(Uri.parse(baseUrl),
        body: jsonEncode({"user_id": userId, "message": message}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    return response.statusCode;
  }

  // Future<List<ChantMessageModel>> getChatForUser(int userId) async {
  //   var baseUrl = super.chatForUser;
  //   var token = await SecureStorage.getStorage();

  //   http.Response response = await http.get(
  //     Uri.parse('$baseUrl?user_id=$userId'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body);
  //     var data = jsonData['content']['data'];
  //     // List<ChantMessageModel> messages = [];
  //     // print(data);
  //     // data.forEach((value) {
  //     //   messages.add(ChantMessageModel.fromJson(value));
  //     // });

  //     return data.map((json) => ChantMessageModel.fromJson(json)).toList();

  //     // return messages;
  //   } else {
  //     throw Exception("Something went wrong, ${response.statusCode}");
  //   }
  // }

  static Future<List<ChantMessageModel>> getChatForUser(int userId) async {
    // Replace this URL with your actual API endpoint
    var baseUrl = 'https://stg.mskkn.com/api/messages?user_id=$userId';
    var token = await SecureStorage.getStorage();

    final response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['content']['data'];
      print('data :: $data');

      List<ChantMessageModel> chatMessages = [];

      data.forEach((key, value) {
        chatMessages.add(ChantMessageModel.fromJson(value));
      });

      // return users;
      // final chatMessages = data
      //     .map((messageData) => ChantMessageModel.fromJson(messageData))
      //     .toList();

      return chatMessages;
    } else {
      throw Exception('Failed to load chat messages');
    }
  }
}
