import "/exports/exports.dart";

class AppTheme {
  // global texttheme from google fonts
  static final TextTheme _textTheme = GoogleFonts.poppinsTextTheme();
  // app color
  static final Color _primaryColor = const Color.fromARGB(255, 34, 89, 240);
  // defining themes
  static ThemeData darkTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
  // light theme.
  static ThemeData lightTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );
}
