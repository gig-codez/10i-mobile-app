import '/exports/exports.dart';

class SentActivity extends StatefulWidget {
  const SentActivity({super.key});

  @override
  State<SentActivity> createState() => _SentActivityState();
}

class _SentActivityState extends State<SentActivity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("Sent Activity"),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Sent Activity $index"),
                subtitle: Text("Sent Activity $index"),
              );
            },
          ),
        ),
      ],
    );
  }
}
