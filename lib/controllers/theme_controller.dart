import "/exports/exports.dart";

class ThemeController with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  // constructor definition
  ThemeController() {
    var storageService = StorageService();
    storageService.getString('mode').then((value) {
      _themeMode = value == null
          ? ThemeMode.system
          : value == 'system'
              ? ThemeMode.system
              : value == 'light'
                  ? ThemeMode.light
                  : ThemeMode.dark;
      notifyListeners();
    });
  }
  void setThemeMode(String mode) {
    var storageService = StorageService();
    storageService.setData('mode', mode);
    _themeMode = mode == 'system'
        ? ThemeMode.system
        : mode == 'light'
            ? ThemeMode.light
            : ThemeMode.dark;
    notifyListeners();
  }

  void toggleThemeMode() {
    _themeMode =
        themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
