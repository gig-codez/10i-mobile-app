import 'dart:io';

import 'exports/exports.dart';

// global definitions of build context from navigation global key.
var navigationKey = GlobalKey<NavigatorState>();

BuildContext context = navigationKey.currentContext!;
// ---------------------------------------------------------------
void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      builder: (context, widget) {
        return MaterialApp(
          navigatorKey: navigationKey,
          title: '10i Wallet',
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
