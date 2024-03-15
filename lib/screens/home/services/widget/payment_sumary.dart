import "/exports/exports.dart";
class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return           Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              fontWeightDelta: 25,
                            ),
                      ),
                      Text(
                        "N1000",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              fontWeightDelta: 25,
                            ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              fontWeightDelta: 25,
                            ),
                      ),
                      Text(
                        "N1000",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              fontWeightDelta: 25,
                            ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Balance",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              fontWeightDelta: 25,
                            ),
                      ),
                      Text(
                        "N1000",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              fontWeightDelta: 25,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}