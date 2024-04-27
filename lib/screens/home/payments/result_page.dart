import "/exports/exports.dart";

class ResultPage extends StatefulWidget {
  final int? user;
  const ResultPage({super.key, this.user});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    // var p = getScannedUser().user;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8.0),
        child: FutureBuilder(
            future: UserService.getUser(widget.user ?? 0),
            builder: (context, snapshot) {
              var p = snapshot.data;
              return snapshot.hasData
                  ? Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SpaceWidget(space: 0.35),
                        Center(
                          child: Image.asset(
                            "assets/pngs/default.jpeg",
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: MediaQuery.of(context).size.width * 0.65,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              // TextSpan(
                              //   text: "${p.firstName} ${p.lastName}",
                              //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              //         fontSize: 25,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              // ),
                              TextSpan(
                                text: "\n ${p!.email}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      fontSizeFactor: 1.2,
                                    ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SpaceWidget(space: 0.45),
                        CustomButton(
                          text: "Send Money",
                          buttonColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPress: () => Routes.push(
                            SendMoney(
                              receiverId: p.id,
                              email: p.email,
                            ),
                          ),
                        )
                      ],
                    )
                  : const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
