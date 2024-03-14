import "/exports/exports.dart";
import "widgets/services_widget.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
        backgroundColor: Theme.of(context).primaryColor.withAlpha(230),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withAlpha(230),
                  ),
                  child: Column(
                    children: [
                      const SpaceWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: FlutterLogo(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TapEffect(
                                  onClick: () => Routes.routeTo(Routes.qrCode),
                                  child: SvgPicture.asset(
                                    "assets/svgs/scan.svg",
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox.square(dimension: 20),
                                TapEffect(
                                  onClick: () =>
                                      Routes.routeTo(Routes.notifications),
                                  child: SvgPicture.asset(
                                    "assets/svgs/notify.svg",
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                      //  text view for rendering user's account balance
                      ,
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "\$4000 ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(
                                      color: Colors.white,
                                      fontSizeDelta: 12,
                                      fontSizeFactor: 1.35,
                                      fontWeightDelta: 850,
                                    ),
                              ),
                              TextSpan(
                                text: "\nBalance Available",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(color: Colors.white),
                              ),
                              TextSpan(text: "\n")
                            ],
                          ),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ServicesWidget(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 15, 8, 15),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transactions",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                      color: Colors.black, fontWeightDelta: 5),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  //
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
