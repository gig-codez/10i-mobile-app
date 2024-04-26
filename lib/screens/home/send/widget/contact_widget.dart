import "/exports/exports.dart";

class ContactWidget extends StatelessWidget {
  final int id;
  const ContactWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserService.getUser(id),
        builder: (context, snap) {
          var d = snap.data;
          return snap.hasData
              ? ListTile(
                  onTap: () => Routes.routeTo(Routes.send),
                  onLongPress: () {},
                  leading: CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  title: Text("${d!.username}"),
                  titleTextStyle:
                      Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                  subtitle: const Text("example@yahoo.com"),
                  subtitleTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                  // trailing: Icon(
                  //   Icons.check,
                  //   color: Theme.of(context).primaryColor,
                  // ),
                )
              : CircularProgressIndicator.adaptive();
        });
  }
}
