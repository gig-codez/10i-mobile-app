import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
// import 'package:wallet_app';

import 'firebase_options.dart';
import 'exports/exports.dart';

// Platform messages are asynchronous, so we initialize in an async method.
Future<void> initPlatformState() async {
  String? initialLink;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    initialLink = await getInitialLink();
    if (initialLink != null) {
      UserService.createContactList({
        'contact': initialLink.split("/").last,
      });
    }

    // showMessage(message: 'Initial link: $initialLink');
  } on Exception {
    showMessage(message: 'Failed to get initial link.', type: 'success');
  }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
}

// global definitions of build context from navigation global key.
var navigationKey = GlobalKey<NavigatorState>();

BuildContext context = navigationKey.currentContext!;
// ---------------------------------------------------------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

// ...
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WalletApp());
  // device stays in portrait.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // layout settings for android
  if (Platform.isAndroid) {
    // app fits screen pxiels
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black12,
      ),
    );
  }
  initPlatformState();
}

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoaderController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataController(),
        ),
      ],
      builder: (context, widget) {
        return MaterialApp(
          navigatorKey: navigationKey,
          title: '10i App',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          initialRoute: Routes.splash,
          routes: Routes.routes,
        );
      },
    );
  }
}
