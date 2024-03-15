import "/exports/exports.dart";
import "widget/utility_widget.dart";

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
      label: "Water",
      icon: "drop",
      route: "/water",
      color: Colors.blue,
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
          itemCount: _utilities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
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
