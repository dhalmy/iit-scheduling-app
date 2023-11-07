import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/selected_courses.dart';
import 'package:provider/provider.dart';

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
                        children: [
                          // First tab bar view widget
                          Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Consumer<SelectedCourses>(
                                builder: (context, selectedCourses, child) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.64,
                                    width: double.maxFinite,
                                    child: ListView.separated(
                                      itemCount: selectedCourses.courses.length,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          height: 40,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Column(
                                              children: [
                                                const Flexible(
                                                    flex: 1,
                                                    child: SizedBox(
                                                      height: 10,
                                                    )),
                                                Flexible(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Flexible(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          width: 30,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 20,
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.012,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.012,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: SelectedCourseColor
                                                                    .values[
                                                                        index]
                                                                    .selectedColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              selectedCourses
                                                                      .courses[
                                                                  index],
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: InkWell(
                                                          onTap: () {
                                                            selectedCourses
                                                                .removeCourse(
                                                                selectedCourses
                                                                    .courses[
                                                                index]);
                                                          },
                                                          child: const Icon(
                                                            Icons.close,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                      const Flexible(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          width: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Flexible(
                                                    flex: 1,
                                                    child: SizedBox(
                                                      height: 10,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: SizedBox(
                                                width: 30,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 20,
                                              child: Divider(
                                                thickness: 1.8,
                                                // color: Colors.black,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: SizedBox(
                                                width: 30,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  // Add your logic to generate here
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
