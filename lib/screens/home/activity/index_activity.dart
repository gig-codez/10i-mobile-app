import 'package:flutter/material.dart';

import '/exports/exports.dart';

class IndexActivity extends StatefulWidget {
  const IndexActivity({super.key});

  @override
  State<IndexActivity> createState() => _IndexActivityState();
}

class _IndexActivityState extends State<IndexActivity>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(197, 235, 170, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(17, 66, 50, 1),
        title: const Text("Activity"),
        bottom: TabBar(
          labelColor: Colors.white,
          controller: tabController,
          tabs: const [
            Tab(
              text: "All",
            ),
            Tab(
              text: "Received",
            ),
            Tab(
              text: "Sent",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          AllActivity(),
          ReceivedActivity(),
          SentActivity(),
        ],
      ),
    );
  }
}
