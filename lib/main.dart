import 'exports/exports.dart';

// global definitions of buildcontext from navigation global key.
var navigationKey = GlobalKey<NavigatorState>();
BuildContext context = navigationKey.currentContext!;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WalletApp());
  // define system chrome features for the app to fit the device screen.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  // device stays in portrait.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // app fits screen pxiels
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [],
  );
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
      ],
      builder: (context, widget) {
        return MaterialApp(
          navigatorKey: navigationKey,
          title: '10i Wallet',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialRoute: Routes.splash,
          routes: Routes.routes,
        );
      },
    );
  }
}
