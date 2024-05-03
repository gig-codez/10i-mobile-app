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
  // 10i services routes
  static String sendMoney = "/sendMoney";
  static String deposit = "/deposit";
  static String utility = "/utility";
  static String splitBill = "/family";
  static String review = "/review";
  static String invoice = "/reward";
  static String electricity = "/electricity";
  static String water = "/water";
  static String paymentInfo = "/paymentInfo";
  // transfers
  static String transfers = "/transfers";
  static String transferMoney = "/transferMoney";
  static String transferReview = "/transferReview";
  static String transferSuccess = "/transferSuccess";
  // quick link
  static String quickLink = "/quickLink";
  static String quickInvoice = "/quickInvoice";
  // bills
  static String internet = "/internet";
  static String send = "/send";
  static String requestMoney = "/requestMoney";
// wallet
  static String wallet = "/wallet";
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
    // scanDocs: (context) => const ScanDocument(),
    completeProfile: (context) => const UserProfile(),
    createPin: (context) => const CreatePin(),
    forgotPass: (context) => const ForgotPassword(),
    otp: (context) => const ResetPin(),
    newPass: (context) => const NewPassword(),
    homePage: (context) => const IndexPage(),
    notifications: (context) => const Notifications(),
    qrCode: (context) => const ScanQrCode(),
    resultPage: (context) => const ResultPage(),
    review: (context) => const ReviewSummary(),
    // services
    deposit: (context) => const Deposit(),
    utility: (context) => const Utilities(),
    invoice: (context) => const Rewards(),
    // split bills
    splitBill: (context) => const IndexBills(),
    // payment
    paymentInfo: (context) => const PaymentInfo(),
    // transfers
    transfers: (context) => const TransfersPage(),
    transferMoney: (context) => const TransferMoney(),
    transferReview: (context) => const TransferReview(),
    transferSuccess: (context) => const TransferSuccess(),
    // quick invoice
    quickLink: (context) => const QuickLink(),
    quickInvoice: (context) => const QuickInvoice(),
    // bills
    electricity: (context) => const Electricity(),
    water: (context) => const Water(),
    internet: (context) => const InternetPay(),
    // send momney
    sendMoney: (context) => const IndexSend(),
    send: (context) => const SendMoney(),
    // request money
    requestMoney: (context) => const IndexRequest(),
    // wallet
    wallet: (context) => const WalletPage(),
  };
}
