import "/exports/exports.dart";

class ReviewSummary extends StatefulWidget {
  const ReviewSummary({super.key});

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  @override
  Map<String, dynamic> d = {};
  Widget build(BuildContext context) {
    StorageService().getData('transaction').then((v) {
      // print(v);
      setState(() {
        d = v;
      });
    });
    var p = getScannedUser().user;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Review Summary",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 18, 10, 10),
        children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/pngs/default.jpeg"),
              radius: 80,
            ),
          ),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${p.firstName} ${p.lastName}",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: "\n ${p.email}",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          fontSizeFactor: 1.2,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SpaceWidget(),
          Card(
            elevation: 0,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                width: 1,
                color: Colors.grey.withAlpha(100),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 0,
                    color: Colors.grey.withAlpha(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        width: 1,
                        color: Colors.grey.withAlpha(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amount",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      fontSizeFactor: 1.2,
                                    ),
                              ),
                              Text(
                                "UGX ${context.read<TextController>().text['amount']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      fontSizeFactor: 1.2,
                                    ),
                              ),
                            ],
                          ),
                          const SpaceWidget(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      fontSizeFactor: 1.2,
                                    ),
                              ),
                              Text(
                                "UGX 0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      fontSizeFactor: 1.2,
                                    ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      fontSizeFactor: 1.2,
                                    ),
                              ),
                              Text(
                                "UGX ${context.read<TextController>().text['amount']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      fontSizeFactor: 1.2,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  Text(
                    "\n  Payment Type",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(fontWeightDelta: 5),
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                        title: Text(
                          context.read<TextController>().text['description'] ??
                              "",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeFactor: 1.0,
                                fontWeightDelta: 5,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SpaceWidget(),
                ],
              ),
            ),
          ),
          const SpaceWidget(),
          CustomButton(
            onPress: () {
              var payment = {
                "wallet": 3,
                "sender": 20,
                "receiver": 19,
                "txt_ref": "${d['txRef']}",
                "amount": context.read<TextController>().text['amount'],
                "tax": 0,
                "currency": "UGX",
                "is_successful": true,
                "payment_type": 1,
                "transaction_type": 3,
                "transaction_category": 2,
                "transaction_response": "Success",
                "transaction_notes": "Payment for services",
                "system_notes": "Processed automatically"
              };
              PaymentService().executeTransaction(payment);
            },
            text: "Confirm & Send",
            buttonColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
