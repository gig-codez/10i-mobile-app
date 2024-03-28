import "/exports/exports.dart";

class Split extends StatefulWidget {
  const Split({super.key});

  @override
  State<Split> createState() => _SplitState();
}

class _SplitState extends State<Split> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Split Bill",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '\nHow much is the total bill?',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                ),
                TextSpan(
                  text: '\nEnter the amount below?',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SpaceWidget(space: 0.07),
          TextField(
            style: Theme.of(context).textTheme.titleMedium!.apply(
                  fontWeightDelta: 5,
                ),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Enter Amount",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SpaceWidget(space: 0.05),
          Text(
            "\t\tAdd a note (optional)\n",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(fontWeightDelta: 5),
          ),
          TextField(
            autofocus: true,
            style: Theme.of(context).textTheme.bodyMedium!,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Provide a note",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
          const SpaceWidget(space: 0.76),
          CustomButton(
            onPress: () => Routes.pushPageWithRouteAndAnimation(
              const SplitBill(),
            ),
            text: "Continue",
            textColor: Colors.white,
            buttonColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
