import "/exports/exports.dart";

class ReasonsPage extends StatefulWidget {
  const ReasonsPage({super.key});

  @override
  State<ReasonsPage> createState() => _ReasonsPageState();
}

class _ReasonsPageState extends State<ReasonsPage> {
  List<String> reasons = [
    "Make Online Payments",
    "Spend or save daily",
    "Send and manage money",
    "Spend while travelling",
    "Other reasons."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Reason(s) for Using 10i Wallet\n",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                  ),
                  TextSpan(
                    text:
                        "\nWe want to provide the best experience according to the your needs.",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          fontSizeFactor: 1.2,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SpaceWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: reasons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CheckboxListTile(
                              value: false,
                              dense: true,
                              onChanged: (value) {},
                              title: Text(
                                reasons[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SpaceWidget(),
            CustomButton(
                onPress: () => Routes.routeTo(Routes.verifyIdentity),
                text: "Continue",
                buttonColor: Theme.of(context).primaryColor,
                textColor: Colors.white),
            const SpaceWidget(space: 0.1),
          ],
        ),
      ),
    );
  }
}
