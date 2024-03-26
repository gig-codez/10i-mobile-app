import "/exports/exports.dart";

class ConfirmPaymentPower extends StatefulWidget {
  final String? title;
  final String? icon;
  final Color? color;
  const ConfirmPaymentPower({super.key, this.title, this.icon , this.color});

  @override
  State<ConfirmPaymentPower> createState() => _ConfirmPaymentPowerState();
}

class _ConfirmPaymentPowerState extends State<ConfirmPaymentPower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        forceMaterialTransparency: true,
        title: const Text("Electricity"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SpaceWidget(space: 0.08),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.orange.withAlpha(40),
              radius: 50,
              child: SvgPicture.asset(
                "assets/svgs/electricity.svg",
                width: 50,
                height: 50,
                color: Colors.orange,
              ),
            ),
          ),
          const SpaceWidget(space: 0.05),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Pay Water Bill",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(fontWeightDelta: 25),
                ),
                TextSpan(
                  text:
                      "\n Pay water bills safely, conveniently & easily. You pay anytime and anywhere",
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          // const SpaceWidget(space: 0.25),
          const Padding(
            padding: EdgeInsets.fromLTRB(3, 18, 3, 10),
            child: Divider(),
          ),
          const PaymentSummary(),
          const SpaceWidget(),
          Center(
            child: CustomButton(
              onPress: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: DialogWidget(
                      title: "Payment",
                      subtitle: "\nPayment Successful",
                      onPress: () => Routes.replacePage(const IndexPage()),
                    ),
                  ),
                );
              },
              text: "Confrim & Pay",
            ),
          )
        ],
      ),
    );
  }
}
