import "/exports/exports.dart";

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  List<ContactsModel> contacts = [];
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
                controller: TextEditingController(),
                onChanged: (x) {
                  UserService.getUsers(query: x).then((value) {
                    print(value.length);
                    setState(() {
                      contacts = value;
                    });
                  });
                },
                radius: 10,
                icon: Icons.search_rounded,
                keyboardType: TextInputType.number,
                contentPadding: const EdgeInsets.fromLTRB(5, 7, 0, 5),
                readOnly: false,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) => ProfileWidget(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
