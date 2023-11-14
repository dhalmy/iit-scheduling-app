import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/list_week_tab_bar/list_tab/list_tab.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/list_week_tab_bar/week_tab/week_tab.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/selected_courses.dart';
import 'package:provider/provider.dart';
import 'list_tab/schedule_api.dart';


import '../../selected_courses_color.dart';

class ListWeekTabBar extends StatelessWidget {
  const ListWeekTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.825,
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
                child: TabBar(
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  controller: DefaultTabController.of(context),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xFF00BD90),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: 'List'),
                    Tab(text: 'Week'),
                  ],
                ),
              ),
            ),
            // Tab bar view here
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: MediaQuery.of(context).size.height * 0.705,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollUpdateNotification) {
                      return false;
                    }
                    return true;
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.705,
                      child: TabBarView(
                        controller: DefaultTabController.of(context),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
