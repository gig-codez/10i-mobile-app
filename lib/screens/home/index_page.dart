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

  final pageController = PageController(initialPage: 1);
  // selected nav item
  int selected = 0;
  final List<Widget> _pages = const [
    Invoices(),
    HomeScreen(),
    MoreDetails(),
    MoreDetails(),
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
      body: PageView.builder(
        controller: pageController,
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () =>
            Routes.pushPageWithRouteAndAnimation(const PaymentInfo()),
        child: const Icon(
          Icons.qr_code_2_rounded,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 700),
            curve: Curves.ease,
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
