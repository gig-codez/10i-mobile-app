import "/exports/exports.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color.fromRGBO(18, 64, 118, 1),
      ),
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(18, 64, 118, 1),
            child: const Column(
              children: [
                DashCard(),
                Expanded(
                  flex: 3,
                  child: ServicesWidget(),
                ),
                Expanded(
                  flex: 3,
                  child: RecentActivities(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
