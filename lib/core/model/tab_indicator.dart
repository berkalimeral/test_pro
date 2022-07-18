import 'package:flutter/material.dart';

import 'package:test_pro/core/model/register_page3_model.dart';

class TabIndicator extends StatefulWidget {
  const TabIndicator({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);
  final int selectedIndex;

  @override
  State<TabIndicator> createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: RegisterModels.registerItems.length, vsync: this);
  }

  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
    );
  }
}
