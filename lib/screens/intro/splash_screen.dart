import '/exports/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    // after animating navigate to the next page
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        Routes.replacePage(const OnBoarding());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "10i wallet",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              // space widget
              const SpaceWidget(space: 0.63),
              SpinKitCircle(
                color: Theme.of(context).primaryColor,
                size: 80.0,
                controller: _controller,
              ),
              const SpaceWidget(space: 0.093),
            ],
          ),
        ),
      ),
    );
  }
}
