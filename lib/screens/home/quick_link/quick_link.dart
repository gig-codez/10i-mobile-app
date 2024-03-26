import "/exports/exports.dart";

class QuickLink extends StatefulWidget {
  const QuickLink({super.key});

  @override
  State<QuickLink> createState() => _QuickLinkState();
}

class _QuickLinkState extends State<QuickLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send a Quick Invoice."),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8.0),

        children: [
          const SpaceWidget(space: 0.12),
          Text(
            "Enter amount",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(fontWeightDelta: 20, fontSizeDelta: 3),
            decoration: InputDecoration(
              hintText: "Enter Amount",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SpaceWidget(space: 0.05),
          const Text("Add a note (optional)"),
          TextField(
            autofocus: true,
            style: Theme.of(context).textTheme.bodyMedium!,
            maxLines: 4,
            decoration: InputDecoration(
              // helperText: "Enter the amount to transfer",s
              hintText: "Provide a note",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SpaceWidget(space: .6),
          CustomButton(
            text: "Create and Share Link.",
            buttonColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPress: () => Routes.routeTo(Routes.quickInvoice),
          ),
        ],
      ),
    );
  }
}
