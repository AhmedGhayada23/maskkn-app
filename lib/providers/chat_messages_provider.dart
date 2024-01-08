import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:maskkn/models/chant_message_model.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';

class ChatMessagesProvider with ChangeNotifier {
  final StreamController<List<ChantMessageModel>> _chatMessagesController =
      StreamController<List<ChantMessageModel>>();

  Stream<List<ChantMessageModel>> get chatMessagesStream =>
      _chatMessagesController.stream;

  Future<void> getChatForUser(int userId) async {
    try {
      final chatMessages = await fetchChatForUser(userId);
      _chatMessagesController.add(chatMessages);
    } catch (error) {
      throw error;
    }
  }

  Future<List<ChantMessageModel>> fetchChatForUser(int userId) async {
    var baseUrl = 'https://stg.mskkn.com/api/messages?user_id=$userId';
    var token = await SecureStorage.getStorage();

    final response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['content']['data'];
      List<ChantMessageModel> chatMessages = [];

      for (var item in data) {
        chatMessages.add(ChantMessageModel.fromJson(item));
      }

      return chatMessages;
    } else {
      throw Exception('Failed to load chat messages');
    }
  }
}
