import "/exports/exports.dart";

class Routes {
  static String splash = "/";
  static String createAccount = "/createAccount";
  static String login = "/login";
  static String reasons = "/reasons";
  static String completeProfile = "/complete";
  static String verify = "/verify";
  static String verifyIdentity = "/verifyIdentity";
  static String scanDocs = "/scanDocs";
  static String createPin = "/createPin";
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
    reasons: (context) => const ReasonsPage(),
    verify: (context) => const VerifyPage(),
    verifyIdentity: (context) => const VerifyIdentity(),
    scanDocs: (context) => const ScanDocument(),
    completeProfile: (context) => const UserProfile(),
    createPin: (context) => const CreatePin(),
  };
}
