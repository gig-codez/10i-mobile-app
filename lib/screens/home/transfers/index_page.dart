import "/exports/exports.dart";

class TransfersPage extends StatefulWidget {
  const TransfersPage({super.key});

  @override
  State<TransfersPage> createState() => _TransfersPageState();
}

class _TransfersPageState extends State<TransfersPage> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfers"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: PaymentService.getAllBanks(),
                    builder: (context, snapshot) {
                      var d = snapshot.data?.data ?? [];
                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: d.length,
                              itemBuilder: (context, index) {
                                return RadioListTile.adaptive(
                                  value: selected,
                                  groupValue: index,
                                  onChanged: (value) {
                                    setState(() {
                                      selected = index;
                                    });
                                    context.read<TextController>().setText({
                                      "name": d[index].name,
                                      "code": d[index].code,
                                      "id": d[index].id,
                                    });
                                  },
                                  secondary: SvgPicture.asset(
                                    "assets/svgs/bank.svg",
                                    width: 30,
                                    height: 30,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text(d[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  subtitle: const Text("Transfer to Bank"),
                                );
                              },)
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
              ),
              const SpaceWidget(space: 0.05),
              CustomButton(
                text: "Continue",
                buttonColor: Theme.of(context).primaryColor,
                onPress: () {
                  if (selected == -1) {
                    showMessage(
                        message: "Please select a bank first", type: 'warning');
                  } else {
                    Routes.routeTo(Routes.transferMoney);
                  }
                },
                textColor: Colors.white,
              ),
              const SpaceWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
