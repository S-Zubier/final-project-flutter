import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String _themeKey = "isDarkMode";

  // دالة لحفظ حالة الثيم (داكن أو فاتح) في الهاتف
  static Future<void> saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDarkMode);
  }

  // دالة لجلب حالة الثيم المحفوظة (وإرجاع false كوضع افتراضي إذا لم يُحفظ شيء)
  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }
}
