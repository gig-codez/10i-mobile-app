import "/exports/exports.dart";
import "dart:async";

class DashCard extends StatefulWidget {
  const DashCard({super.key});

  @override
  State<DashCard> createState() => _DashCardState();
}

class _DashCardState extends State<DashCard> {
  double balance = 0;
  @override
  void initState() {
    super.initState();
    PaymentService().getWalletBalance().then((value) {
      if (mounted) {
        setState(() {
          balance = value.walletBalance;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Timer.periodic(const Duration(milliseconds: 900), (timer) {
    SessionService().getToken().then((x) {
      debugPrint(x);
    });
    // });

    return Consumer<DataController>(builder: (context, controller, c) {
      // ------------------

      // -----------------------
      return Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(18, 64, 118, 1),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/pngs/avatar.png"),
                          radius: 24,
                        ),
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
                          onClick: () => Routes.routeTo(Routes.notifications),
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
              Wrap(
                children: [
                  Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "UGX\t",
                            style:
                                Theme.of(context).textTheme.titleLarge!.apply(
                                      color: Colors.white,
                                      fontSizeDelta: 2,
                                      fontSizeFactor: 1.2,
                                      fontWeightDelta: 1900,
                                    ),
                          ),
                          TextSpan(
                            text: "${controller.balance} ",
                            style:
                                Theme.of(context).textTheme.titleLarge!.apply(
                                      color: Colors.white,
                                      fontSizeDelta: 2,
                                      fontSizeFactor: 1.25,
                                      fontWeightDelta: 800,
                                    ),
                          ),
                          TextSpan(
                            text: "\nBalance Available",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white),
                          ),
                          // const TextSpan(text: "\n")
                        ],
                      ),
                      textAlign: TextAlign.center),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
