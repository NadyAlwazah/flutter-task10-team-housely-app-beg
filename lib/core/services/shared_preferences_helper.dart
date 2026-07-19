import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  //  SharedPreferences واحد من  instance الحصول على
  static Future<SharedPreferences> get instance async =>
      await SharedPreferences.getInstance();

  // String  حفظ
  static Future<void> saveString(String key, String value) async {
    final prefs = await instance;
    await prefs.setString(key, value);
  }

  // String قراءة
  static Future<String?> getString(String key) async {
    final prefs = await instance;
    return prefs.getString(key);
  }

  // List<String> حفظ
  static Future<void> saveList(String key, List<String> value) async {
    final prefs = await instance;
    await prefs.setStringList(key, value);
  }

  // List<String> قراءة
  static Future<List<String>?> getList(String key) async {
    final prefs = await instance;
    return prefs.getStringList(key);
  }

  // bool حفظ
  static Future<void> saveBool(String key, bool value) async {
    final prefs = await instance;
    await prefs.setBool(key, value);
  }

  // bool قراءة
  static Future<bool?> getBool(String key) async {
    final prefs = await instance;
    return prefs.getBool(key);
  }

  // حذف قيمة واحدة
  static Future<void> remove(String key) async {
    final prefs = await instance;
    await prefs.remove(key);
  }
}
