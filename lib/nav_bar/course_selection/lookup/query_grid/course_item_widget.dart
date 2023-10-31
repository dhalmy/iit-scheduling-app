import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/grid_svg_icon_logic.dart';

import '../query_logic/course.dart';

class CourseItemWidget extends StatelessWidget {
  final Course course;
  final bool isSmallWidget;

  const CourseItemWidget(
      {super.key, required this.course, required this.isSmallWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmallWidget ? 125 : 155,
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
              const Column(
                children: [
                  Text('Catalog >'),
                  Text('Evaluations >'),
                ],
              )
            ],
          ),
          const Text('Course Description..'),
          Text('Course Title: ${course.courseTitle}'),
          Expanded(child: SizedBox(child: Text('Instructor: ${course.instructor}'))),
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      child: Row(
                children: [
                  const Text('Sections'),
                  GridSvgIconLogic()
                      .getSectionsIcon(course.enrolled, course.max),
                ],
              ))),
              const SizedBox(
                width: 2,
              ),
              Text(
                'Course Prerequisites',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: isSmallWidget ? 10 : 13),
              ),
              Icon(
                Icons.question_mark_outlined,
                size: isSmallWidget ? 10 : 13,
              ),
            ],
          ),
          // Add more Text widgets for other course details as needed
        ],
      ),
    );
  }
}
