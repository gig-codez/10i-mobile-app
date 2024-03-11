import "/exports/exports.dart";

class Routes {
  static String splash = "/";
  static String createAccount = "/createAccount";
  static String login = "/login";

  static String completeProfile = "/complete";
  // function to pop off a page
  static void pop() {
    Navigator.of(context).pop();
  }

  // navigate using routes
  static void routeTo(String route) {
    Navigator.of(context).pushNamed(route);
  }

  // replace pages
  static void replacePage(Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    createAccount: (context) => const CreateAccount(),
  };
}
