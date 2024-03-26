import "/exports/exports.dart";

class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rewards"),
      ),
      body: Column(
        children: [
          Image.asset("assets/pngs/unavailable.png"),
          const SpaceWidget(),
          Text(
            "Service Unavailable",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .apply(fontWeightDelta: 25),
          ),
        ],
      ),
    );
  }
}
