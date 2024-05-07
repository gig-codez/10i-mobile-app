import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatefulWidget {
  const TabBarMaterialWidget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  final int index;
  final ValueChanged<int> onChangedTab;

  @override
  State<TabBarMaterialWidget> createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTabItem(
              index: 0, icon: const Icon(Icons.home, size: 28), label: 'Home'),
          buildTabItem(
              index: 1,
              icon: const Icon(Icons.history, size: 28),
              label: 'Activity'),
          const SizedBox(width: 16), // Empty space for floating button
          buildTabItem(
              index: 2,
              icon: const Icon(Icons.downloading, size: 28),
              label: 'Invoice'),
          buildTabItem(
              index: 3,
              icon: const Icon(Icons.settings, size: 28),
              label: 'More'),
        ],
      ),
    );
  }

  Widget buildTabItem(
      {required int index, required Icon icon, required String label}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => widget.onChangedTab(index),
              icon: icon,
              color: widget.index == index ? Colors.blue : Colors.grey,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
        Positioned(
          top: 35, // Adjust the positioning of the label
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label,
              style: TextStyle(
                color: widget.index == index ? Colors.blue : Colors.grey,
                fontSize: 12, // Adjust the font size of the label
              ),
            ),
          ),
        ),
      ],
    );
  }
}
