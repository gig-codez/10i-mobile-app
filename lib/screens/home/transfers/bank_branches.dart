import "/exports/exports.dart";

class BankBranches extends StatefulWidget {
  const BankBranches({super.key});

  @override
  State<BankBranches> createState() => _BankBranchesState();
}

class _BankBranchesState extends State<BankBranches> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 10, 8.0),
          child: Text("Select Branch",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontWeightDelta: 10,
                  )),
        ),
        Expanded(
          child: FutureBuilder(
              future: PaymentService.getBankBranches(),
              builder: (context, snapshot) {
                var d = snapshot.data?.data ?? [];
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: d.length,
                        itemBuilder: (context, index) => RadioListTile.adaptive(
                          value: selected,
                          groupValue: index,
                          onChanged: (x) {
                            setState(() {
                              selected = index;
                            });
                          },
                          secondary: SvgPicture.asset(
                            "assets/svgs/bank.svg",
                            width: 30,
                            height: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            d[index].branchName,
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      fontWeightDelta: 20,
                                      fontSizeDelta: 2,
                                    ),
                          ),
                          subtitle: Text(d[index].branchCode),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ),
        CustomButton(
          onPress: () {},
          text: "Continue",
          buttonColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
        )
      ],
    );
  }
}
