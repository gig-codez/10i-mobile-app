import "/exports/exports.dart";

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpaceWidget(space: 0.35),
            Center(
              child: Image.asset(
                "assets/pngs/dp.png",
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Jenny Wilson",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: "\njennywilson255@gmail.com",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          fontSizeFactor: 1.2,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SpaceWidget(space: 0.45),
            CustomButton(
              text: "Send Money",
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPress: () => Routes.routeTo(Routes.sendMoney),
            )
          ],
        ),
      ),
    );
  }
}
