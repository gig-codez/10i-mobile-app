import "/exports/exports.dart";
import "add_contact.dart";
import "dart:async";
class AllContactsSend extends StatefulWidget {
  const AllContactsSend({super.key});

  @override
  State<AllContactsSend> createState() => _AllContactsSendState();
}

class _AllContactsSendState extends State<AllContactsSend> {
  StreamController<List<dynamic>> _contactController = StreamController<List<dynamic>>();
  Timer? _timer;
   @override
  void initState() {
    super.initState();
    fetchContacts();
  }
void fetchContacts() async {
  var contacts = await UserService.getContactsList();
  _contactController.sink.add(contacts);
  _timer = Timer.periodic(const Duration(milliseconds:1000),(timer) async {
    var contacts = await UserService.getContactsList();
    _contactController.sink.add(contacts);
  });
}

@override
void dispose(){
   if(_contactController.hasListener){
    _contactController.close();
  }
  if(_timer != null){
    _timer!.cancel();
  }
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _contactController.stream,
      builder: (context, snapshot) {
        var d = snapshot.data ?? [];
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
                    itemCount: d.length,
                    itemBuilder: (context, index) =>
                        ContactWidget(id: d[index]['contact'],contactId:d[index]['id'],),
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
