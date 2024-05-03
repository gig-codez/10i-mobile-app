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
              onPressed: () => Routes.push(const Split()),
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
                          children: [
                            Text(
                              "No Bills yet",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            // outlined button to add a bills
                            OutlinedButton.icon(
                                onPressed: () => Routes.push(const Split()),
                                label: const Text("Add a Bill"),
                                icon: const Icon(Icons.add)),
                          ],
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(data[index].billType.toString()),
                              subtitle: Text(
                                data[index].amount.toString(),
                              ),
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
