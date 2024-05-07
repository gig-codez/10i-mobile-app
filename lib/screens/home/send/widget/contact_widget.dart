import "/exports/exports.dart";

class ContactWidget extends StatelessWidget {
  final int id;
  final int? contactId;
  final VoidCallback? onPress;
  final DataController controller;
  const ContactWidget(
      {super.key,
      required this.id,
      required this.controller,
      this.onPress,
      this.contactId});

  @override
  Widget build(BuildContext context) {
    // return Consumer<DataController>(builder: (context, controller, snap) {
    controller.fetchSingleUser(id);
    var d = controller.singleUser;
    return d == null
        ? const Center(
            child: LinearProgressIndicator(),
          )
        : ListTile(
            onTap: onPress ??
                () => Routes.push(SendMoney(
                      receiverId: d.id,
                      email: d.email,
                    )),
            onLongPress: () {
              showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      title: const Text("Delete Contact"),
                      content: const Text(
                          "Are you sure you want to delete this contact?"),
                      actions: [
                        TextButton(
                          onPressed: () => Routes.pop(),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            UserService().deleteUser(contactId ?? 0);
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    );
                  });
            },
            leading: CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person,
                size: 35,
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text("${d.username}"),
            titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
            subtitle: const Text("example"),
            subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
          );
  }
}
