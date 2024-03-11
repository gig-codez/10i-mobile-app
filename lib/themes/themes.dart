import "/exports/exports.dart";

class AppTheme {
  // global texttheme from google fonts
  static TextTheme _textTheme = GoogleFonts.robotoTextTheme();
  static ThemeData darkTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 34, 89, 240),
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
  static ThemeData lightTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 34, 89, 240),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );
}
