 import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
 static const String themeKey = 'theme';

  static Future<void> saveTheme(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themeKey, index);
  }

  static Future<int> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(themeKey) ?? 0;
  }
}