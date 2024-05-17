import '/exports/exports.dart';

class ActivityDetail extends StatefulWidget {
  const ActivityDetail({super.key});

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "John Doe",
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "UGX 5,000",
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      fontWeightDelta: 410,
                      fontSizeFactor: 1.85,
                    ),
              ),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
                side: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "From",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Text(
                      "1234567890",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 410,
                          ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Email",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Text(
                      "1234567890",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 410,
                          ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Date",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Text(
                      "1234567890",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 410,
                          ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Amount",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Text(
                      "1234567890",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 410,
                          ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Item",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Text(
                      "1234567890",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 410,
                          ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Transaction ID",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Text(
                      "1234567890",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 410,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
