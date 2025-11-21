import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MsBottomBarExampleView extends StatefulWidget
    with LabeledWidgetMixin {
  const MsBottomBarExampleView({super.key});

  @override
  State<MsBottomBarExampleView> createState() => _MsBottomBarExampleViewState();

  @override
  String get label => 'MsBottomBar Example';
}

final class _MsBottomBarExampleViewState extends State<MsBottomBarExampleView> {
  var _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.label),
      ),
      bottomNavigationBar: MsBottomBar(
        currentTabIndex: _currentIndex,
        onTabSelected: _onTabSelected,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        items: const [
          MsBottomBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            selectedColor: Colors.purple,
          ),
          MsBottomBarItem(
            label: 'Search',
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            selectedColor: Colors.pink,
          ),
          MsBottomBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
