import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/selected_courses.dart';
import 'package:provider/provider.dart';
import 'schedule_api.dart';


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
                        children: [
                          // First tab bar view widget
                          Column(
                            children: [
                              Consumer<SelectedCourses>(
                                builder: (context, selectedCourses, child) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.66,
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      itemCount: selectedCourses.courses.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(selectedCourses.courses[index]),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  var selectedCourses = Provider.of<SelectedCourses>(context, listen: false);
                                  var courseDetail = getCourseDetails(selectedCourses);
                                  print(courseDetail);
                                },
                                child: const Text("Generate"),
                              ),
                            ],
                          ),

                          // Second tab bar view widget
                          const Center(
                            child: Text(
                              'Week',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
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