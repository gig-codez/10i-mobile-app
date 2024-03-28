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
      label: "Request",
      route: Routes.requestMoney,
      icon: "request.svg",
    ),
    ServicesModel(
      label: "Transfer",
      route: Routes.transfers,
      icon: "transfer.svg",
    ),
    ServicesModel(
      label: "Create Invoice",
      route: Routes.invoice,
      icon: "doc.svg",
    ),
    ServicesModel(
      label: "Send a Quick Invoice",
      route: Routes.quickLink,
      icon: "credit.svg",
    ),
    ServicesModel(
      label: "Pay Bills",
      route: Routes.utility,
      icon: "bills.svg",
    ),
    ServicesModel(
      label: "Split Bill",
      route: Routes.splitBill,
      icon: "split.svg",
    ),
    ServicesModel(
      label: "Share Payment Info",
      route: Routes.paymentInfo,
      icon: "share.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      child: GridView.builder(
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              TapEffect(
                onClick: () => Routes.routeTo(services[index].route),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 20,
                    child: SvgPicture.asset(
                      "assets/svgs/${services[index].icon}",
                      width: 20,
                      height: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                services[index].label,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
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
