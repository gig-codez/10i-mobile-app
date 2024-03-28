import "/exports/exports.dart";

class AllContacts extends StatefulWidget {
  const AllContacts({super.key});

  @override
  State<AllContacts> createState() => _AllContactsState();
}

class _AllContactsState extends State<AllContacts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/pngs/dp.jpeg"),
          radius: 40,
        ),
        title: Text("John Doe"),
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
        subtitle: Text("example@yahoo.com"),
        trailing: Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
