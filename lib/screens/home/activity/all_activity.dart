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
              return Container(
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6),
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    "All Activity $index",
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    "All Activity $index",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActivityDetail(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
