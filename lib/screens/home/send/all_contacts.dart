import "/exports/exports.dart";

class AllContactsSend extends StatefulWidget {
  const AllContactsSend({super.key});

  @override
  State<AllContactsSend> createState() => _AllContactsSendState();
}

class _AllContactsSendState extends State<AllContactsSend> {
  // String userId = StorageService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService.getContactsList(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () => Routes.routeTo(Routes.send),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/pngs/dp.jpeg"),
                    radius: 40,
                  ),
                  title: const Text("John Doe"),
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
                  trailing: Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            : const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  SpaceWidget(space: 0.05),
                  Text("Loading...")
                ],
              );
      },
    );
  }
}
