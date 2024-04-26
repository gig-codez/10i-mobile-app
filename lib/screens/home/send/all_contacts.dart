import "/exports/exports.dart";
import "add_contact.dart";
import "./widget/contact_widget.dart";
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
        var d = snapshot.data ?? [];
        print(d.length);

        return snapshot.hasData
            ? d.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No Contacts found.",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SpaceWidget(space: 0.05),
                      CustomButton(
                        icon: Icons.add,
                        onPress: () => Routes.push(const AddContact()),
                        text: "Add Contact",
                      ),
                      const SpaceWidget(space: 0.05),
                    ],
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => 
                    ContactWidget(id:d[index]['contact']),
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
