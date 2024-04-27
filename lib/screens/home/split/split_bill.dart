import "/exports/exports.dart";

class SplitBill extends StatefulWidget {
  final String amount;
  const SplitBill({super.key,required this.amount});

  @override
  State<SplitBill> createState() => _SplitBillState();
}

class _SplitBillState extends State<SplitBill> {
  List<Map<String, dynamic>> selected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Who's Splitting this Bill?",
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
              if (selected.isNotEmpty) ...[
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selected.length,
                    itemBuilder: (context, index) => const CircleAvatar(
                      backgroundImage: AssetImage("assets/pngs/default.jpeg"),
                      radius: 40,
                    ),
                  ),
                ),
                const Divider(),
              ],
              Expanded(
                flex: 5,
                child: FutureBuilder(
                  future: UserService.getContactsList(),
                  builder: (context, snapshot) {
                    var d = snapshot.data ?? [];
                    return snapshot.hasData
                        ? d.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No Contacts found.",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SpaceWidget(space: 0.05),
                                  const SpaceWidget(space: 0.05),
                                ],
                              )
                            : ListView.builder(
                                itemCount: d.length,
                                itemBuilder: (context, index) =>
                                    ContactWidget(id: d[index]['contact'],onPress:(){
                                      setState(() {
                                        selected.add(d[index]);
                                      });
                                    },),
                              )
                        : const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                              SpaceWidget(space: 0.05),
                              Text("Loading...")
                            ],
                          );
                  },
                ),
              ),
              const SpaceWidget(),
              Center(
                child: CustomButton(
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPress: () => Routes.pushPageWithRouteAndAnimation(
                    SplitMoney(
                      money:widget.amount,
                      selected: selected,
                    ),
                  ),
                  text: "Continue",
                ),
              ),
              const SpaceWidget(),
              const Text(
                "Note: You can only split the bill once.",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
