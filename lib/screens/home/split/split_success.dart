import "/exports/exports.dart";

class SplitSuccess extends StatefulWidget {
  final String? amount;
  const SplitSuccess({super.key, this.amount});

  @override
  State<SplitSuccess> createState() => _SplitSuccessState();
}

class _SplitSuccessState extends State<SplitSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/pngs/success.png"),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "You're splitting a bill of UGX ${widget.amount}\n",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 23,
                          ),
                    ),
                    TextSpan(
                      text: "\nYou can track this split from activity.",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPress: () => Routes.replacePage(
                    const IndexPage(),
                  ),
                  text: "Done",
                ),
              ),
              const SpaceWidget()
            ],
          ),
        ),
      ),
    );
  }
}
