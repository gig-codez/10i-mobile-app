import "/exports/exports.dart";

class SuccessPayment extends StatefulWidget {
  const SuccessPayment({super.key});

  @override
  State<SuccessPayment> createState() => _SuccessPaymentState();
}

class _SuccessPaymentState extends State<SuccessPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset("assets/svgs/confirmed.svg",
                    width: 250, height: 250),
              ),
              const SpaceWidget(space: 0.06),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\nPaid Bill Successfully.",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontWeightDelta: 5),
                    ),
                    TextSpan(
                      text:
                          "\nYou can now your payment history through activity menu.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SpaceWidget(space: 0.06),
              CustomButton(
                onPress: () => Routes.routeTo(
                  Routes.utility,
                ),
                text: "Done",
                textColor: Colors.white,
                buttonColor: Theme.of(context).primaryColor,
              ),
              const SpaceWidget(space: 0.06),
              CustomButton(
                onPress: () {
                  Routes.replacePage(
                    const IndexPage(),
                  );
                },
                text: "Pay other bills",
              )
            ],
          ),
        ),
      ),
    );
  }
}
