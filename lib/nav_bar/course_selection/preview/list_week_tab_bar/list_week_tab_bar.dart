import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/list_week_tab_bar/list_tab/list_tab.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/list_week_tab_bar/week_tab/week_tab.dart';

import 'custom_tab.dart';

class ListWeekTabBar extends StatefulWidget {
  const ListWeekTabBar({Key? key}) : super(key: key);

  @override
  State<ListWeekTabBar> createState() => _ListWeekTabBarState();
}

class _ListWeekTabBarState extends State<ListWeekTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 623,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.14,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTab(
                      label: 'List',
                      onTap: () {
                        if (mounted) {
                          _tabController.animateTo(0);
                        }
                      },
                      isSelected: _selectedIndex == 0,
                    ),
                  ),
                  const SizedBox(width: 8.0),  // Added gap
                  Expanded(
                    child: CustomTab(
                      label: 'Week',
                      onTap: () {
                        if (mounted) {
                          _tabController.animateTo(1);
                        }
                      },
                      isSelected: _selectedIndex == 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),  // Added space
          // Tab bar view here
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: MediaQuery.of(context).size.height * 0.705,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.705,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    // First tab bar view widget
                    ListTab(),
                    // Second tab bar view widget
                    WeekTab(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}