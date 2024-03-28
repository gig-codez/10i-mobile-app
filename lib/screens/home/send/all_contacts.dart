import "/exports/exports.dart";

class AllContactsSend extends StatefulWidget {
  const AllContactsSend({super.key});

  @override
  State<AllContactsSend> createState() => _AllContactsSendState();
}

class _AllContactsSendState extends State<AllContactsSend> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () => Routes.routeTo(Routes.send),
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
