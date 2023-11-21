import 'package:flutter/material.dart';
import 'package:iitschedulingapp/hover_builder.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/grid_svg_icon_logic.dart';
import 'package:provider/provider.dart';

import '../../selected_courses.dart';
import '../query_logic/course.dart';

class CourseItemWidget extends StatelessWidget {
  final Course course;
  final bool isSmallWidget;

  const CourseItemWidget(
      {Key? key, required this.course, required this.isSmallWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmallWidget ? 125 : 154,
      width: isSmallWidget ? 205 : 258,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      course.courseCode,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: isSmallWidget ? 20 : 30,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    final selectedCoursesProvider =
                    context.read<SelectedCourses>();
                    selectedCoursesProvider.addCourse(
                      "${course.courseCode} ${course.courseTitle} - ${course.instructor} ~ ${course.days} ${course.time}",
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.add,
                        size: isSmallWidget ? 20 : 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
              overflow: TextOverflow.ellipsis,
              maxLines: isSmallWidget ? 3 : 4, // Adjust maxLines as needed
            ),
            const SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 1),
                    SizedBox(
                      child: Row(
                        children: [
                          const Text('Sections'),
                          const SizedBox(width: 2),
                          GridSvgIconLogic()
                              .getSectionsIcon(course.enrolled, course.max),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    const Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Text('Prerequisites'),
                        Icon(
                          Icons.question_mark_outlined,
                          size: 13,
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Catalog >'),
                    HoverBuilder(builder: (isHovering) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            'Evaluations >',
                            style: TextStyle(
                              fontWeight: isHovering ? FontWeight.w500 : FontWeight.w400,
                              fontSize: isHovering ? 16 : 14,
                            ),
                          ),
                          Positioned(
                            bottom: -10, // Adjust this value to move it below the parent
                            left: 0,
                            right: 0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: isHovering ? 200 : 0, // Adjust the height as needed
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ],
            ),
            // Add more Text widgets for other course details as needed
          ],
        ),
      ),
    );
  }
}