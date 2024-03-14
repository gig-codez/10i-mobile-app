import "/exports/exports.dart";

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
        child: Column(
          children: [
            Lottie.asset(
              "assets/svgs/nodata.json",
              // width: 200,
              // height: 200,
              repeat: false,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "No Notifications\n",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                  ),
                  TextSpan(
                    text: "You don't have notifications at this time.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(fontSizeFactor: 1.24),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
