import "/exports/exports.dart";
import "add_contact.dart";
import "dart:async";

class AllContactsSend extends StatefulWidget {
  const AllContactsSend({super.key});

  @override
  State<AllContactsSend> createState() => _AllContactsSendState();
}

class _AllContactsSendState extends State<AllContactsSend> {
  // -------------------------------------
  final StreamController<List<dynamic>> _contactController =
      StreamController<List<dynamic>>();
  // -------------------------------------
  Timer? _timer;
  // -------------------------------------

  void fetchContacts() async {
    var contacts = await UserService.getContactsList();
    _contactController.add(contacts);
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) async {
      var contacts = await UserService.getContactsList();
      _contactController.add(contacts);
    });
  }

  // ---------------------------
  @override
  void initState() {
    super.initState();
    // fetchContacts();
  }

  // ----------------------------
  @override
  void dispose() {
    if (_contactController.hasListener) {
      _contactController.close();
    }
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  void _refreshPage() {
    setState(() {
      // _updateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataController>(
        builder: (context, controller, c) {
          var d = controller.contacts;
          return d.isEmpty
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
                  itemBuilder: (context, index) => ContactWidget(
                    controller: controller,
                    id: d[index]['contact'],
                    contactId: d[index]['id'],
                  ),
                );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _refreshPage,
      //   child: const Icon(Icons.refresh_rounded),
      // ),
    );
  }
}
