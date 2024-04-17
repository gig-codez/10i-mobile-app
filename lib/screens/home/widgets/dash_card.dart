import "/exports/exports.dart";

class DashCard extends StatelessWidget {
  const DashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withAlpha(230),
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
                        backgroundImage: AssetImage("assets/pngs/dp.png"),
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
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: Colors.white,
                                fontSizeDelta: 2,
                                fontSizeFactor: 1.2,
                                fontWeightDelta: 1900,
                              ),
                        ),
                        TextSpan(
                          text: "0 ",
                          style: Theme.of(context).textTheme.titleLarge!.apply(
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
  }
}
