import '/exports/exports.dart';

class ReceivedActivity extends StatefulWidget {
  const ReceivedActivity({super.key});

  @override
  State<ReceivedActivity> createState() => _ReceivedActivityState();
}

class _ReceivedActivityState extends State<ReceivedActivity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("Received Activity"),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Received Activity $index"),
                subtitle: Text("Received Activity $index"),
              );
            },
          ),
        ),
      ],
    );
  }
}
