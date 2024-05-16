import "package:teni_app/screens/home/split/bill_name.dart";

import "/exports/exports.dart";

class IndexBills extends StatefulWidget {
  const IndexBills({super.key});

  @override
  State<IndexBills> createState() => _IndexBillsState();
}

class _IndexBillsState extends State<IndexBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Bills",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Routes.push(const SplitPage()),
            )
          ]),
      body: SafeArea(
        child: FutureBuilder(
            future: BillService().getBills(),
            builder: (context, snapshot) {
              var data = snapshot.data ?? [];
              return snapshot.hasData
                  ? data.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "No Bills yet",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            const SpaceWidget(space: 0.09),
                            // outlined button to add a bills
                            OutlinedButton.icon(
                              onPressed: () => Routes.push(
                                const SplitPage(),
                              ),
                              label: const Text("Add a Bill"),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return BillName(
                              id: data[index].billType,
                              amount: data[index].amount.toString(),
                              billId: data[index].id,
                            );
                          })
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
            }),
      ),
    );
  }
}
