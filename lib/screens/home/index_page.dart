import "/exports/exports.dart";

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
  }

  final pageController = PageController(initialPage: 0);
  // selected nav item
  int selected = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    ActivityPage(),
    AnalyticsPage(),
    Invoices(),
    MoreDetails(),
  ];
  final String ext = "assets/svgs/";
  List<Map<String, dynamic>> bottomNavs = [
    {"label": "Home", "icon": "home.svg", "un": "home_un.svg"},
    {"label": "Activity", "icon": "activity.svg", "un": "activity.svg"},
    {"label": "Analytics", "icon": "analytics_un.svg", "un": "analytics.svg"},
    {"label": "Invoicing", "icon": "page.svg", "un": "page_un.svg"},
    {"label": "More", "icon": "more_un.svg", "un": "more.svg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).primaryColor.withAlpha(230),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 700),
            curve: Curves.decelerate,
          );
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedIconTheme: const IconThemeData(size: 30),
        currentIndex: selected,
        items: List.generate(
          bottomNavs.length,
          (index) => BottomNavigationBarItem(
            label: bottomNavs[index]['label'],
            icon: SvgPicture.asset(
              "$ext${selected == index ? bottomNavs[index]['icon'] : bottomNavs[index]['un']}",
              color: selected == index
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
