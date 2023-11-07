import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/grid_svg_icon_logic.dart';
import 'package:provider/provider.dart';

import '../../selected_courses.dart';
import '../query_logic/course.dart';

class CourseItemWidget extends StatelessWidget {
  final Course course;
  final bool isSmallWidget;

  const CourseItemWidget(
      {super.key, required this.course, required this.isSmallWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmallWidget ? 125 : 154,
      width: isSmallWidget ? 205 : 258,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      child: Text(course.courseCode,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isSmallWidget ? 20 : 32)))),
              InkWell(
                onTap: () {
                  final selectedCoursesProvider = context.read<SelectedCourses>();
                  selectedCoursesProvider.addCourse("${course.courseCode} - ${course.courseTitle}");
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const Text('Course Description..'),
          Text('Course Title: ${course.courseTitle}'),
          Expanded(
              child: SizedBox(child: Text('Instructor: ${course.instructor}'))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 1,
                  ),
                  SizedBox(
                      child: Row(
                    children: [
                      const Text('Sections'),
                      const SizedBox(
                        width: 2,
                      ),
                      GridSvgIconLogic()
                          .getSectionsIcon(course.enrolled, course.max),
                    ],
                  )),
                  const SizedBox(
                    height: 1,
                  ),
                  const Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        'Prerequisites',
                      ),
                      Icon(
                        Icons.question_mark_outlined,
                        size: 13,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Catalog >'),
                  Text('Evaluations >'),
                ],
              ),
            ],
          ),
          // Add more Text widgets for other course details as needed
        ],
      ),
    );
  }
}
