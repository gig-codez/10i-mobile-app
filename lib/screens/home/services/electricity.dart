import "/exports/exports.dart";

class Electricity extends StatefulWidget {
  const Electricity({super.key});

  @override
  State<Electricity> createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  text: "Pay Electricity Bill",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(fontWeightDelta: 25),
                ),
                TextSpan(
                  text:
                      "\n Pay electricity bills safely, conveniently & easily. You pay anytime and anywhere",
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

          CommonTextField(
            titleText: "Enter Amount",
            hintText: "0.00",
            fieldColor: Colors.grey.shade200,
            controller: TextEditingController(),
            icon: Icons.attach_money_rounded,
            keyboardType: TextInputType.number,
            contentPadding: const EdgeInsets.fromLTRB(5, 7, 0, 5),
            readOnly: false,
          ),
          const SpaceWidget(),
          CustomButton(
            text: "Continue",
            onPress: () {
              Routes.push(const ConfirmPaymentPower());
            },
          ),
          const SpaceWidget(space: 0.25),
        ],
      ),
    );
  }
}
