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
      appBar: AppBar(
        title: const Text("Activity"),
        bottom: TabBar(
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
