import "/exports/exports.dart";

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deposit"),
      ),
      body:Column(
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
        ]
      )
    );
  }
}
