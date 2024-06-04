import 'package:flutter/material.dart';
import 'package:teni_app/exports/exports.dart';

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
      color: Color.fromRGBO(
        17,
        66,
        50,
        1,
      ),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTabItem(index: 0, icon: Icons.home, label: 'Home'),
          buildTabItem(index: 1, icon: Icons.history, label: 'Activity'),
          const SizedBox(width: 16), // Empty space for floating button
          buildTabItem(index: 2, icon: Icons.downloading, label: 'Invoice'),
          buildTabItem(index: 3, icon: Icons.settings, label: 'More'),
        ],
      ),
    );
  }

  Widget buildTabItem(
      {required int index, required IconData icon, required String label}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () => widget.onChangedTab(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: widget.index == index ? Colors.white : Colors.grey,
                size: 26,
              ),
              Text(
                label,
                style: TextStyle(
                  color: widget.index == index ? Colors.white : Colors.grey,
                  fontSize: 12, // Adjust the font size of the label
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
