import "/exports/exports.dart";
import "./all_contacts.dart";
import "add_contact.dart";
// import "./favourites.dart";

class IndexSend extends StatefulWidget {
  const IndexSend({super.key});

  @override
  State<IndexSend> createState() => _IndexSendState();
}

class _IndexSendState extends State<IndexSend> with TickerProviderStateMixin {
  TabController? controller;
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    // controller = TabController(length: 2, vsync: this);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 902),
    )..forward();
  }

  @override
  void dispose() {
    animationController?.dispose();
    // controller!.dispose();
    super.dispose();
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
        actions: [
          IconButton(
            onPressed: () => Routes.push(const AddContact()),
            icon: const Icon(Icons.person_add_alt_1_rounded),
          )
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              12.0, 8.0, 12.0, 8.0), //const EdgeInsets.all(8.0),
          child: Center(
            child: AllContactsSend(),
          ),
        ),
      ),
    );
  }
}
