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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).primaryColor.withAlpha(230),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withAlpha(230),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SpaceWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/pngs/dp.png"),
                                  radius: 34,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text.rich(TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Hi",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nJenny Wilson",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
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
                      const SpaceWidget(
                        space: 0.07,
                      ),
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
                                      fontSizeDelta: 30,
                                      fontSizeFactor: 1.5,
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
                              // const TextSpan(text: "\n")
                            ],
                          ),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.white,
                        child: ServicesWidget(),
                      ),
                      SpaceWidget(space: 0.2),
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
