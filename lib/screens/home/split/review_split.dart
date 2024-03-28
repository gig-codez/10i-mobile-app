import "/exports/exports.dart";

class ReviewSplit extends StatefulWidget {
  const ReviewSplit({super.key});

  @override
  State<ReviewSplit> createState() => _ReviewSplitState();
}

class _ReviewSplitState extends State<ReviewSplit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Review Summary",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(14, 5, 14, 5),
          children: [
            Center(
              child: Text(
                "\$800",
                style: Theme.of(context).textTheme.titleLarge!.apply(
                      fontWeightDelta: 9,
                      fontSizeDelta: 20,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              margin: const EdgeInsets.all(12.0),
              elevation: 0,
              color: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  width: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                children: [
                  const ListTile(
                    title: Text("Split Breakdown"),
                  ),
                  // Expanded(
                  //   child: ListView.separated(
                  //     itemCount: 9,
                  //     separatorBuilder: (BuildContext context, int index) =>
                  //         Padding(
                  //       padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  //       child: const Divider(),
                  //     ),
                  //     itemBuilder: (context, index) => ListTile(
                  //       title:
                  //           index == 0 ? Text("You") : const Text("John Doe"),
                  //       titleTextStyle:
                  //           Theme.of(context).textTheme.titleMedium!.copyWith(
                  //                 fontWeight: FontWeight.w800,
                  //                 fontSize: 16,
                  //               ),
                  //       trailing: Text("\$900"),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            const Text(
                "We're helping with the math. Your account is not charged."),
            const SpaceWidget(),
            Center(
              child: CustomButton(
                buttonColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPress: () => Routes.pushPageWithRouteAndAnimation(
                  const SplitSuccess(),
                ),
                text: "Request Now",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
