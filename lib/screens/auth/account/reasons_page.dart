import "/exports/exports.dart";

class ReasonsPage extends StatefulWidget {
  const ReasonsPage({super.key});

  @override
  State<ReasonsPage> createState() => _ReasonsPageState();
}

class _ReasonsPageState extends State<ReasonsPage> {
  List<int> reasons = [];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        child:
            Consumer<LoaderController>(builder: (context, controller, child) {
          return Column(
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
                child: FutureBuilder(
                    future: AuthService().getReasons(),
                    builder: (context, snapshot) {
                      var data = snapshot.data?.allReasons ?? [];
                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: Checkbox.adaptive(
                                        value: reasons.contains(data[index].id),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedIndex = index;
                                            if (value!) {
                                              reasons.add(data[index].id);
                                            } else {
                                              reasons.remove(data[index].id);
                                            }
                                          });
                                        }),
                                    title: Text(
                                      data[index].description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
              ),
              const SpaceWidget(),
              CustomButton(
                  onPress: () {
                    print(reasons);
                    AuthService().postReasons(reasons);
                  },
                  text: "Continue",
                  loading: controller.isLoading,
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white),
              const SpaceWidget(space: 0.1),
            ],
          );
        }),
      ),
    );
  }
}
