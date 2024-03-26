import "/exports/exports.dart";

class QuickInvoice extends StatefulWidget {
  const QuickInvoice({super.key});

  @override
  State<QuickInvoice> createState() => _QuickInvoiceState();
}

class _QuickInvoiceState extends State<QuickInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send a Quick Invoice."),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Column(
          children: [
            SvgPicture.asset("assets/svgs/share_link.svg"),
            const SpaceWidget(),
            Text(
              "Your invoice link is ready to share.",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(fontWeightDelta: 25),
            ),
            const Text("Share your link via the share link button below."),
            //
            SpaceWidget(space: 0.09),

            CustomButton(
              text: "Share Link",
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPress: () {},
            ),
            const SpaceWidget(),
            CustomButton(
              text: "Done",
              onPress: () => Routes.replacePage(const IndexPage()),
            )
          ],
        ),
      ),
    );
  }
}
