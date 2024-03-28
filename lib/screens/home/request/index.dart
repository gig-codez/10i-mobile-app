import "/exports/exports.dart";

class IndexRequest extends StatefulWidget {
  const IndexRequest({super.key});

  @override
  State<IndexRequest> createState() => _IndexRequestState();
}

class _IndexRequestState extends State<IndexRequest>
    with TickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonTextField(
              hintText: "Search name, username or email",
              fieldColor: Colors.grey.shade200,
              controller: TextEditingController(),
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
                  AllContacts(),
                  FavouritesReq(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
