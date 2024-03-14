import "package:wallet_app/widgets/tap_effect.dart";

import "/exports/exports.dart";

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 250,
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                TapEffect(
                  onClick: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 30,
                      child: SvgPicture.asset(
                        "assets/svgs/send.svg",
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Text("Send"),
              ],
            );
          },
        ),
      ),
    );
  }
}
