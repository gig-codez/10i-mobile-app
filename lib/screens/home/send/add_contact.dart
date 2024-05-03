import "/exports/exports.dart";
import "dart:async";

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String query = "";
  final StreamController<List<ContactsModel>> _resultController =
      StreamController<List<ContactsModel>>();
  void fetchRecords() async {
    var results = await UserService.getUsers(query: query);
    _resultController.add(results);

    Timer.periodic(const Duration(milliseconds: 900), (timer) async {
      results = await UserService.getUsers(query: query);
      _resultController.add(results);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRecords();
  }

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
          child: Column(
            children: [
              CommonTextField(
                hintText: "Search name, username or email",
                fieldColor: Colors.grey.shade200,
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                radius: 10,
                icon: Icons.search_rounded,
                contentPadding: const EdgeInsets.fromLTRB(5, 7, 0, 5),
                readOnly: false,
              ),
              Flexible(
                child: StreamBuilder(
                    stream: _resultController.stream,
                    builder: (context, snapshot) {
                      var contacts = snapshot.data ?? [];
                      return snapshot.hasData
                          ? contacts.isEmpty
                              ? Center(
                                  child: Text("No results found for $query"),
                                )
                              : ListView.builder(
                                  itemCount: contacts.length,
                                  itemBuilder: (context, index) =>
                                      ProfileWidget(
                                    titleText:
                                        "${contacts[index].firstName} ${contacts[index].lastName}",
                                    subText: contacts[index].email,
                                    icon: Icons.person,
                                    onPress: () {
                                      UserService.createContactList({
                                        "contact": contacts[index].id,
                                      });
                                    },
                                  ),
                                )
                          : const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
