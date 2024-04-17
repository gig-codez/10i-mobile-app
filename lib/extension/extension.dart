extension MapUtil on Map {
  void put(String key, dynamic value) {
    this[key] = value;
  }

  /// this function return data for a specified key.
  dynamic get(String key) {
    return this[key];
  }
}
