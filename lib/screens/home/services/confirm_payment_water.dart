
import "/exports/exports.dart";

class ConfrimPaymentWater extends StatefulWidget {
  const ConfrimPaymentWater({super.key});

  @override
  State<ConfrimPaymentWater> createState() => _ConfrimPaymentWaterState();
}

class _ConfrimPaymentWaterState extends State<ConfrimPaymentWater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        forceMaterialTransparency: true,
        title: const Text("Water"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SpaceWidget(space: 0.08),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue.withAlpha(40),
              radius: 50,
              child: SvgPicture.asset(
                "assets/svgs/drop.svg",
                width: 50,
                height: 50,
                color: Colors.blue,
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
