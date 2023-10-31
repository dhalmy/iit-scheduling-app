import 'package:flutter/material.dart';

import '../query_logic/course.dart';
import 'course_item_widget.dart';

class QueryGrid extends StatelessWidget {
  final List<Course> courses;
  final int firstColumnCourseListLength;
  final int secondColumnCourseListLength;
  final int thirdColumnCourseListLength;

  const QueryGrid({
    Key? key,
    required this.courses,
    required this.firstColumnCourseListLength,
    required this.secondColumnCourseListLength,
    required this.thirdColumnCourseListLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gap = MediaQuery.of(context).size.width * 0.013;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: <Widget>[
                for (int i = 0; i < firstColumnCourseListLength; i += 3)
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0, bottom: gap, left: gap / 2, right: gap / 2),
                    child: CourseItemWidget(
                      course: courses[i],
                      isSmallWidget: true,
                    ),
                  ),
              ],
            ),
            Column(
              children: <Widget>[
                for (int i = 1; i < secondColumnCourseListLength; i += 3)
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0, bottom: gap, left: gap / 2, right: gap / 2),
                    child: CourseItemWidget(
                      course: courses[i],
                      isSmallWidget: false,
                    ),
                  ),
              ],
            ),
            Column(
              children: <Widget>[
                for (int i = 2; i < thirdColumnCourseListLength; i += 3)
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0, bottom: gap, left: gap / 2, right: gap / 2),
                    child: CourseItemWidget(
                      course: courses[i],
                      isSmallWidget: true,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
