import "/exports/exports.dart";

class SplitBill extends StatefulWidget {
  const SplitBill({super.key});

  @override
  State<SplitBill> createState() => _SplitBillState();
}

class _SplitBillState extends State<SplitBill> {
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
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const CircleAvatar(
                    backgroundImage: AssetImage("assets/pngs/dp.jpeg"),
                    radius: 40,
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                flex: 5,
                child: 
                ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("assets/pngs/dp.jpeg"),
                      radius: 40,
                    ),
                    title: Text("John Doe"),
                    titleTextStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                    subtitle: Text("example@yahoo.com"),
                    trailing: Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
             
              ),
              const SpaceWidget(),
              Center(
                child: CustomButton(
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPress: () => Routes.pushPageWithRouteAndAnimation(
                    const SplitMoney(),
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
