import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
// import 'package:wallet_app';

import 'firebase_options.dart';
import 'exports/exports.dart';

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
