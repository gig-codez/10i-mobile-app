import "/exports/exports.dart";

class SplitMoney extends StatefulWidget {
  const SplitMoney({super.key});

  @override
  State<SplitMoney> createState() => _SplitMoneyState();
}

class _SplitMoneyState extends State<SplitMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Split \$800 USD",
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
                  itemCount: 9,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (context, index) => ListTile(
                    leading: index == 0
                        ? CircleAvatar(
                            backgroundImage: AssetImage("assets/pngs/dp.png"),
                            radius: 40,
                          )
                        : const CircleAvatar(
                            backgroundImage: AssetImage("assets/pngs/dp.jpeg"),
                            radius: 40,
                          ),
                    title: index == 0 ? Text("You") : const Text("John Doe"),
                    titleTextStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                    trailing: FittedBox(
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("\$100"),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
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
                    const ReviewSplit(),
                  ),
                  text: "Review",
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
