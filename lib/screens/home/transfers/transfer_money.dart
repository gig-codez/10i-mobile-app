import '/exports/exports.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({super.key});

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer Money"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceWidget(space: 0.12),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(fontWeightDelta: 20, fontSizeDelta: 12),
              decoration: InputDecoration(
                // helperText: "Enter the amount to transfer",
                labelText: "Enter the amount to transfer",
                hintText: "Enter Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SpaceWidget(space: 0.05),
            Center(
              child: Text(
                "Wallet Balance : ₹ 1,00,000",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            const Center(
              child: Text("Fee: ₹ 10 for transfer of 500 balance"),
            ),
            const SpaceWidget(space: 0.06),
            CustomButton(
              text: "Continue",
              onPress: () => Routes.routeTo(Routes.transferReview),
            ),
          ],
        ),
      ),
    );
  }
}
