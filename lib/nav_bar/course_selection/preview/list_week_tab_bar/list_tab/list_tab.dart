import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../selected_courses.dart';
import '../../../selected_courses_color.dart';
import 'schedule_api.dart';

class ListTab extends StatelessWidget {
  const ListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Consumer<SelectedCourses>(
          builder: (context, selectedCourses, child) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.64,
              width: double.maxFinite,
              child: ListView.separated(
                itemCount: selectedCourses.courses.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.012,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.012,
                                        decoration: BoxDecoration(
                                          color: SelectedCourseColor
                                              .values[index].selectedColor,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        selectedCourses.courses[index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      selectedCourses.removeCourse(
                                          selectedCourses.courses[index]);
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
          onPressed: () async {
            var selectedCourses =
                Provider.of<SelectedCourses>(context, listen: false);
            try {
              var courseDetail = await getCourseDetails(selectedCourses);
              print("courseDetail: $courseDetail");
            } catch (e) {
              print("Error fetching course details: $e");
            }
          },
          child: const Text("Generate"),
        )
      ],
    );
  }
}