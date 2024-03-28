import "/exports/exports.dart";

class FavouritesReq extends StatefulWidget {
  const FavouritesReq({super.key});

  @override
  State<FavouritesReq> createState() => _FavouritesReqState();
}

class _FavouritesReqState extends State<FavouritesReq> {
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
