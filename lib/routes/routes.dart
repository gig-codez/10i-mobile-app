import "/exports/exports.dart";

class Routes {
  static String splash = "/";
  // function to pop off a page
  static void pop() {
    Navigator.of(context).pop();
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashScreen(),
  };
}
