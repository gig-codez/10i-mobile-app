import "/exports/exports.dart";

class ConfirmPrompt extends StatelessWidget {
  const ConfirmPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(),
      child: ListView(
        padding: const EdgeInsets.all(14.0),
        children: [
          Center(
            child: Text(
              "Review Summary",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontWeightDelta: 8,
                  ),
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Request",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(fontWeightDelta: 25)),
              Text("\$1000",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(fontWeightDelta: 25)),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                    text:
                        "\nIf your requesting for money for purchase, you will pay a seller a fee when John Doe pays you. You could be recovered by the"),
                TextSpan(
                  text: " Seller Protection.\n",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          const SpaceWidget(),
          CustomButton(
            text: "Request Now",
            onPress: () {
              // first pop off the bottom sheet
              Routes.pop();
              // then route to success screen.
              Routes.pushPageWithRouteAndAnimation(
                const RequestSuccess(),
              );
            },
            buttonColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
