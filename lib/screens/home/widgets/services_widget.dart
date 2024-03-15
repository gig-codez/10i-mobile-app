import "package:wallet_app/widgets/tap_effect.dart";

import "/exports/exports.dart";

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  // services
  List<ServicesModel> services = [
    ServicesModel(
      label: "Send",
      route: Routes.sendMoney,
      icon: "send.svg",
    ),
    ServicesModel(
      label: "Deposit",
      route: Routes.deposit,
      icon: "deposite.svg",
    ),
    ServicesModel(
      label: "Utilities",
      route: Routes.utility,
      icon: "utility.svg",
    ),
    ServicesModel(
      label: "Family",
      route: Routes.family,
      icon: "family.svg",
    ),
    ServicesModel(
      label: "Credit Life",
      route: Routes.credit,
      icon: "credit.svg",
    ),
    ServicesModel(
      label: "Reward",
      route: Routes.reward,
      icon: "reward.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GridView.builder(
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              TapEffect(
                onClick: () => Routes.routeTo(services[index].route),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: SvgPicture.asset(
                      "assets/svgs/${services[index].icon}",
                      width: 30,
                      height: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                services[index].label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          );
        },
      ),
    );
  }
}

// services model
class ServicesModel {
  final String label;
  final String icon;
  final String route;
// services constructor
  ServicesModel({
    required this.label,
    required this.icon,
    required this.route,
  });
}
