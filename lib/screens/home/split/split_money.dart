import "/exports/exports.dart";

class SplitMoney extends StatefulWidget {
  final String money;
  final int billId;
  final List<dynamic> selected;
  const SplitMoney(
      {super.key,
      required this.billId,
      required this.money,
      required this.selected});

  @override
  State<SplitMoney> createState() => _SplitMoneyState();
}

class _SplitMoneyState extends State<SplitMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Split UGX ${widget.money}",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: ListView.separated(
                  itemCount: widget.selected.length + 1,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (context, index) => ListTile(
                    leading: index == 0
                        ? const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/pngs/default.jpeg"),
                            radius: 40,
                          )
                        : const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/pngs/default.jpeg"),
                            radius: 40,
                          ),
                    title:
                        index == 0 ? const Text("You") : const Text("John Doe"),
                    titleTextStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                    trailing: Text(
                      "UGX ${(int.parse(widget.money) ~/ (widget.selected.length + 1))}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              const SpaceWidget(),
              Center(
                child: CustomButton(
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPress: () => BillService().updateBill(widget.billId,widget.money),
                  text: "Split Bill",
                ),
              ),
              const SpaceWidget(space: 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
