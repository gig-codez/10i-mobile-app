import '/exports/exports.dart';

class AllActivity extends StatefulWidget {
  const AllActivity({super.key});

  @override
  State<AllActivity> createState() => _AllActivityState();
}

class _AllActivityState extends State<AllActivity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("All Activity"),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("All Activity $index"),
                subtitle: Text("All Activity $index"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetail(),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
