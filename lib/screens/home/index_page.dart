import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:teni_app/screens/home/widgets/bottom_bar.dart";

import "/exports/exports.dart";

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final pageController = PageController(initialPage: 0);
  int _index = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    IndexActivity(),
    AnalyticsPage(),
    // Invoices(),
    MoreDetails(),
  ];

  // final String ext = "assets/svgs/";

  // List<Map<String, dynamic>> bottomNavs = [
  //   {"label": "Home", "icon": "home.svg", "un": "home_un.svg"},
  //   {"label": "Activity", "icon": "activity.svg", "un": "activity.svg"},
  //   {"label": "Analytics", "icon": "analytics_un.svg", "un": "analytics.svg"},
  //   {"label": "Invoicing", "icon": "page.svg", "un": "page_un.svg"},
  //   {"label": "More", "icon": "more_un.svg", "un": "more.svg"},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color.fromRGBO(18, 64, 118, 1),
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            return _pages[index];
          },
          onPageChanged: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
      ),
      // bottomNavigationBar: Container(

      // // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(30),
      //       // boxShadow: [
      //       //   BoxShadow(
      //       //     // spreadRadius: 0.5,
      //       //     blurRadius: 5,
      //       //     offset: Offset(0, -3), // Shadow at the top position of shadow
      //       //   ),
      //       // ],
      //     ),
      //     child: ClipRRect(
      //         borderRadius: BorderRadius.circular(30),
      //         child: MyBottomNavigationBar(
      //           index: _index, // Pass 'index' to TabBarMaterialWidget
      //           onChangedTab: (newIndex) {
      //             setState(() {
      //               _index = newIndex;
      //               pageController
      //                   .jumpToPage(newIndex); // Update the pageController
      //             });
      //           },
      //         ))),
      bottomNavigationBar: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: TabBarMaterialWidget(
            index: _index, // Pass 'index' to TabBarMaterialWidget
            onChangedTab: (newIndex) {
              setState(() {
                _index = newIndex;
                pageController
                    .jumpToPage(newIndex); // Update the pageController
              });
            },
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routes.routeTo(Routes.paymentInfo),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.qr_code,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(
          18,
          64,
          118,
          1,
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 6.0, // Adjust notch margin as needed
      //   clipBehavior: Clip.antiAlias,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      //     ),
      //     child: BottomNavigationBar(
      //       onTap: (index) {
      //         setState(() {
      //           selected = index;
      //         });
      //         pageController.animateToPage(
      //           index,
      //           duration: const Duration(milliseconds: 700),
      //           curve: Curves.decelerate,
      //         );
      //       },
      //       type: BottomNavigationBarType.fixed,
      //       selectedItemColor: Theme.of(context).primaryColor,
      //       selectedIconTheme: const IconThemeData(size: 30),
      //       currentIndex: selected,
      //       items: List.generate(
      //         bottomNavs.length,
      //         (index) => BottomNavigationBarItem(
      //           label: bottomNavs[index]['label'],
      //           icon: SvgPicture.asset(
      //             "$ext${selected == index ? bottomNavs[index]['icon'] : bottomNavs[index]['un']}",
      //             color: selected == index
      //                 ? Theme.of(context).primaryColor
      //                 : Colors.grey.shade400,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
