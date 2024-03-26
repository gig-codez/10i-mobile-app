import '/exports/exports.dart';

class TransferReview extends StatefulWidget {
  const TransferReview({super.key});

  @override
  State<TransferReview> createState() => _TransferReviewState();
}

class _TransferReviewState extends State<TransferReview> {
  // Text editing controllers for user input
  final TextEditingController _transferAmountController =
      TextEditingController();

  @override
  void dispose() {
    _transferAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review Summary',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Review Summary Text

            const Divider(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  "1,000.00",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .apply(fontWeightDelta: 15),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: SvgPicture.asset(
                'assets/svgs/money.svg',
                height: 30.0,
                width: 30.0,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Balance"),
              subtitle: const Text('Available: \$1,000.00'),
            ),
            const Divider(),
            // To section
            ListTile(
              leading: SvgPicture.asset(
                'assets/svgs/bank.svg',
                height: 30.0,
                width: 30.0,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Account Number"),
              subtitle: const Text('Checking.... 4679'),
            ),
            const Divider(),

            // Transfer fee section

            Card(
              elevation: 0,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Transfer Amount"),
                    trailing: Text(
                      '0.00',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 15,
                          ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Fee"),
                    trailing: Text(
                      'free',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 10,
                          ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("You'll get"),
                    trailing: Text(
                      '1,000',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 10,
                          ),
                    ), //Theme.of(context).primaryColorTheme),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Estimated arrival section
            const Text(
              'Estimated arrival: 3 business days',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 4.0),
            const Text(
              'Transfers made after 7.00 PM ET or on weekends or holidays take longer. All transfers are subject to review & could be delayed or stopped if we identify an issue.',
              style: TextStyle(fontSize: 12.0),
            ),

            const SizedBox(height: 32.0),

            // Transfer Now button
            CustomButton(
                onPress: () => Routes.routeTo(Routes.transferSuccess),
                text: "Transfer Now"),
          ],
        ),
      ),
    );
  }
}
