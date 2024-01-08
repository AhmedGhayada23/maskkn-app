import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
late String _selectedLanguage;

  String get selectedLanguage => _selectedLanguage;

  LanguageProvider(String initialLanguage) {
    _selectedLanguage = initialLanguage;
  }

  Future<void> setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    _selectedLanguage = languageCode;
    notifyListeners();
  }
}
