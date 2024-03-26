import "/exports/exports.dart";

class Water extends StatefulWidget {
  const Water({super.key});

  @override
  State<Water> createState() => _WaterState();
}

class _WaterState extends State<Water> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Routes.push(const ConfrimPaymentWater());
            },
          ),
          const SpaceWidget(space: 0.25),
        ],
      ),
    );
  }
}
