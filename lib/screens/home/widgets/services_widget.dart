import 'package:flutter/material.dart';

import "/exports/exports.dart";

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  // Services
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
      label: "Top Up",
      route: Routes.invoice,
      icon: "smartphone.svg",
    ),
    ServicesModel(
      label: "Invoice",
      route: Routes.quickLink,
      icon: "credit.svg",
    ),
    ServicesModel(
      label: "Pay Bills",
      route: Routes.utility,
      icon: "bills.svg",
    ),
    ServicesModel(
      label: "Parking",
      route: Routes.splitBill,
      icon: "parking.svg",
    ),
    ServicesModel(
      label: "Medicine",
      route: Routes.paymentInfo,
      icon: "medicine.svg",
    ),
  ];

  // Define list of colors
  List<Color> containerColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 3,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                TapEffect(
                  onClick: () => Routes.routeTo(services[index].route),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: containerColors[index], // Assign color
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 7,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/svgs/${services[index].icon}",
                          width: 34,
                          height: 34,
                          // ignore: deprecated_member_use
                          color: Colors.white,
                        ),
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
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Services model
class ServicesModel {
  final String label;
  final String icon;
  final String route;

  // Services constructor
  ServicesModel({
    required this.label,
    required this.icon,
    required this.route,
  });
}
