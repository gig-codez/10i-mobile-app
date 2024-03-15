import "/exports/exports.dart";

class Family extends StatefulWidget {
  const Family({super.key});

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Family",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
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
