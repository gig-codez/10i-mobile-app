import "../../auth/reset/widgets/dialog_widget.dart";
import "/exports/exports.dart";

class ReviewSummary extends StatefulWidget {
  const ReviewSummary({super.key});

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 18, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/pngs/dp.jpeg"),
                radius: 60,
              ),
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Jenny Wilson",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: "\njennywilson255@gmail.com",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            fontSizeFactor: 1.2,
                          ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(3, 18, 3, 10),
              child: Divider(),
            ),
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
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontSizeFactor: 1.2,
                              ),
                        ),
                        Text(
                          "₹ 500",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
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
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontSizeFactor: 1.2,
                              ),
                        ),
                        Text(
                          "-₹  50",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
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
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontSizeFactor: 1.2,
                              ),
                        ),
                        Text(
                          "₹ 500",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
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
                    "For goods and Services",
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          fontSizeFactor: 1.0,
                          fontWeightDelta: 5,
                        ),
                  ),
                ),
              ),
            ),
            const SpaceWidget(),
            const Divider(),
            const SpaceWidget(),
            CustomButton(
              onPress: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: DialogWidget(
                      title: "Payment Successful\n",
                      subtitle:
                          "\nYour payment has been processed successfully.",
                      onPress: () => Routes.replacePage(
                        IndexPage(),
                      ),
                    ),
                  ),
                );
              },
              text: "Confirm & Send",
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
