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
  static String forgotPass = "/forgotPass";
  static String otp = "/otp";
  static String newPass = "/newPass";
  static String homePage = "/home";
  static String notifications = "/notifications";
  static String qrCode = "/qrCode";
  static String resultPage = "/resultPage";
  static String sendMoney = "/sendMoney";
  static String review = "/review";
  // function to pop off a page
  static void pop() {
    Navigator.of(context).pop();
  }

  // navigate using routes
  static void routeTo(String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void pushPageWithRouteAndAnimation(Widget route, {type = 'fade'}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => type == 'scale'
            ? ScaleTransition(
                scale: animation,
                child: route,
              )
            : FadeTransition(
                opacity: animation,
                child: route,
              ),
      ),
    );
  }

  static void replaceRouteTo(String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static void push(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
        fullscreenDialog: true,
      ),
    );
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
    forgotPass: (context) => const ForgotPassword(),
    otp: (context) => const ResetPin(),
    newPass: (context) => const NewPassword(),
    homePage: (context) => const IndexPage(),
    notifications: (context) => const Notifications(),
    qrCode: (context) => const ScanQrCode(),
    resultPage: (context) => const ResultPage(),
    sendMoney: (context) => const SendMoney(),
    review: (context) => const ReviewSummary(),
  };
}
