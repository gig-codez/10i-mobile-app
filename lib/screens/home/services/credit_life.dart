import "/exports/exports.dart";

class CreditLife extends StatefulWidget {
  const CreditLife({super.key});

  @override
  State<CreditLife> createState() => _CreditLifeState();
}

class _CreditLifeState extends State<CreditLife> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credit Life"),
      ),
      body: Column(
        children:[
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
