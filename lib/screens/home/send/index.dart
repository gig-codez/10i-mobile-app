import "/exports/exports.dart";
import "./all_contacts.dart";
import "./favourites.dart";

class IndexSend extends StatefulWidget {
  const IndexSend({super.key});

  @override
  State<IndexSend> createState() => _IndexSendState();
}

class _IndexSendState extends State<IndexSend> with TickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Send Money to",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              12.0, 8.0, 12.0, 8.0), //const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CommonTextField(
                hintText: "Search name, username or email",
                fieldColor: Colors.grey.shade200,
                controller: TextEditingController(),
                // enableBorder: true,
                radius: 10,
                icon: Icons.search_rounded,
                keyboardType: TextInputType.number,
                contentPadding: const EdgeInsets.fromLTRB(5, 7, 0, 5),
                readOnly: false,
              ),
              Flexible(
                child: TabBar(
                  controller: controller,
                  tabs: [
                    Tab(
                      child: Text(
                        "All Contacts",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Favourites",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: TabBarView(
                  controller: controller,
                  children: const [
                    Center(
                      child: AllContacts(),
                    ),
                    Center(
                      child: Favourites(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
