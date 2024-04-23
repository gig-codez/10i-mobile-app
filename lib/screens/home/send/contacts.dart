import "/exports/exports.dart";

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 10, 10),
            child: Text(
              "Select a contact",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(fontWeightDelta: 25),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () => Routes.routeTo(Routes.send),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/pngs/dp.jpeg"),
                  radius: 40,
                ),
                title: const Text("Matovu Henry"),
                titleTextStyle:
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                subtitle: const Text("example@yahoo.com"),
                trailing: Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
