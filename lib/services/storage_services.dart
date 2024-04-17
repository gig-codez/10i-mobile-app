import "/exports/exports.dart";
import "dart:convert";

class StorageService {
  static final StorageService _storageService = StorageService._internal();
  factory StorageService() {
    return _storageService;
  }
  StorageService._internal();
  SharedPreferences? _sharedPreferences;
  Future<SharedPreferences> get sharedPreferences async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  //function to save data of any type supported by shared preferences
  Future<void> setData(String key, dynamic value) async {
    final SharedPreferences prefs = await sharedPreferences;
    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    } else if (value is Map) {
      prefs.setString(key, json.encode(value));
    }
  }

  // function to retrieve saved data
  Future<dynamic> getData(String key) async {
    final SharedPreferences prefs = await sharedPreferences;
    return json.decode(prefs.get(key) as String);
  }

  void removeData(String field) async {
    if (_sharedPreferences != null) {
      await _sharedPreferences?.remove(field);
    }
  }
}
