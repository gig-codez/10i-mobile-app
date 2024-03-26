import "/exports/exports.dart";
import "../services/widget/utility_widget.dart";

class Utilities extends StatefulWidget {
  const Utilities({super.key});

  @override
  State<Utilities> createState() => _UtilitiesState();
}

class _UtilitiesState extends State<Utilities> {
  final List<UtilityModel> _utilities = [
    UtilityModel(
      label: "Electricity",
      icon: "electricity",
      route: "/electricity",
      color: Colors.orange,
    ),
    UtilityModel(
      label: "Internet",
      icon: "internet",
      route: "/internet",
      color: Colors.deepOrange,
    ),
    UtilityModel(
      label: "Water",
      icon: "drop",
      route: "/water",
      color: Colors.blue,
    ),
    UtilityModel(
      label: "E-Wallet",
      icon: "wallet",
      route: "",
      color: Colors.purple.shade900,
    ),
    UtilityModel(
      label: "Games",
      icon: "games",
      route: "",
      color: Colors.red,
    ),
    UtilityModel(
      label: "Televison",
      icon: "tv",
      route: "",
      color: Colors.indigo,
    ),
    UtilityModel(
      label: "Merchant",
      icon: "shopping",
      route: "",
      color: Colors.purple.shade400,
    ),
    UtilityModel(
      label: "Install",
      icon: "pass",
      route: "",
      color: Colors.redAccent,
    ),
    UtilityModel(
      label: "Health",
      icon: "health",
      route: "",
      color: Colors.green,
    ),
    UtilityModel(
      label: "Mobile",
      icon: "mobile",
      route: "",
      color: Colors.teal.shade300,
    ),
    UtilityModel(
      label: "Motor",
      icon: "bike",
      route: "",
      color: Colors.brown,
    ),
    UtilityModel(
      label: "Car",
      icon: "car",
      route: "",
      color: Colors.blueGrey,
    ),
    UtilityModel(
      label: "Shopping",
      icon: "bag",
      route: "",
      color: Colors.orangeAccent,
    ),
    UtilityModel(
      label: "Deals",
      icon: "deals",
      route: "",
      color: Colors.pink.shade400,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Utilities",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontSizeDelta: 7,
              ),
        ),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
          itemCount: _utilities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return UtilityWidget(
              icon: _utilities[index].icon,
              label: _utilities[index].label,
              color: _utilities[index].color,
              route: _utilities[index].route,
            );
          }),
    );
  }
}

class UtilityModel {
  final String label;
  final Color color;
  final String icon;
  final String route;
  // constructor
  UtilityModel({
    required this.label,
    required this.icon,
    required this.route,
    required this.color,
  });
}
