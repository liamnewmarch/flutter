import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class JsonStorage {
  JsonStorage({
    required this.key,
    this.defaultValue = '{}',
  });

  String defaultValue;
  String key;
  SharedPreferences? _prefs;

  Future<SharedPreferences> getStorage() async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  clear() async {
    final storage = await getStorage();
    await storage.remove(key);
  }

  Future<dynamic> read() async {
    final storage = await getStorage();
    return jsonDecode(storage.getString(key) ?? defaultValue);
  }

  write(Object? data) async {
    final storage = await getStorage();
    await storage.setString(key, jsonEncode(data));
  }
}
