import "/exports/exports.dart";

class TransfersPage extends StatefulWidget {
  const TransfersPage({super.key});

  @override
  State<TransfersPage> createState() => _TransfersPageState();
}

class _TransfersPageState extends State<TransfersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer to Your Bank"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Column(
            children: [
              ListTile(
                leading: SvgPicture.asset(
                  "assets/svgs/bank.svg",
                  width: 40,
                  height: 40,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text("UBA"),
                subtitle: const Text("Transfer to Bank"),
                trailing:
                    Icon(Icons.check, color: Theme.of(context).primaryColor),
              ),
              const Divider(),
              ListTile(
                leading: SvgPicture.asset("assets/svgs/master_card.svg",
                    width: 40, height: 40),
                title: const Text("Master Card"),
                subtitle: const Text("Checking..."),
              ),
              CustomButton(
                text: "Continue",
                buttonColor: Theme.of(context).primaryColor,
                onPress: () => Routes.routeTo(Routes.transferMoney),
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
