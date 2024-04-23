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
  double balance = 0;
  int wallet = -1;
  @override
  void initState() {
    super.initState();
    PaymentService().getWalletBalance().then((value) {
      setState(() {
        balance = value.walletBalance;
        // wallet = value.
      });
    });
  }

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
      body: Consumer<TextController>(builder: (context, controller, c) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8.0),
          children: [
            // Review Summary Text
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  "UGX ${controller.text.get('amount')}",
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
              titleTextStyle: Theme.of(context).textTheme.titleMedium!.apply(
                    fontWeightDelta: 20,
                  ),
              subtitle: Text(
                  'UGX ${balance - double.parse(controller.text.get('amount'))}'),
            ),
            const Divider(),
            // To section
            if (context.read<TextController>().text.get('code') != 'MPS') ...[
              ListTile(
                leading: SvgPicture.asset(
                  'assets/svgs/bank.svg',
                  height: 30.0,
                  width: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text("Account Number"),
                subtitle: Text('${controller.text.get('code')}'),
              ),
            ],

            // Transfer fee section
            Card(
              elevation: 0,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Transfer Amount"),
                    trailing: Text(
                      "UGX ${controller.text.get('amount')}",
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
                      "UGX ${controller.text.get('amount')}",
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
                onPress: () {
                  if (context.read<TextController>().text.get('code') ==
                      'MPS') {
                    PaymentService().transferToMM();
                  } else {
                    PaymentService().transferToBank();
                  }
                },
                text: "Transfer Now"),
          ],
        );
      }),
    );
  }
}
