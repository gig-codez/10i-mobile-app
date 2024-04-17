import "/exports/exports.dart";

class RecentActivities extends StatefulWidget {
  const RecentActivities({super.key});

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Activities",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Routes.routeTo(Routes.notifications);
                },
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("John Doe",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(fontWeightDelta: 80)),
                subtitle: const Text("Preapprove Payment - Completed"),
                trailing: Text(
                  "UGX 500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
