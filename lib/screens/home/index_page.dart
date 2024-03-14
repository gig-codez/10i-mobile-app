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

  final _pageController = PageController(initialPage: 1);
  int initialPage = 1;
  final List<Widget> _pages = [
    MoreDetails(),
    HomeScreen(),
    MoreDetails(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? const Color.fromARGB(255, 245, 245, 245)
              : Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: GNav(
              // rippleColor: Colors.grey[300]!,
              // hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: const Color.fromARGB(255, 0, 0, 0),
              iconSize: 28,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
              duration: const Duration(milliseconds: 100),
              tabBackgroundColor:
                  Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).primaryColor.withAlpha(30)
                      : Colors.white70.withAlpha(400),
              color: Colors.grey[400]!,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Theme.of(context).primaryColor),
              tabActiveBorder: Border.all(
                color: Theme.of(context).primaryColor.withAlpha(20),
                width: 1,
              ), // tab button border
              // tabBorder:
              // Border.all(color: Colors.grey, width: 1), // t/ tab button shadow
              curve: Curves.easeOutExpo, // tab animation curves

              tabs: [
                GButton(
                  icon: Icons.file_open_rounded,
                  text: 'Invoices',
                  iconActiveColor: Theme.of(context).primaryColor,
                ),
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  iconActiveColor: Theme.of(context).primaryColor,
                ),
                GButton(
                  icon: Icons.more_horiz_rounded,
                  text: 'More',
                  iconActiveColor: Theme.of(context).primaryColor,
                ),
              ],
              selectedIndex: initialPage,
              onTabChange: (index) {
                setState(() {
                  initialPage = index;
                });
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
            ),
          ),
        ),
      ),
    );
  }
}
